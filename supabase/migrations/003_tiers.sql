-- ============================================================================
-- 003_tiers.sql
-- Clients, fournisseurs, contacts.
-- Ré-exécutable.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- tiers — clients et/ou fournisseurs (particuliers B2C ou revendeurs B2B)
-- ----------------------------------------------------------------------------

create table if not exists tiers (
  id uuid primary key default gen_random_uuid(),
  type type_tiers not null,
  code text not null unique,
  raison_sociale text not null,
  matricule_fiscal text,
  adresse text,
  ville text,
  code_postal text,
  telephone text,
  email text,
  taux_retenue_source numeric(6, 3) not null default 0.000,
  plafond_credit numeric(14, 3) not null default 0.000,
  solde numeric(14, 3) not null default 0.000,
  actif boolean not null default true,
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.tiers');
select app.tracer_modifications('public.tiers');

create index if not exists idx_tiers_type on tiers (type);
create index if not exists idx_tiers_actif on tiers (actif);

comment on column tiers.solde is
  'Cache recalculé par trigger à chaque facture/règlement/avoir. Ne jamais écrire directement depuis le client.';

-- ----------------------------------------------------------------------------
-- tiers_contact — interlocuteurs (utile côté B2B revendeurs)
-- ----------------------------------------------------------------------------

create table if not exists tiers_contact (
  id uuid primary key default gen_random_uuid(),
  tiers_id uuid not null references tiers (id) on delete cascade,
  nom text not null,
  fonction text,
  telephone text,
  email text
);

select app.securiser_table('public.tiers_contact');

create index if not exists idx_tiers_contact_tiers on tiers_contact (tiers_id);
