-- ============================================================================
-- 008_reglements.sql
-- Règlements, lettrage, effets (chèques/traites), caisse.
-- Ré-exécutable.
-- ============================================================================

do $$ begin
  create type mode_reglement as enum ('ESPECES', 'CHEQUE', 'TRAITE', 'VIREMENT', 'CARTE');
exception when duplicate_object then null; end $$;

do $$ begin
  create type sens_reglement as enum ('ENCAISSEMENT', 'DECAISSEMENT');
exception when duplicate_object then null; end $$;

do $$ begin
  create type statut_effet as enum ('EN_PORTEFEUILLE', 'ENCAISSE', 'IMPAYE', 'ESCOMPTE');
exception when duplicate_object then null; end $$;

-- ----------------------------------------------------------------------------
-- reglement — encaissement client ou décaissement fournisseur.
-- Un acompte est un règlement rattaché à une commande_client sans facture,
-- lettré plus tard via reglement_affectation.
-- ----------------------------------------------------------------------------

create table if not exists reglement (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  tiers_id uuid not null references tiers (id),
  sens sens_reglement not null,
  mode mode_reglement not null,
  montant numeric(14, 3) not null,
  date_reglement date not null default current_date,
  commande_client_id uuid references commande_client (id),
  reference text,
  banque text,
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  constraint reglement_montant_positif check (montant > 0)
);

select app.securiser_table('public.reglement');

create index if not exists idx_reglement_tiers on reglement (tiers_id);
create index if not exists idx_reglement_commande on reglement (commande_client_id);

comment on column reglement.commande_client_id is
  'Non nul = acompte non encore lettré sur une facture.';

-- ----------------------------------------------------------------------------
-- reglement_affectation — un règlement peut solder plusieurs factures.
-- ----------------------------------------------------------------------------

create table if not exists reglement_affectation (
  id uuid primary key default gen_random_uuid(),
  reglement_id uuid not null references reglement (id) on delete cascade,
  facture_vente_id uuid references facture_vente (id),
  facture_achat_id uuid references facture_achat (id),
  montant_affecte numeric(14, 3) not null,
  constraint reglement_affectation_montant_positif check (montant_affecte > 0),
  constraint reglement_affectation_une_seule_facture check (
    (facture_vente_id is not null and facture_achat_id is null)
    or (facture_vente_id is null and facture_achat_id is not null)
  )
);

select app.securiser_table('public.reglement_affectation');

create index if not exists idx_reglement_affectation_reglement on reglement_affectation (reglement_id);
create index if not exists idx_reglement_affectation_facture_vente on reglement_affectation (facture_vente_id);
create index if not exists idx_reglement_affectation_facture_achat on reglement_affectation (facture_achat_id);

-- ----------------------------------------------------------------------------
-- effet — chèques et traites remis en garantie d'un règlement.
-- Un effet impayé remet le solde du tiers à découvert (trigger, migration 011).
-- ----------------------------------------------------------------------------

create table if not exists effet (
  id uuid primary key default gen_random_uuid(),
  reglement_id uuid not null references reglement (id) on delete cascade,
  numero_effet text not null,
  date_echeance date not null,
  montant numeric(14, 3) not null,
  statut statut_effet not null default 'EN_PORTEFEUILLE',
  banque text,
  date_statut date not null default current_date,
  constraint effet_montant_positif check (montant > 0)
);

select app.securiser_table('public.effet');

create index if not exists idx_effet_reglement on effet (reglement_id);
create index if not exists idx_effet_statut on effet (statut);
create index if not exists idx_effet_echeance on effet (date_echeance);

-- ----------------------------------------------------------------------------
-- caisse — trésorerie espèces
-- ----------------------------------------------------------------------------

create table if not exists caisse (
  id uuid primary key default gen_random_uuid(),
  libelle text not null,
  solde numeric(14, 3) not null default 0.000,
  actif boolean not null default true
);

select app.securiser_table('public.caisse');

comment on column caisse.solde is 'Cache recalculé par trigger depuis caisse_operation.';

create table if not exists caisse_operation (
  id uuid primary key default gen_random_uuid(),
  caisse_id uuid not null references caisse (id),
  sens sens_reglement not null,
  montant numeric(14, 3) not null,
  date_operation date not null default current_date,
  reglement_id uuid references reglement (id),
  libelle text not null,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  constraint caisse_operation_montant_positif check (montant > 0)
);

select app.securiser_table('public.caisse_operation');

create index if not exists idx_caisse_operation_caisse on caisse_operation (caisse_id);
