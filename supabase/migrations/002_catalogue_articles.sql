-- ============================================================================
-- 002_catalogue_articles.sql
-- Familles, articles, variantes, listes de prix.
-- Ré-exécutable.
-- ============================================================================

do $$ begin
  create type type_article as enum ('MATIERE_PREMIERE', 'COMPOSANT', 'PRODUIT_FINI', 'SERVICE');
exception when duplicate_object then null; end $$;

do $$ begin
  create type type_liste_prix as enum ('VENTE', 'ACHAT');
exception when duplicate_object then null; end $$;

-- ----------------------------------------------------------------------------
-- famille_article — hiérarchie de familles (ex: Salon > Canapés > Angle)
-- ----------------------------------------------------------------------------

create table if not exists famille_article (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  libelle text not null,
  parent_id uuid references famille_article (id)
);

select app.securiser_table('public.famille_article');

-- ----------------------------------------------------------------------------
-- article — catalogue (matières, composants, produits finis, services)
-- ----------------------------------------------------------------------------

create table if not exists article (
  id uuid primary key default gen_random_uuid(),
  reference text not null unique,
  designation text not null,
  famille_id uuid references famille_article (id),
  type_article type_article not null,
  unite_id uuid not null references unite_mesure (id),
  gere_stock boolean not null default true,
  prix_achat_standard numeric(14, 3) not null default 0.000,
  prix_vente_ht numeric(14, 3) not null default 0.000,
  taux_tva_id uuid not null references taux_tva (id),
  seuil_alerte numeric(14, 3) not null default 0.000,
  photo_url text,
  actif boolean not null default true,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now(),
  constraint article_prix_positifs check (prix_achat_standard >= 0 and prix_vente_ht >= 0),
  constraint article_seuil_positif check (seuil_alerte >= 0)
);

select app.securiser_table('public.article');
select app.tracer_modifications('public.article');

create index if not exists idx_article_famille on article (famille_id);
create index if not exists idx_article_type on article (type_article);
create index if not exists idx_article_actif on article (actif);

-- ----------------------------------------------------------------------------
-- article_variante — déclinaisons (couleur, dimension, finition…)
-- ----------------------------------------------------------------------------

create table if not exists article_variante (
  id uuid primary key default gen_random_uuid(),
  article_id uuid not null references article (id) on delete cascade,
  code_variante text not null,
  libelle text not null,
  attributs jsonb not null default '{}'::jsonb,
  prix_vente_ht numeric(14, 3),
  actif boolean not null default true,
  cree_le timestamptz not null default now(),
  constraint article_variante_unique unique (article_id, code_variante)
);

select app.securiser_table('public.article_variante');

create index if not exists idx_article_variante_article on article_variante (article_id);

-- ----------------------------------------------------------------------------
-- liste_prix / liste_prix_ligne — tarifs spécifiques (ex: tarif revendeur B2B)
-- ----------------------------------------------------------------------------

create table if not exists liste_prix (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  libelle text not null,
  type type_liste_prix not null,
  actif boolean not null default true
);

select app.securiser_table('public.liste_prix');

create table if not exists liste_prix_ligne (
  id uuid primary key default gen_random_uuid(),
  liste_prix_id uuid not null references liste_prix (id) on delete cascade,
  article_id uuid not null references article (id) on delete cascade,
  variante_id uuid references article_variante (id) on delete cascade,
  prix_ht numeric(14, 3) not null,
  date_debut date not null default current_date,
  date_fin date,
  constraint liste_prix_ligne_prix_positif check (prix_ht >= 0),
  constraint liste_prix_ligne_dates_coherentes check (date_fin is null or date_fin >= date_debut)
);

select app.securiser_table('public.liste_prix_ligne');

create index if not exists idx_liste_prix_ligne_article on liste_prix_ligne (article_id, variante_id);
