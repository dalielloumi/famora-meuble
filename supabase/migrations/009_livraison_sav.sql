-- ============================================================================
-- 009_livraison_sav.sql
-- Tournées de livraison et service après-vente.
-- Ré-exécutable.
-- ============================================================================

do $$ begin
  create type statut_tournee as enum ('PREVUE', 'EN_COURS', 'TERMINEE', 'ANNULEE');
exception when duplicate_object then null; end $$;

do $$ begin
  create type statut_livraison_ligne as enum ('PREVUE', 'LIVREE', 'ECHEC');
exception when duplicate_object then null; end $$;

do $$ begin
  create type statut_sav as enum ('OUVERT', 'EN_COURS', 'RESOLU', 'FERME');
exception when duplicate_object then null; end $$;

do $$ begin
  create type type_intervention_sav as enum ('REPARATION', 'ECHANGE', 'REMBOURSEMENT');
exception when duplicate_object then null; end $$;

-- ----------------------------------------------------------------------------
-- tournee_livraison — planification des BL à livrer
-- ----------------------------------------------------------------------------

create table if not exists tournee_livraison (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  date_tournee date not null default current_date,
  chauffeur text,
  vehicule text,
  statut statut_tournee not null default 'PREVUE',
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.tournee_livraison');
select app.tracer_modifications('public.tournee_livraison');

create index if not exists idx_tournee_date on tournee_livraison (date_tournee);

create table if not exists tournee_livraison_ligne (
  id uuid primary key default gen_random_uuid(),
  tournee_id uuid not null references tournee_livraison (id) on delete cascade,
  bl_id uuid not null references bl (id),
  ordre integer not null default 0,
  statut statut_livraison_ligne not null default 'PREVUE',
  heure_prevue time,
  commentaire text,
  constraint tournee_ligne_bl_unique unique (tournee_id, bl_id)
);

select app.securiser_table('public.tournee_livraison_ligne');

create index if not exists idx_tournee_ligne_tournee on tournee_livraison_ligne (tournee_id);
create index if not exists idx_tournee_ligne_bl on tournee_livraison_ligne (bl_id);

-- ----------------------------------------------------------------------------
-- sav — dossiers après-vente
-- ----------------------------------------------------------------------------

create table if not exists sav (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  client_id uuid not null references tiers (id),
  article_id uuid references article (id),
  facture_vente_id uuid references facture_vente (id),
  bl_id uuid references bl (id),
  date_ouverture date not null default current_date,
  description_probleme text not null,
  type_intervention type_intervention_sav,
  statut statut_sav not null default 'OUVERT',
  date_cloture date,
  cout numeric(14, 3) not null default 0.000,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.sav');
select app.tracer_modifications('public.sav');

create index if not exists idx_sav_client on sav (client_id);
create index if not exists idx_sav_statut on sav (statut);

create table if not exists sav_intervention (
  id uuid primary key default gen_random_uuid(),
  sav_id uuid not null references sav (id) on delete cascade,
  date_intervention date not null default current_date,
  description text not null,
  cout numeric(14, 3) not null default 0.000,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now()
);

select app.securiser_table('public.sav_intervention');

create index if not exists idx_sav_intervention_sav on sav_intervention (sav_id);
