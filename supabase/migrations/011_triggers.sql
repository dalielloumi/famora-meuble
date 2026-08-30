-- ============================================================================
-- 011_triggers.sql
-- Triggers : calcul des lignes, immuabilité des documents validés,
-- génération des mouvements de stock, CMP, soldes tiers, caisse.
-- Ré-exécutable.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- A. Calcul automatique des montants de ligne (BEFORE INSERT/UPDATE).
-- Identique sur les 7 tables de lignes qui portent une TVA par taux.
-- ----------------------------------------------------------------------------

create or replace function app.calculer_ligne() returns trigger
language plpgsql as $$
declare
  v_taux numeric;
  v_calc record;
begin
  select taux into v_taux from taux_tva where id = new.taux_tva_id;
  select * into v_calc from app.calculer_montant_ligne(new.quantite, new.prix_unitaire, new.remise_pct, v_taux);
  new.montant_ht := v_calc.montant_ht;
  new.montant_tva := v_calc.montant_tva;
  return new;
end;
$$;

do $$
declare
  t text;
begin
  foreach t in array array[
    'devis_ligne', 'commande_client_ligne', 'commande_fournisseur_ligne',
    'facture_vente_ligne', 'facture_achat_ligne', 'avoir_vente_ligne', 'avoir_achat_ligne'
  ]
  loop
    execute format('drop trigger if exists trg_calculer_ligne on %I', t);
    execute format(
      'create trigger trg_calculer_ligne before insert or update on %I for each row execute function app.calculer_ligne()',
      t
    );
  end loop;
end $$;

-- ----------------------------------------------------------------------------
-- B. Recalcul des totaux du document parent après toute modification de ligne.
-- ----------------------------------------------------------------------------

create or replace function app.apres_ligne_devis() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_totaux_devis(coalesce(new.devis_id, old.devis_id));
  return coalesce(new, old);
end;
$$;

create or replace function app.apres_ligne_commande_client() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_totaux_commande_client(coalesce(new.commande_id, old.commande_id));
  return coalesce(new, old);
end;
$$;

create or replace function app.apres_ligne_commande_fournisseur() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_totaux_commande_fournisseur(coalesce(new.commande_id, old.commande_id));
  return coalesce(new, old);
end;
$$;

create or replace function app.apres_ligne_facture_vente() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_totaux_facture_vente(coalesce(new.facture_id, old.facture_id));
  return coalesce(new, old);
end;
$$;

create or replace function app.apres_ligne_facture_achat() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_totaux_facture_achat(coalesce(new.facture_id, old.facture_id));
  return coalesce(new, old);
end;
$$;

create or replace function app.apres_ligne_avoir_vente() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_totaux_avoir_vente(coalesce(new.avoir_id, old.avoir_id));
  return coalesce(new, old);
end;
$$;

create or replace function app.apres_ligne_avoir_achat() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_totaux_avoir_achat(coalesce(new.avoir_id, old.avoir_id));
  return coalesce(new, old);
end;
$$;

drop trigger if exists trg_apres_ligne_devis on devis_ligne;
create trigger trg_apres_ligne_devis after insert or update or delete on devis_ligne
  for each row execute function app.apres_ligne_devis();

drop trigger if exists trg_apres_ligne_commande_client on commande_client_ligne;
create trigger trg_apres_ligne_commande_client after insert or update or delete on commande_client_ligne
  for each row execute function app.apres_ligne_commande_client();

drop trigger if exists trg_apres_ligne_commande_fournisseur on commande_fournisseur_ligne;
create trigger trg_apres_ligne_commande_fournisseur after insert or update or delete on commande_fournisseur_ligne
  for each row execute function app.apres_ligne_commande_fournisseur();

drop trigger if exists trg_apres_ligne_facture_vente on facture_vente_ligne;
create trigger trg_apres_ligne_facture_vente after insert or update or delete on facture_vente_ligne
  for each row execute function app.apres_ligne_facture_vente();

drop trigger if exists trg_apres_ligne_facture_achat on facture_achat_ligne;
create trigger trg_apres_ligne_facture_achat after insert or update or delete on facture_achat_ligne
  for each row execute function app.apres_ligne_facture_achat();

drop trigger if exists trg_apres_ligne_avoir_vente on avoir_vente_ligne;
create trigger trg_apres_ligne_avoir_vente after insert or update or delete on avoir_vente_ligne
  for each row execute function app.apres_ligne_avoir_vente();

drop trigger if exists trg_apres_ligne_avoir_achat on avoir_achat_ligne;
create trigger trg_apres_ligne_avoir_achat after insert or update or delete on avoir_achat_ligne
  for each row execute function app.apres_ligne_avoir_achat();

-- ----------------------------------------------------------------------------
-- C. Immuabilité des documents validés (règle métier section 4).
-- BROUILLON : tout modifiable. VALIDE : seules les colonnes listées en
-- argument (+ statut/modifie_le) peuvent encore changer. ANNULE : figé.
-- Comme le recalcul des totaux (bloc B) réécrit toujours total_ht/total_tva/
-- total_ttc à partir des lignes, toute tentative de modifier les lignes d'un
-- document VALIDE échoue ici en cascade : les totaux recalculés diffèrent de
-- ceux figés à la validation, colonnes non listées en exception.
-- ----------------------------------------------------------------------------

create or replace function app.proteger_document() returns trigger
language plpgsql as $$
declare
  v_colonnes_autorisees text[] := array['statut', 'modifie_le'] || tg_argv;
  v_cle text;
begin
  if old.statut = 'ANNULE' then
    raise exception 'Document % annulé : aucune modification possible.', old.numero;
  end if;

  if old.statut = 'VALIDE' then
    if new.statut = 'BROUILLON' then
      raise exception 'Document % validé : retour en brouillon impossible.', old.numero;
    end if;

    for v_cle in select jsonb_object_keys(to_jsonb(old)) loop
      if not (v_cle = any (v_colonnes_autorisees))
         and (to_jsonb(old) -> v_cle) is distinct from (to_jsonb(new) -> v_cle) then
        raise exception 'Document % validé : la colonne % est immuable (annulation ou avoir requis).', old.numero, v_cle;
      end if;
    end loop;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_proteger_devis on devis;
create trigger trg_proteger_devis before update on devis for each row execute function app.proteger_document();

drop trigger if exists trg_proteger_commande_client on commande_client;
create trigger trg_proteger_commande_client before update on commande_client for each row execute function app.proteger_document();

drop trigger if exists trg_proteger_commande_fournisseur on commande_fournisseur;
create trigger trg_proteger_commande_fournisseur before update on commande_fournisseur for each row execute function app.proteger_document();

drop trigger if exists trg_proteger_bl on bl;
create trigger trg_proteger_bl before update on bl for each row execute function app.proteger_document();

drop trigger if exists trg_proteger_reception on reception;
create trigger trg_proteger_reception before update on reception for each row execute function app.proteger_document();

drop trigger if exists trg_proteger_facture_vente on facture_vente;
create trigger trg_proteger_facture_vente before update on facture_vente for each row
  execute function app.proteger_document('statut_paiement', 'montant_regle');

drop trigger if exists trg_proteger_facture_achat on facture_achat;
create trigger trg_proteger_facture_achat before update on facture_achat for each row
  execute function app.proteger_document('statut_paiement', 'montant_regle');

drop trigger if exists trg_proteger_avoir_vente on avoir_vente;
create trigger trg_proteger_avoir_vente before update on avoir_vente for each row execute function app.proteger_document();

drop trigger if exists trg_proteger_avoir_achat on avoir_achat;
create trigger trg_proteger_avoir_achat before update on avoir_achat for each row execute function app.proteger_document();

drop trigger if exists trg_proteger_inventaire on inventaire;
create trigger trg_proteger_inventaire before update on inventaire for each row execute function app.proteger_document();

-- ----------------------------------------------------------------------------
-- D. Mouvement de stock → mise à jour du cache stock (CMP à l'entrée,
-- valorisation au CMP courant à la sortie).
-- ----------------------------------------------------------------------------

create or replace function app.appliquer_mouvement_stock() returns trigger
language plpgsql as $$
declare
  v_stock numeric;
  v_cmp numeric;
  v_trouve boolean;
begin
  select quantite, cmp into v_stock, v_cmp
    from stock
   where article_id = new.article_id and depot_id = new.depot_id
     and variante_id is not distinct from new.variante_id
   for update;

  v_trouve := found;
  if not v_trouve then
    v_stock := 0;
    v_cmp := 0;
  end if;

  if new.sens = 'ENTREE' then
    v_cmp := app.nouveau_cmp(v_stock, v_cmp, new.quantite, new.prix_unitaire);
    v_stock := v_stock + new.quantite;
  else
    v_stock := v_stock - new.quantite;
  end if;

  if v_trouve then
    update stock set quantite = v_stock, cmp = v_cmp, modifie_le = now()
     where article_id = new.article_id and depot_id = new.depot_id
       and variante_id is not distinct from new.variante_id;
  else
    insert into stock (article_id, variante_id, depot_id, quantite, cmp)
    values (new.article_id, new.variante_id, new.depot_id, v_stock, v_cmp);
  end if;

  return new;
end;
$$;

drop trigger if exists trg_mouvement_stock_appliquer on mouvement_stock;
create trigger trg_mouvement_stock_appliquer
  after insert on mouvement_stock
  for each row execute function app.appliquer_mouvement_stock();

-- ----------------------------------------------------------------------------
-- E. Validation du BL : génère les sorties de stock (jamais la création) et
-- met à jour la quantité livrée de la commande client liée.
-- ----------------------------------------------------------------------------

create or replace function app.valider_bl() returns trigger
language plpgsql as $$
declare
  r record;
  v_cmp numeric;
begin
  for r in select * from bl_ligne where bl_id = new.id loop
    select cmp into v_cmp from stock
     where article_id = r.article_id and depot_id = new.depot_id
       and variante_id is not distinct from r.variante_id;

    insert into mouvement_stock (
      article_id, variante_id, depot_id, type_mouvement, sens, quantite, prix_unitaire,
      document_type, document_id, document_ligne_id, cree_par
    ) values (
      r.article_id, r.variante_id, new.depot_id, 'SORTIE_VENTE', 'SORTIE', r.quantite, coalesce(v_cmp, 0),
      'BL', new.id, r.id, new.cree_par
    );

    if r.commande_ligne_id is not null then
      update commande_client_ligne
         set quantite_livree = quantite_livree + r.quantite
       where id = r.commande_ligne_id;
    end if;
  end loop;

  return new;
end;
$$;

drop trigger if exists trg_valider_bl on bl;
create trigger trg_valider_bl
  after update on bl
  for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.valider_bl();

-- ----------------------------------------------------------------------------
-- F. Validation de la réception : génère les entrées de stock et met à jour
-- la quantité reçue de la commande fournisseur liée.
-- ----------------------------------------------------------------------------

create or replace function app.valider_reception() returns trigger
language plpgsql as $$
declare
  r record;
begin
  for r in select * from reception_ligne where reception_id = new.id loop
    insert into mouvement_stock (
      article_id, variante_id, depot_id, type_mouvement, sens, quantite, prix_unitaire,
      document_type, document_id, document_ligne_id, cree_par
    ) values (
      r.article_id, r.variante_id, new.depot_id, 'ENTREE_ACHAT', 'ENTREE', r.quantite, r.prix_unitaire,
      'RECEPTION', new.id, r.id, new.cree_par
    );

    if r.commande_ligne_id is not null then
      update commande_fournisseur_ligne
         set quantite_recue = quantite_recue + r.quantite
       where id = r.commande_ligne_id;
    end if;
  end loop;

  return new;
end;
$$;

drop trigger if exists trg_valider_reception on reception;
create trigger trg_valider_reception
  after update on reception
  for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.valider_reception();

-- ----------------------------------------------------------------------------
-- G. Ordre de fabrication : garde d'immuabilité dédiée (cycle de vie propre),
-- lancement (consommation composants) et clôture (production du fini).
-- ----------------------------------------------------------------------------

create or replace function app.proteger_of() returns trigger
language plpgsql as $$
declare
  v_colonnes_autorisees text[] := array['statut', 'modifie_le'] || tg_argv;
  v_cle text;
begin
  if old.statut in ('ANNULE', 'CLOTURE') then
    raise exception 'OF % au statut % : aucune modification possible.', old.numero, old.statut;
  end if;

  if old.statut = 'LANCE' and new.statut = 'BROUILLON' then
    raise exception 'OF % lancé : retour en brouillon impossible.', old.numero;
  end if;

  if old.statut = 'LANCE' then
    for v_cle in select jsonb_object_keys(to_jsonb(old)) loop
      if not (v_cle = any (v_colonnes_autorisees))
         and (to_jsonb(old) -> v_cle) is distinct from (to_jsonb(new) -> v_cle) then
        raise exception 'OF % lancé : la colonne % est immuable hors production/statut.', old.numero, v_cle;
      end if;
    end loop;
  end if;

  return new;
end;
$$;

drop trigger if exists trg_proteger_of on ordre_fabrication;
create trigger trg_proteger_of before update on ordre_fabrication for each row
  execute function app.proteger_of('cout_matiere', 'quantite_produite', 'date_lancement', 'date_cloture');

create or replace function app.lancer_of() returns trigger
language plpgsql as $$
declare
  r record;
  v_cmp numeric;
  v_cout numeric := 0;
  v_qte_composant numeric;
  v_montant numeric;
begin
  for r in
    select nl.composant_id, nl.quantite
      from nomenclature_ligne nl
     where nl.nomenclature_id = new.nomenclature_id
  loop
    v_qte_composant := round(r.quantite * new.quantite_prevue, 3);

    select cmp into v_cmp from stock
     where article_id = r.composant_id and depot_id = new.depot_source_id and variante_id is null;
    v_cmp := coalesce(v_cmp, 0);
    v_montant := round(v_qte_composant * v_cmp, 3);

    insert into mouvement_stock (
      article_id, depot_id, type_mouvement, sens, quantite, prix_unitaire,
      document_type, document_id, cree_par
    ) values (
      r.composant_id, new.depot_source_id, 'SORTIE_PRODUCTION', 'SORTIE', v_qte_composant, v_cmp,
      'OF', new.id, new.cree_par
    );

    insert into of_consommation (of_id, article_id, quantite, cmp_unitaire, montant)
    values (new.id, r.composant_id, v_qte_composant, v_cmp, v_montant);

    v_cout := v_cout + v_montant;
  end loop;

  update ordre_fabrication set cout_matiere = v_cout where id = new.id;

  return new;
end;
$$;

drop trigger if exists trg_lancer_of on ordre_fabrication;
create trigger trg_lancer_of
  after update on ordre_fabrication
  for each row
  when (old.statut = 'BROUILLON' and new.statut = 'LANCE')
  execute function app.lancer_of();

create or replace function app.cloturer_of() returns trigger
language plpgsql as $$
declare
  v_cout_unitaire numeric;
begin
  if new.quantite_produite <= 0 then
    raise exception 'Quantité produite doit être positive pour clôturer l''OF %.', new.numero;
  end if;

  v_cout_unitaire := round(new.cout_matiere / new.quantite_produite, 3);

  insert into mouvement_stock (
    article_id, depot_id, type_mouvement, sens, quantite, prix_unitaire,
    document_type, document_id, cree_par
  ) values (
    new.article_id, new.depot_destination_id, 'ENTREE_PRODUCTION', 'ENTREE', new.quantite_produite, v_cout_unitaire,
    'OF', new.id, new.cree_par
  );

  return new;
end;
$$;

drop trigger if exists trg_cloturer_of on ordre_fabrication;
create trigger trg_cloturer_of
  after update on ordre_fabrication
  for each row
  when (old.statut = 'LANCE' and new.statut = 'CLOTURE')
  execute function app.cloturer_of();

-- ----------------------------------------------------------------------------
-- H. Règlements : affectation aux factures, statut de paiement, solde tiers.
-- ----------------------------------------------------------------------------

create or replace function app.appliquer_affectation_reglement() returns trigger
language plpgsql as $$
declare
  v_total_ttc numeric;
  v_montant_regle numeric;
  v_statut statut_paiement;
  v_tiers_id uuid;
begin
  if new.facture_vente_id is not null then
    update facture_vente
       set montant_regle = montant_regle + new.montant_affecte
     where id = new.facture_vente_id
     returning total_ttc, montant_regle into v_total_ttc, v_montant_regle;

    v_statut := case
      when v_montant_regle <= 0 then 'IMPAYE'
      when v_montant_regle < v_total_ttc then 'PARTIEL'
      else 'SOLDE'
    end;

    update facture_vente set statut_paiement = v_statut where id = new.facture_vente_id;
  elsif new.facture_achat_id is not null then
    update facture_achat
       set montant_regle = montant_regle + new.montant_affecte
     where id = new.facture_achat_id
     returning total_ttc, montant_regle into v_total_ttc, v_montant_regle;

    v_statut := case
      when v_montant_regle <= 0 then 'IMPAYE'
      when v_montant_regle < v_total_ttc then 'PARTIEL'
      else 'SOLDE'
    end;

    update facture_achat set statut_paiement = v_statut where id = new.facture_achat_id;
  end if;

  select tiers_id into v_tiers_id from reglement where id = new.reglement_id;
  perform app.recalculer_solde_tiers(v_tiers_id);

  return new;
end;
$$;

drop trigger if exists trg_appliquer_affectation on reglement_affectation;
create trigger trg_appliquer_affectation
  after insert on reglement_affectation
  for each row execute function app.appliquer_affectation_reglement();

-- Un effet impayé annule l'affectation qu'il finançait et remet le solde à découvert.
create or replace function app.appliquer_effet_impaye() returns trigger
language plpgsql as $$
declare
  r record;
  v_total_ttc numeric;
  v_montant_regle numeric;
  v_statut statut_paiement;
  v_tiers_id uuid;
begin
  for r in select * from reglement_affectation where reglement_id = new.reglement_id loop
    if r.facture_vente_id is not null then
      update facture_vente
         set montant_regle = greatest(montant_regle - r.montant_affecte, 0)
       where id = r.facture_vente_id
       returning total_ttc, montant_regle into v_total_ttc, v_montant_regle;

      v_statut := case
        when v_montant_regle <= 0 then 'IMPAYE'
        when v_montant_regle < v_total_ttc then 'PARTIEL'
        else 'SOLDE'
      end;

      update facture_vente set statut_paiement = v_statut where id = r.facture_vente_id;
    elsif r.facture_achat_id is not null then
      update facture_achat
         set montant_regle = greatest(montant_regle - r.montant_affecte, 0)
       where id = r.facture_achat_id
       returning total_ttc, montant_regle into v_total_ttc, v_montant_regle;

      v_statut := case
        when v_montant_regle <= 0 then 'IMPAYE'
        when v_montant_regle < v_total_ttc then 'PARTIEL'
        else 'SOLDE'
      end;

      update facture_achat set statut_paiement = v_statut where id = r.facture_achat_id;
    end if;
  end loop;

  select tiers_id into v_tiers_id from reglement where id = new.reglement_id;
  perform app.recalculer_solde_tiers(v_tiers_id);

  return new;
end;
$$;

drop trigger if exists trg_effet_impaye on effet;
create trigger trg_effet_impaye
  after update on effet
  for each row
  when (old.statut <> 'IMPAYE' and new.statut = 'IMPAYE')
  execute function app.appliquer_effet_impaye();

-- Recalcul systématique du solde tiers dès qu'une facture ou un avoir change d'état.

create or replace function app.trg_solde_facture_vente() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_solde_tiers(new.client_id);
  return new;
end;
$$;

drop trigger if exists trg_solde_facture_vente on facture_vente;
create trigger trg_solde_facture_vente after insert or update on facture_vente
  for each row execute function app.trg_solde_facture_vente();

create or replace function app.trg_solde_facture_achat() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_solde_tiers(new.fournisseur_id);
  return new;
end;
$$;

drop trigger if exists trg_solde_facture_achat on facture_achat;
create trigger trg_solde_facture_achat after insert or update on facture_achat
  for each row execute function app.trg_solde_facture_achat();

create or replace function app.trg_solde_avoir_vente() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_solde_tiers(new.client_id);
  return new;
end;
$$;

drop trigger if exists trg_solde_avoir_vente on avoir_vente;
create trigger trg_solde_avoir_vente after insert or update on avoir_vente
  for each row execute function app.trg_solde_avoir_vente();

create or replace function app.trg_solde_avoir_achat() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_solde_tiers(new.fournisseur_id);
  return new;
end;
$$;

drop trigger if exists trg_solde_avoir_achat on avoir_achat;
create trigger trg_solde_avoir_achat after insert or update on avoir_achat
  for each row execute function app.trg_solde_avoir_achat();

create or replace function app.trg_solde_reglement() returns trigger
language plpgsql as $$
begin
  perform app.recalculer_solde_tiers(new.tiers_id);
  return new;
end;
$$;

drop trigger if exists trg_solde_reglement on reglement;
create trigger trg_solde_reglement after insert on reglement
  for each row execute function app.trg_solde_reglement();

-- ----------------------------------------------------------------------------
-- I. Caisse — solde mis à jour à chaque opération.
-- ----------------------------------------------------------------------------

create or replace function app.appliquer_caisse_operation() returns trigger
language plpgsql as $$
begin
  if new.sens = 'ENCAISSEMENT' then
    update caisse set solde = solde + new.montant where id = new.caisse_id;
  else
    update caisse set solde = solde - new.montant where id = new.caisse_id;
  end if;
  return new;
end;
$$;

drop trigger if exists trg_caisse_operation on caisse_operation;
create trigger trg_caisse_operation after insert on caisse_operation
  for each row execute function app.appliquer_caisse_operation();
