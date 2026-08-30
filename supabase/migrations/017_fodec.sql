-- ============================================================================
-- 017_fodec.sql
-- Ajoute le FODEC (taxe tunisienne de 1 % sur les produits manufacturés
-- localement, découverte en confrontant les documents réels du client aux
-- maquettes PDF). S'applique uniquement au cycle vente (devis, commande
-- client, facture, avoir) : le cycle achat enregistre déjà le montant final
-- facturé par le fournisseur, FODEC inclus, sans avoir à le recalculer.
--
-- Ordre de calcul (remplace l'étape 3 de la section 4 de PROJET.md) :
--   1. montant_ht_ligne   = quantite × prix_unitaire × (1 - remise_pct/100)
--   2. montant_fodec_ligne = montant_ht_ligne × taux_fodec/100
--   3. montant_tva_ligne  = (montant_ht_ligne + montant_fodec_ligne) × taux_tva/100
-- Le FODEC est donc inclus dans l'assiette de la TVA, conformément aux
-- documents de référence.
-- Ré-exécutable.
-- ============================================================================

alter table societe add column if not exists taux_fodec numeric(6, 3) not null default 1.000;

alter table devis_ligne add column if not exists montant_fodec numeric(14, 3) not null default 0.000;
alter table commande_client_ligne add column if not exists montant_fodec numeric(14, 3) not null default 0.000;
alter table facture_vente_ligne add column if not exists montant_fodec numeric(14, 3) not null default 0.000;
alter table avoir_vente_ligne add column if not exists montant_fodec numeric(14, 3) not null default 0.000;

alter table devis add column if not exists fodec numeric(14, 3) not null default 0.000;
alter table commande_client add column if not exists fodec numeric(14, 3) not null default 0.000;
alter table facture_vente add column if not exists fodec numeric(14, 3) not null default 0.000;
alter table avoir_vente add column if not exists fodec numeric(14, 3) not null default 0.000;

-- ----------------------------------------------------------------------------
-- Calcul de ligne avec FODEC (schéma app, jamais exposé en RPC).
-- ----------------------------------------------------------------------------

create or replace function app.calculer_montant_ligne_avec_fodec(
  p_quantite numeric,
  p_prix_unitaire numeric,
  p_remise_pct numeric,
  p_taux_fodec numeric,
  p_taux_tva numeric,
  out montant_ht numeric,
  out montant_fodec numeric,
  out montant_tva numeric
) language plpgsql as $$
begin
  montant_ht := round(p_quantite * p_prix_unitaire * (1 - p_remise_pct / 100), 3);
  montant_fodec := round(montant_ht * p_taux_fodec / 100, 3);
  montant_tva := round((montant_ht + montant_fodec) * p_taux_tva / 100, 3);
end;
$$;

create or replace function app.calculer_ligne_avec_fodec() returns trigger
language plpgsql as $$
declare
  v_taux_tva numeric;
  v_taux_fodec numeric;
  v_calc record;
begin
  select taux into v_taux_tva from taux_tva where id = new.taux_tva_id;
  select taux_fodec into v_taux_fodec from societe where id = true;

  select * into v_calc from app.calculer_montant_ligne_avec_fodec(
    new.quantite, new.prix_unitaire, new.remise_pct, coalesce(v_taux_fodec, 0), v_taux_tva
  );

  new.montant_ht := v_calc.montant_ht;
  new.montant_fodec := v_calc.montant_fodec;
  new.montant_tva := v_calc.montant_tva;
  return new;
end;
$$;

do $$
declare
  t text;
begin
  foreach t in array array[
    'devis_ligne', 'commande_client_ligne', 'facture_vente_ligne', 'avoir_vente_ligne'
  ]
  loop
    execute format('drop trigger if exists trg_calculer_ligne on %I', t);
    execute format(
      'create trigger trg_calculer_ligne before insert or update on %I for each row execute function app.calculer_ligne_avec_fodec()',
      t
    );
  end loop;
end $$;

-- ----------------------------------------------------------------------------
-- Agrégation des lignes avec FODEC.
-- ----------------------------------------------------------------------------

create or replace function app.sommes_lignes_avec_fodec(
  p_table regclass,
  p_fk_column text,
  p_id uuid,
  out total_ht numeric,
  out total_fodec numeric,
  out total_tva numeric
) language plpgsql as $$
begin
  execute format(
    'select coalesce(sum(montant_ht), 0)::numeric(14,3), coalesce(sum(montant_fodec), 0)::numeric(14,3), coalesce(sum(montant_tva), 0)::numeric(14,3) from %s where %I = $1',
    p_table, p_fk_column
  ) into total_ht, total_fodec, total_tva using p_id;
end;
$$;

-- ----------------------------------------------------------------------------
-- Recalcul des totaux (remplace les versions de la migration 010).
-- ----------------------------------------------------------------------------

create or replace function app.recalculer_totaux_devis(p_id uuid) returns void
language plpgsql as $$
declare v_ht numeric; v_fodec numeric; v_tva numeric;
begin
  select total_ht, total_fodec, total_tva into v_ht, v_fodec, v_tva
    from app.sommes_lignes_avec_fodec('public.devis_ligne', 'devis_id', p_id);
  update devis
     set total_ht = v_ht, fodec = v_fodec, total_tva = v_tva, total_ttc = round(v_ht + v_fodec + v_tva, 3)
   where id = p_id;
end;
$$;

create or replace function app.recalculer_totaux_commande_client(p_id uuid) returns void
language plpgsql as $$
declare v_ht numeric; v_fodec numeric; v_tva numeric;
begin
  select total_ht, total_fodec, total_tva into v_ht, v_fodec, v_tva
    from app.sommes_lignes_avec_fodec('public.commande_client_ligne', 'commande_id', p_id);
  update commande_client
     set total_ht = v_ht, fodec = v_fodec, total_tva = v_tva, total_ttc = round(v_ht + v_fodec + v_tva, 3)
   where id = p_id;
end;
$$;

create or replace function app.recalculer_totaux_facture_vente(p_id uuid) returns void
language plpgsql as $$
declare
  v_ht numeric; v_fodec numeric; v_tva numeric; v_client_id uuid; v_taux_rs numeric;
  v_timbre numeric; v_frais numeric; v_retenue numeric; v_ttc numeric;
begin
  select total_ht, total_fodec, total_tva into v_ht, v_fodec, v_tva
    from app.sommes_lignes_avec_fodec('public.facture_vente_ligne', 'facture_id', p_id);

  select client_id, coalesce(frais_livraison, 0) into v_client_id, v_frais from facture_vente where id = p_id;
  select coalesce(taux_retenue_source, 0) into v_taux_rs from tiers where id = v_client_id;
  select timbre_fiscal into v_timbre from societe where id = true;

  v_retenue := round(v_ht * v_taux_rs / 100, 3);
  v_ttc := round(v_ht + v_fodec + v_tva + coalesce(v_timbre, 0) + v_frais - v_retenue, 3);

  update facture_vente
     set total_ht = v_ht, fodec = v_fodec, total_tva = v_tva, timbre_fiscal = coalesce(v_timbre, 0),
         retenue_source = v_retenue, total_ttc = v_ttc
   where id = p_id;
end;
$$;

create or replace function app.recalculer_totaux_avoir_vente(p_id uuid) returns void
language plpgsql as $$
declare v_ht numeric; v_fodec numeric; v_tva numeric;
begin
  select total_ht, total_fodec, total_tva into v_ht, v_fodec, v_tva
    from app.sommes_lignes_avec_fodec('public.avoir_vente_ligne', 'avoir_id', p_id);
  update avoir_vente
     set total_ht = v_ht, fodec = v_fodec, total_tva = v_tva, total_ttc = round(v_ht + v_fodec + v_tva, 3)
   where id = p_id;
end;
$$;
