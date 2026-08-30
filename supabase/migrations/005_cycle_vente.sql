-- ============================================================================
-- 005_cycle_vente.sql
-- Devis → commande client → bon de livraison → facture → avoir.
-- Ré-exécutable.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- devis
-- ----------------------------------------------------------------------------

create table if not exists devis (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  client_id uuid not null references tiers (id),
  date_devis date not null default current_date,
  date_validite date,
  statut statut_document not null default 'BROUILLON',
  total_ht numeric(14, 3) not null default 0.000,
  total_tva numeric(14, 3) not null default 0.000,
  total_ttc numeric(14, 3) not null default 0.000,
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.devis');
select app.tracer_modifications('public.devis');

create index if not exists idx_devis_client on devis (client_id);
create index if not exists idx_devis_statut on devis (statut);

create table if not exists devis_ligne (
  id uuid primary key default gen_random_uuid(),
  devis_id uuid not null references devis (id) on delete cascade,
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  quantite numeric(14, 3) not null,
  prix_unitaire numeric(14, 3) not null,
  remise_pct numeric(6, 3) not null default 0.000,
  taux_tva_id uuid not null references taux_tva (id),
  montant_ht numeric(14, 3) not null default 0.000,
  montant_tva numeric(14, 3) not null default 0.000,
  ordre integer not null default 0,
  constraint devis_ligne_quantite_positive check (quantite > 0),
  constraint devis_ligne_remise_valide check (remise_pct >= 0 and remise_pct <= 100)
);

select app.securiser_table('public.devis_ligne');

create index if not exists idx_devis_ligne_devis on devis_ligne (devis_id);

-- ----------------------------------------------------------------------------
-- commande_client
-- ----------------------------------------------------------------------------

create table if not exists commande_client (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  client_id uuid not null references tiers (id),
  devis_id uuid references devis (id),
  date_commande date not null default current_date,
  date_livraison_prevue date,
  statut statut_document not null default 'BROUILLON',
  total_ht numeric(14, 3) not null default 0.000,
  total_tva numeric(14, 3) not null default 0.000,
  total_ttc numeric(14, 3) not null default 0.000,
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.commande_client');
select app.tracer_modifications('public.commande_client');

create index if not exists idx_cmd_client_client on commande_client (client_id);
create index if not exists idx_cmd_client_statut on commande_client (statut);

create table if not exists commande_client_ligne (
  id uuid primary key default gen_random_uuid(),
  commande_id uuid not null references commande_client (id) on delete cascade,
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  quantite numeric(14, 3) not null,
  prix_unitaire numeric(14, 3) not null,
  remise_pct numeric(6, 3) not null default 0.000,
  taux_tva_id uuid not null references taux_tva (id),
  montant_ht numeric(14, 3) not null default 0.000,
  montant_tva numeric(14, 3) not null default 0.000,
  quantite_livree numeric(14, 3) not null default 0.000,
  ordre integer not null default 0,
  constraint cmd_client_ligne_quantite_positive check (quantite > 0),
  constraint cmd_client_ligne_remise_valide check (remise_pct >= 0 and remise_pct <= 100)
);

select app.securiser_table('public.commande_client_ligne');

create index if not exists idx_cmd_client_ligne_commande on commande_client_ligne (commande_id);

comment on column commande_client_ligne.quantite_livree is
  'Mis à jour à la validation de chaque BL. Ligne livrable = quantite_livree >= quantite.';

-- ----------------------------------------------------------------------------
-- bl — bon de livraison. Sa validation génère les mouvements de stock (règle métier).
-- ----------------------------------------------------------------------------

create table if not exists bl (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  client_id uuid not null references tiers (id),
  commande_client_id uuid references commande_client (id),
  depot_id uuid not null references depot (id),
  date_bl date not null default current_date,
  adresse_livraison text,
  statut statut_document not null default 'BROUILLON',
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.bl');
select app.tracer_modifications('public.bl');

create index if not exists idx_bl_client on bl (client_id);
create index if not exists idx_bl_commande on bl (commande_client_id);
create index if not exists idx_bl_statut on bl (statut);

create table if not exists bl_ligne (
  id uuid primary key default gen_random_uuid(),
  bl_id uuid not null references bl (id) on delete cascade,
  commande_ligne_id uuid references commande_client_ligne (id),
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  quantite numeric(14, 3) not null,
  prix_unitaire numeric(14, 3) not null,
  taux_tva_id uuid not null references taux_tva (id),
  ordre integer not null default 0,
  constraint bl_ligne_quantite_positive check (quantite > 0)
);

select app.securiser_table('public.bl_ligne');

create index if not exists idx_bl_ligne_bl on bl_ligne (bl_id);

-- ----------------------------------------------------------------------------
-- facture_vente — sa validation ne touche pas au stock (déjà fait par le BL).
-- ----------------------------------------------------------------------------

create table if not exists facture_vente (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  client_id uuid not null references tiers (id),
  bl_id uuid references bl (id),
  commande_client_id uuid references commande_client (id),
  date_facture date not null default current_date,
  date_echeance date,
  statut statut_document not null default 'BROUILLON',
  statut_paiement statut_paiement not null default 'IMPAYE',
  total_ht numeric(14, 3) not null default 0.000,
  total_tva numeric(14, 3) not null default 0.000,
  timbre_fiscal numeric(10, 3) not null default 0.000,
  frais_livraison numeric(14, 3) not null default 0.000,
  retenue_source numeric(14, 3) not null default 0.000,
  total_ttc numeric(14, 3) not null default 0.000,
  montant_regle numeric(14, 3) not null default 0.000,
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.facture_vente');
select app.tracer_modifications('public.facture_vente');

create index if not exists idx_facture_vente_client on facture_vente (client_id);
create index if not exists idx_facture_vente_statut on facture_vente (statut, statut_paiement);

create table if not exists facture_vente_ligne (
  id uuid primary key default gen_random_uuid(),
  facture_id uuid not null references facture_vente (id) on delete cascade,
  bl_ligne_id uuid references bl_ligne (id),
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  quantite numeric(14, 3) not null,
  prix_unitaire numeric(14, 3) not null,
  remise_pct numeric(6, 3) not null default 0.000,
  taux_tva_id uuid not null references taux_tva (id),
  montant_ht numeric(14, 3) not null default 0.000,
  montant_tva numeric(14, 3) not null default 0.000,
  ordre integer not null default 0,
  constraint facture_vente_ligne_quantite_positive check (quantite > 0),
  constraint facture_vente_ligne_remise_valide check (remise_pct >= 0 and remise_pct <= 100)
);

select app.securiser_table('public.facture_vente_ligne');

create index if not exists idx_facture_vente_ligne_facture on facture_vente_ligne (facture_id);

-- ----------------------------------------------------------------------------
-- avoir_vente — référence obligatoirement sa facture d'origine (règle métier).
-- ----------------------------------------------------------------------------

create table if not exists avoir_vente (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  client_id uuid not null references tiers (id),
  facture_vente_id uuid not null references facture_vente (id),
  motif text not null,
  date_avoir date not null default current_date,
  statut statut_document not null default 'BROUILLON',
  total_ht numeric(14, 3) not null default 0.000,
  total_tva numeric(14, 3) not null default 0.000,
  total_ttc numeric(14, 3) not null default 0.000,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.avoir_vente');
select app.tracer_modifications('public.avoir_vente');

create index if not exists idx_avoir_vente_facture on avoir_vente (facture_vente_id);

create table if not exists avoir_vente_ligne (
  id uuid primary key default gen_random_uuid(),
  avoir_id uuid not null references avoir_vente (id) on delete cascade,
  facture_ligne_id uuid references facture_vente_ligne (id),
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  quantite numeric(14, 3) not null,
  prix_unitaire numeric(14, 3) not null,
  taux_tva_id uuid not null references taux_tva (id),
  montant_ht numeric(14, 3) not null default 0.000,
  montant_tva numeric(14, 3) not null default 0.000,
  ordre integer not null default 0,
  constraint avoir_vente_ligne_quantite_positive check (quantite > 0)
);

select app.securiser_table('public.avoir_vente_ligne');

create index if not exists idx_avoir_vente_ligne_avoir on avoir_vente_ligne (avoir_id);
