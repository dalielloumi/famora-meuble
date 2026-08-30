-- ============================================================================
-- 001_types_et_referentiel.sql
-- Extensions, schéma utilitaire, types énumérés, tables de référence.
-- Ré-exécutable.
-- ============================================================================

create extension if not exists pgcrypto;

-- Schéma technique pour les fonctions utilitaires internes (non exposé par PostgREST).
create schema if not exists app;

-- ----------------------------------------------------------------------------
-- Fonctions utilitaires : sécurisation RLS uniforme + horodatage automatique.
-- Appelées à la fin de la création de chaque table, dans la même migration
-- que la table (règle du fichier PROJET.md section 8).
-- ----------------------------------------------------------------------------

create or replace function app.securiser_table(p_table regclass) returns void
language plpgsql as $$
begin
  execute format('alter table %s enable row level security', p_table);
  execute format('drop policy if exists acces_admin on %s', p_table);
  execute format(
    'create policy acces_admin on %s for all using (auth.uid() is not null) with check (auth.uid() is not null)',
    p_table
  );
end;
$$;

create or replace function app.maj_modifie_le() returns trigger
language plpgsql as $$
begin
  new.modifie_le := now();
  return new;
end;
$$;

create or replace function app.tracer_modifications(p_table regclass) returns void
language plpgsql as $$
begin
  execute format('drop trigger if exists trg_modifie_le on %s', p_table);
  execute format(
    'create trigger trg_modifie_le before update on %s for each row execute function app.maj_modifie_le()',
    p_table
  );
end;
$$;

-- ----------------------------------------------------------------------------
-- Types énumérés partagés
-- ----------------------------------------------------------------------------

do $$ begin
  create type statut_document as enum ('BROUILLON', 'VALIDE', 'ANNULE');
exception when duplicate_object then null; end $$;

do $$ begin
  create type statut_paiement as enum ('IMPAYE', 'PARTIEL', 'SOLDE');
exception when duplicate_object then null; end $$;

do $$ begin
  create type type_document as enum (
    'DEVIS', 'COMMANDE_CLIENT', 'BL', 'FACTURE_VENTE', 'AVOIR_VENTE',
    'COMMANDE_FOURNISSEUR', 'RECEPTION', 'FACTURE_ACHAT', 'AVOIR_ACHAT',
    'OF', 'INVENTAIRE', 'REGLEMENT', 'SAV', 'TOURNEE_LIVRAISON'
  );
exception when duplicate_object then null; end $$;

do $$ begin
  create type type_tiers as enum ('CLIENT', 'FOURNISSEUR', 'LES_DEUX');
exception when duplicate_object then null; end $$;

do $$ begin
  create type type_depot as enum ('MAGASIN', 'ATELIER', 'AUTRE');
exception when duplicate_object then null; end $$;

-- ----------------------------------------------------------------------------
-- role — un seul rôle ADMIN aujourd'hui (voir section 3 de PROJET.md).
-- Conservé pour permettre l'ajout futur de rôles sans migration de rupture.
-- ----------------------------------------------------------------------------

create table if not exists role (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  libelle text not null
);

select app.securiser_table('public.role');

-- ----------------------------------------------------------------------------
-- utilisateur_profil — profil applicatif lié 1-1 à auth.users
-- ----------------------------------------------------------------------------

create table if not exists utilisateur_profil (
  id uuid primary key references auth.users (id) on delete cascade,
  nom text not null,
  prenom text not null,
  role_id uuid not null references role (id),
  actif boolean not null default true,
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.utilisateur_profil');
select app.tracer_modifications('public.utilisateur_profil');

-- ----------------------------------------------------------------------------
-- societe — informations de l'entreprise (ligne unique)
-- ----------------------------------------------------------------------------

create table if not exists societe (
  id boolean primary key default true,
  raison_sociale text not null,
  matricule_fiscal text not null,
  adresse text not null,
  ville text,
  code_postal text,
  telephone text,
  email text,
  rib text,
  logo_url text,
  timbre_fiscal numeric(10, 3) not null default 1.000,
  taux_retenue_source_defaut numeric(6, 3) not null default 0.000,
  modifie_le timestamptz not null default now(),
  constraint societe_ligne_unique check (id = true)
);

select app.securiser_table('public.societe');
select app.tracer_modifications('public.societe');

-- ----------------------------------------------------------------------------
-- exercice — exercice comptable / fiscal
-- ----------------------------------------------------------------------------

create table if not exists exercice (
  id uuid primary key default gen_random_uuid(),
  annee integer not null unique,
  date_debut date not null,
  date_fin date not null,
  cloture boolean not null default false,
  constraint exercice_dates_coherentes check (date_fin > date_debut)
);

select app.securiser_table('public.exercice');

create or replace function exercice_ouvert() returns uuid
language sql stable as $$
  select id from exercice where cloture = false order by annee desc limit 1;
$$;

-- ----------------------------------------------------------------------------
-- depot — dépôts / magasins / atelier
-- ----------------------------------------------------------------------------

create table if not exists depot (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  libelle text not null,
  type type_depot not null default 'MAGASIN',
  adresse text,
  actif boolean not null default true
);

select app.securiser_table('public.depot');

-- ----------------------------------------------------------------------------
-- unite_mesure
-- ----------------------------------------------------------------------------

create table if not exists unite_mesure (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  libelle text not null
);

select app.securiser_table('public.unite_mesure');

-- ----------------------------------------------------------------------------
-- taux_tva
-- ----------------------------------------------------------------------------

create table if not exists taux_tva (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  taux numeric(6, 3) not null,
  libelle text not null,
  actif boolean not null default true
);

select app.securiser_table('public.taux_tva');

-- ----------------------------------------------------------------------------
-- sequence_document — compteur par type de document et par exercice.
-- Verrouillée en FOR UPDATE par next_numero() (migration 010).
-- ----------------------------------------------------------------------------

create table if not exists sequence_document (
  type_document type_document not null,
  exercice_id uuid not null references exercice (id),
  dernier_numero integer not null default 0,
  primary key (type_document, exercice_id)
);

select app.securiser_table('public.sequence_document');

-- ----------------------------------------------------------------------------
-- journal_audit — trace des opérations sensibles (conservé même en mono-utilisateur)
-- ----------------------------------------------------------------------------

create table if not exists journal_audit (
  id uuid primary key default gen_random_uuid(),
  nom_table text not null,
  ligne_id uuid not null,
  action text not null,
  ancienne_valeur jsonb,
  nouvelle_valeur jsonb,
  utilisateur_id uuid references auth.users (id),
  cree_le timestamptz not null default now()
);

select app.securiser_table('public.journal_audit');

create index if not exists idx_journal_audit_table_ligne on journal_audit (nom_table, ligne_id);
