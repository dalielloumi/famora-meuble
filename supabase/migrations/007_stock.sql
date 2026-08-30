-- ============================================================================
-- 007_stock.sql
-- Mouvements de stock (source de vérité, insert-only), cache stock, inventaire.
-- Ré-exécutable.
-- ============================================================================

do $$ begin
  create type type_mouvement_stock as enum (
    'ENTREE_ACHAT', 'SORTIE_VENTE', 'ENTREE_PRODUCTION', 'SORTIE_PRODUCTION',
    'TRANSFERT_ENTREE', 'TRANSFERT_SORTIE', 'INVENTAIRE_AJUST',
    'RETOUR_CLIENT', 'RETOUR_FOURNISSEUR'
  );
exception when duplicate_object then null; end $$;

do $$ begin
  create type sens_mouvement as enum ('ENTREE', 'SORTIE');
exception when duplicate_object then null; end $$;

-- ----------------------------------------------------------------------------
-- mouvement_stock — source de vérité. Jamais d'UPDATE ni de DELETE (règle métier) :
-- appliqué ici par trigger, indépendamment des policies RLS.
-- ----------------------------------------------------------------------------

create table if not exists mouvement_stock (
  id uuid primary key default gen_random_uuid(),
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  depot_id uuid not null references depot (id),
  type_mouvement type_mouvement_stock not null,
  sens sens_mouvement not null,
  quantite numeric(14, 3) not null,
  prix_unitaire numeric(14, 3) not null default 0.000,
  document_type type_document,
  document_id uuid,
  document_ligne_id uuid,
  date_mouvement timestamptz not null default now(),
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  constraint mouvement_stock_quantite_positive check (quantite > 0)
);

select app.securiser_table('public.mouvement_stock');

create index if not exists idx_mouvement_stock_article_depot on mouvement_stock (article_id, variante_id, depot_id);
create index if not exists idx_mouvement_stock_document on mouvement_stock (document_type, document_id);
create index if not exists idx_mouvement_stock_date on mouvement_stock (date_mouvement);

create or replace function app.empecher_modification_mouvement_stock() returns trigger
language plpgsql as $$
begin
  raise exception 'mouvement_stock est insert-only : une correction doit passer par un mouvement inverse.';
end;
$$;

drop trigger if exists trg_mouvement_stock_immuable on mouvement_stock;
create trigger trg_mouvement_stock_immuable
  before update or delete on mouvement_stock
  for each row execute function app.empecher_modification_mouvement_stock();

-- ----------------------------------------------------------------------------
-- stock — cache par article/variante/dépôt, recalculable depuis mouvement_stock.
-- Écrit uniquement par trigger (migration 011), jamais directement par le client.
-- ----------------------------------------------------------------------------

create table if not exists stock (
  id uuid primary key default gen_random_uuid(),
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  depot_id uuid not null references depot (id),
  quantite numeric(14, 3) not null default 0.000,
  cmp numeric(14, 3) not null default 0.000,
  modifie_le timestamptz not null default now(),
  constraint stock_article_variante_depot_unique unique (article_id, variante_id, depot_id)
);

select app.securiser_table('public.stock');

create unique index if not exists idx_stock_sans_variante
  on stock (article_id, depot_id) where variante_id is null;

create index if not exists idx_stock_article on stock (article_id);
create index if not exists idx_stock_depot on stock (depot_id);

comment on table stock is
  'Cache. Source de vérité = mouvement_stock. Recalcul intégral possible via app.recalculer_stock().';

-- ----------------------------------------------------------------------------
-- inventaire — comptage physique périodique
-- ----------------------------------------------------------------------------

create table if not exists inventaire (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  depot_id uuid not null references depot (id),
  date_inventaire date not null default current_date,
  statut statut_document not null default 'BROUILLON',
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.inventaire');
select app.tracer_modifications('public.inventaire');

create index if not exists idx_inventaire_depot on inventaire (depot_id);

create table if not exists inventaire_ligne (
  id uuid primary key default gen_random_uuid(),
  inventaire_id uuid not null references inventaire (id) on delete cascade,
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  quantite_theorique numeric(14, 3) not null default 0.000,
  quantite_comptee numeric(14, 3),
  ecart numeric(14, 3) generated always as (coalesce(quantite_comptee, quantite_theorique) - quantite_theorique) stored
);

select app.securiser_table('public.inventaire_ligne');

create index if not exists idx_inventaire_ligne_inventaire on inventaire_ligne (inventaire_id);
