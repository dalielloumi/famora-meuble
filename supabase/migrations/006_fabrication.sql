-- ============================================================================
-- 006_fabrication.sql
-- Nomenclatures, ordres de fabrication, consommations atelier.
-- Ré-exécutable.
-- ============================================================================

do $$ begin
  create type statut_of as enum ('BROUILLON', 'LANCE', 'CLOTURE', 'ANNULE');
exception when duplicate_object then null; end $$;

-- ----------------------------------------------------------------------------
-- nomenclature — recette de fabrication d'un produit fini (versionnée)
-- ----------------------------------------------------------------------------

create table if not exists nomenclature (
  id uuid primary key default gen_random_uuid(),
  article_id uuid not null references article (id),
  version integer not null default 1,
  actif boolean not null default true,
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  constraint nomenclature_article_version_unique unique (article_id, version)
);

select app.securiser_table('public.nomenclature');

create index if not exists idx_nomenclature_article on nomenclature (article_id);

create table if not exists nomenclature_ligne (
  id uuid primary key default gen_random_uuid(),
  nomenclature_id uuid not null references nomenclature (id) on delete cascade,
  composant_id uuid not null references article (id),
  quantite numeric(14, 3) not null,
  unite_id uuid not null references unite_mesure (id),
  ordre integer not null default 0,
  constraint nomenclature_ligne_quantite_positive check (quantite > 0)
);

select app.securiser_table('public.nomenclature_ligne');

create index if not exists idx_nomenclature_ligne_nomenclature on nomenclature_ligne (nomenclature_id);

-- ----------------------------------------------------------------------------
-- ordre_fabrication (OF)
-- Consomme les composants au lancement (sortie stock atelier), produit le
-- fini à la clôture (entrée stock). Voir migration 011 pour les triggers.
-- ----------------------------------------------------------------------------

create table if not exists ordre_fabrication (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  article_id uuid not null references article (id),
  nomenclature_id uuid not null references nomenclature (id),
  commande_client_ligne_id uuid references commande_client_ligne (id),
  quantite_prevue numeric(14, 3) not null,
  quantite_produite numeric(14, 3) not null default 0.000,
  depot_source_id uuid not null references depot (id),
  depot_destination_id uuid not null references depot (id),
  statut statut_of not null default 'BROUILLON',
  date_lancement date,
  date_cloture_prevue date,
  date_cloture date,
  cout_matiere numeric(14, 3) not null default 0.000,
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now(),
  constraint of_quantite_prevue_positive check (quantite_prevue > 0)
);

select app.securiser_table('public.ordre_fabrication');
select app.tracer_modifications('public.ordre_fabrication');

create index if not exists idx_of_article on ordre_fabrication (article_id);
create index if not exists idx_of_statut on ordre_fabrication (statut);
create index if not exists idx_of_commande_ligne on ordre_fabrication (commande_client_ligne_id);

comment on column ordre_fabrication.commande_client_ligne_id is
  'Non nul = OF de sur-mesure. Sa clôture rend la ligne de commande livrable.';
comment on column ordre_fabrication.cout_matiere is
  'Somme(quantité consommée × CMP du composant au moment de la consommation).';

-- ----------------------------------------------------------------------------
-- of_consommation — détail des composants sortis pour un OF
-- ----------------------------------------------------------------------------

create table if not exists of_consommation (
  id uuid primary key default gen_random_uuid(),
  of_id uuid not null references ordre_fabrication (id) on delete cascade,
  article_id uuid not null references article (id),
  quantite numeric(14, 3) not null,
  cmp_unitaire numeric(14, 3) not null,
  montant numeric(14, 3) not null,
  cree_le timestamptz not null default now(),
  constraint of_consommation_quantite_positive check (quantite > 0)
);

select app.securiser_table('public.of_consommation');

create index if not exists idx_of_consommation_of on of_consommation (of_id);
