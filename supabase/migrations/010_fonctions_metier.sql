-- ============================================================================
-- 010_fonctions_metier.sql
-- next_numero(), calcul des lignes/totaux, CMP.
-- Ré-exécutable. Les fonctions publiques (schéma public) sont exposées en RPC
-- PostgREST ; les fonctions internes (schéma app) ne le sont pas.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- next_numero — numérotation séquentielle continue sans trou, par type de
-- document et par exercice. Verrou pessimiste via SELECT ... FOR UPDATE.
-- Jamais de numéro généré côté client (règle métier section 4).
-- ----------------------------------------------------------------------------

create or replace function next_numero(p_type_document type_document, p_exercice_id uuid) returns text
language plpgsql as $$
declare
  v_annee integer;
  v_prefixe text;
  v_dernier integer;
begin
  select annee into v_annee from exercice where id = p_exercice_id;
  if v_annee is null then
    raise exception 'Exercice % introuvable', p_exercice_id;
  end if;

  v_prefixe := case p_type_document
    when 'DEVIS' then 'DEV'
    when 'COMMANDE_CLIENT' then 'CC'
    when 'BL' then 'BL'
    when 'FACTURE_VENTE' then 'FV'
    when 'AVOIR_VENTE' then 'AV'
    when 'COMMANDE_FOURNISSEUR' then 'CF'
    when 'RECEPTION' then 'REC'
    when 'FACTURE_ACHAT' then 'FA'
    when 'AVOIR_ACHAT' then 'AA'
    when 'OF' then 'OF'
    when 'INVENTAIRE' then 'INV'
    when 'REGLEMENT' then 'RG'
    when 'SAV' then 'SAV'
    when 'TOURNEE_LIVRAISON' then 'TL'
  end;

  insert into sequence_document (type_document, exercice_id, dernier_numero)
  values (p_type_document, p_exercice_id, 0)
  on conflict (type_document, exercice_id) do nothing;

  select dernier_numero into v_dernier
    from sequence_document
   where type_document = p_type_document and exercice_id = p_exercice_id
   for update;

  v_dernier := v_dernier + 1;

  update sequence_document
     set dernier_numero = v_dernier
   where type_document = p_type_document and exercice_id = p_exercice_id;

  return format('%s-%s-%s', v_prefixe, v_annee, lpad(v_dernier::text, 6, '0'));
end;
$$;

-- ----------------------------------------------------------------------------
-- app.calculer_montant_ligne — étapes 1 et 3 du calcul des totaux (section 4) :
--   montant_ht_ligne = quantite × prix_unitaire × (1 - remise_pct/100)
--   montant_tva_ligne = montant_ht_ligne × taux_tva/100
-- Utilisée par les triggers BEFORE INSERT/UPDATE des tables *_ligne (migration 011).
-- ----------------------------------------------------------------------------

create or replace function app.calculer_montant_ligne(
  p_quantite numeric,
  p_prix_unitaire numeric,
  p_remise_pct numeric,
  p_taux_tva numeric,
  out montant_ht numeric,
  out montant_tva numeric
) language plpgsql as $$
begin
  montant_ht := round(p_quantite * p_prix_unitaire * (1 - p_remise_pct / 100), 3);
  montant_tva := round(montant_ht * p_taux_tva / 100, 3);
end;
$$;

-- ----------------------------------------------------------------------------
-- app.sommes_lignes — étapes 2 et 4 : agrégation des lignes d'un document.
-- ----------------------------------------------------------------------------

create or replace function app.sommes_lignes(
  p_table regclass,
  p_fk_column text,
  p_id uuid,
  out total_ht numeric,
  out total_tva numeric
) language plpgsql as $$
begin
  execute format(
    'select coalesce(sum(montant_ht), 0)::numeric(14,3), coalesce(sum(montant_tva), 0)::numeric(14,3) from %s where %I = $1',
    p_table, p_fk_column
  ) into total_ht, total_tva using p_id;
end;
$$;

-- ----------------------------------------------------------------------------
-- Recalcul des totaux par type de document (étapes 5 à 7 du calcul, section 4).
-- Appelées par les triggers AFTER sur les tables de lignes (migration 011).
-- ----------------------------------------------------------------------------

create or replace function app.recalculer_totaux_devis(p_id uuid) returns void
language plpgsql as $$
declare v_ht numeric; v_tva numeric;
begin
  select total_ht, total_tva into v_ht, v_tva from app.sommes_lignes('public.devis_ligne', 'devis_id', p_id);
  update devis set total_ht = v_ht, total_tva = v_tva, total_ttc = round(v_ht + v_tva, 3) where id = p_id;
end;
$$;

create or replace function app.recalculer_totaux_commande_client(p_id uuid) returns void
language plpgsql as $$
declare v_ht numeric; v_tva numeric;
begin
  select total_ht, total_tva into v_ht, v_tva from app.sommes_lignes('public.commande_client_ligne', 'commande_id', p_id);
  update commande_client set total_ht = v_ht, total_tva = v_tva, total_ttc = round(v_ht + v_tva, 3) where id = p_id;
end;
$$;

create or replace function app.recalculer_totaux_commande_fournisseur(p_id uuid) returns void
language plpgsql as $$
declare v_ht numeric; v_tva numeric;
begin
  select total_ht, total_tva into v_ht, v_tva from app.sommes_lignes('public.commande_fournisseur_ligne', 'commande_id', p_id);
  update commande_fournisseur set total_ht = v_ht, total_tva = v_tva, total_ttc = round(v_ht + v_tva, 3) where id = p_id;
end;
$$;

-- facture_vente : timbre fiscal ajouté une seule fois (depuis societe), retenue à
-- la source déduite du TTC selon le taux du client, frais de livraison inclus.
create or replace function app.recalculer_totaux_facture_vente(p_id uuid) returns void
language plpgsql as $$
declare
  v_ht numeric; v_tva numeric; v_client_id uuid; v_taux_rs numeric;
  v_timbre numeric; v_frais numeric; v_retenue numeric; v_ttc numeric;
begin
  select total_ht, total_tva into v_ht, v_tva from app.sommes_lignes('public.facture_vente_ligne', 'facture_id', p_id);

  select client_id, coalesce(frais_livraison, 0) into v_client_id, v_frais from facture_vente where id = p_id;
  select coalesce(taux_retenue_source, 0) into v_taux_rs from tiers where id = v_client_id;
  select timbre_fiscal into v_timbre from societe where id = true;

  v_retenue := round(v_ht * v_taux_rs / 100, 3);
  v_ttc := round(v_ht + v_tva + coalesce(v_timbre, 0) + v_frais - v_retenue, 3);

  update facture_vente
     set total_ht = v_ht, total_tva = v_tva, timbre_fiscal = coalesce(v_timbre, 0),
         retenue_source = v_retenue, total_ttc = v_ttc
   where id = p_id;
end;
$$;

-- facture_achat : le timbre est celui porté par la facture du fournisseur
-- (saisi manuellement, non recalculé) ; la retenue à la source suit le même principe.
create or replace function app.recalculer_totaux_facture_achat(p_id uuid) returns void
language plpgsql as $$
declare
  v_ht numeric; v_tva numeric; v_fournisseur_id uuid; v_taux_rs numeric;
  v_timbre numeric; v_retenue numeric; v_ttc numeric;
begin
  select total_ht, total_tva into v_ht, v_tva from app.sommes_lignes('public.facture_achat_ligne', 'facture_id', p_id);

  select fournisseur_id, coalesce(timbre_fiscal, 0) into v_fournisseur_id, v_timbre from facture_achat where id = p_id;
  select coalesce(taux_retenue_source, 0) into v_taux_rs from tiers where id = v_fournisseur_id;

  v_retenue := round(v_ht * v_taux_rs / 100, 3);
  v_ttc := round(v_ht + v_tva + v_timbre - v_retenue, 3);

  update facture_achat
     set total_ht = v_ht, total_tva = v_tva, retenue_source = v_retenue, total_ttc = v_ttc
   where id = p_id;
end;
$$;

create or replace function app.recalculer_totaux_avoir_vente(p_id uuid) returns void
language plpgsql as $$
declare v_ht numeric; v_tva numeric;
begin
  select total_ht, total_tva into v_ht, v_tva from app.sommes_lignes('public.avoir_vente_ligne', 'avoir_id', p_id);
  update avoir_vente set total_ht = v_ht, total_tva = v_tva, total_ttc = round(v_ht + v_tva, 3) where id = p_id;
end;
$$;

create or replace function app.recalculer_totaux_avoir_achat(p_id uuid) returns void
language plpgsql as $$
declare v_ht numeric; v_tva numeric;
begin
  select total_ht, total_tva into v_ht, v_tva from app.sommes_lignes('public.avoir_achat_ligne', 'avoir_id', p_id);
  update avoir_achat set total_ht = v_ht, total_tva = v_tva, total_ttc = round(v_ht + v_tva, 3) where id = p_id;
end;
$$;

-- ----------------------------------------------------------------------------
-- app.nouveau_cmp — CMP = (stock × CMP + qté × prix) / (stock + qté), à chaque
-- entrée. Les sorties sont valorisées au CMP courant, sans le modifier.
-- ----------------------------------------------------------------------------

create or replace function app.nouveau_cmp(
  p_stock_actuel numeric, p_cmp_actuel numeric, p_qte_entree numeric, p_prix_entree numeric
) returns numeric
language sql immutable as $$
  select case
    when (p_stock_actuel + p_qte_entree) = 0 then 0
    else round((p_stock_actuel * p_cmp_actuel + p_qte_entree * p_prix_entree) / (p_stock_actuel + p_qte_entree), 3)
  end;
$$;

-- ----------------------------------------------------------------------------
-- app.recalculer_stock — reconstruction intégrale du cache stock depuis
-- mouvement_stock (source de vérité). Utile pour audit/correction.
-- ----------------------------------------------------------------------------

create or replace function app.recalculer_stock() returns void
language plpgsql as $$
declare
  r record;
  v_stock numeric;
  v_cmp numeric;
  v_trouve boolean;
begin
  truncate table stock;

  for r in
    select article_id, variante_id, depot_id, sens, quantite, prix_unitaire
      from mouvement_stock
     order by date_mouvement, cree_le
  loop
    select quantite, cmp into v_stock, v_cmp
      from stock
     where article_id = r.article_id
       and depot_id = r.depot_id
       and variante_id is not distinct from r.variante_id;

    v_trouve := found;
    if not v_trouve then
      v_stock := 0;
      v_cmp := 0;
    end if;

    if r.sens = 'ENTREE' then
      v_cmp := app.nouveau_cmp(v_stock, v_cmp, r.quantite, r.prix_unitaire);
      v_stock := v_stock + r.quantite;
    else
      v_stock := v_stock - r.quantite;
    end if;

    if v_trouve then
      update stock
         set quantite = v_stock, cmp = v_cmp, modifie_le = now()
       where article_id = r.article_id and depot_id = r.depot_id
         and variante_id is not distinct from r.variante_id;
    else
      insert into stock (article_id, variante_id, depot_id, quantite, cmp)
      values (r.article_id, r.variante_id, r.depot_id, v_stock, v_cmp);
    end if;
  end loop;
end;
$$;
