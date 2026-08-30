-- ============================================================================
-- 004_cycle_achat.sql
-- Commande fournisseur → réception → facture d'achat → avoir d'achat.
-- Ré-exécutable.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- commande_fournisseur
-- ----------------------------------------------------------------------------

create table if not exists commande_fournisseur (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  fournisseur_id uuid not null references tiers (id),
  depot_id uuid not null references depot (id),
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

select app.securiser_table('public.commande_fournisseur');
select app.tracer_modifications('public.commande_fournisseur');

create index if not exists idx_cmd_fourn_fournisseur on commande_fournisseur (fournisseur_id);
create index if not exists idx_cmd_fourn_statut on commande_fournisseur (statut);

create table if not exists commande_fournisseur_ligne (
  id uuid primary key default gen_random_uuid(),
  commande_id uuid not null references commande_fournisseur (id) on delete cascade,
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  quantite numeric(14, 3) not null,
  prix_unitaire numeric(14, 3) not null,
  remise_pct numeric(6, 3) not null default 0.000,
  taux_tva_id uuid not null references taux_tva (id),
  montant_ht numeric(14, 3) not null default 0.000,
  montant_tva numeric(14, 3) not null default 0.000,
  quantite_recue numeric(14, 3) not null default 0.000,
  ordre integer not null default 0,
  constraint cmd_fourn_ligne_quantite_positive check (quantite > 0),
  constraint cmd_fourn_ligne_prix_positif check (prix_unitaire >= 0),
  constraint cmd_fourn_ligne_remise_valide check (remise_pct >= 0 and remise_pct <= 100)
);

select app.securiser_table('public.commande_fournisseur_ligne');

create index if not exists idx_cmd_fourn_ligne_commande on commande_fournisseur_ligne (commande_id);

-- ----------------------------------------------------------------------------
-- reception — entrée en stock physique des marchandises commandées
-- ----------------------------------------------------------------------------

create table if not exists reception (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  commande_fournisseur_id uuid references commande_fournisseur (id),
  fournisseur_id uuid not null references tiers (id),
  depot_id uuid not null references depot (id),
  date_reception date not null default current_date,
  statut statut_document not null default 'BROUILLON',
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.reception');
select app.tracer_modifications('public.reception');

create index if not exists idx_reception_commande on reception (commande_fournisseur_id);
create index if not exists idx_reception_statut on reception (statut);

create table if not exists reception_ligne (
  id uuid primary key default gen_random_uuid(),
  reception_id uuid not null references reception (id) on delete cascade,
  commande_ligne_id uuid references commande_fournisseur_ligne (id),
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  quantite numeric(14, 3) not null,
  prix_unitaire numeric(14, 3) not null,
  ordre integer not null default 0,
  constraint reception_ligne_quantite_positive check (quantite > 0)
);

select app.securiser_table('public.reception_ligne');

create index if not exists idx_reception_ligne_reception on reception_ligne (reception_id);

-- ----------------------------------------------------------------------------
-- facture_achat / avoir_achat
-- ----------------------------------------------------------------------------

create table if not exists facture_achat (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  fournisseur_id uuid not null references tiers (id),
  reception_id uuid references reception (id),
  numero_facture_fournisseur text,
  date_facture date not null default current_date,
  date_echeance date,
  statut statut_document not null default 'BROUILLON',
  statut_paiement statut_paiement not null default 'IMPAYE',
  total_ht numeric(14, 3) not null default 0.000,
  total_tva numeric(14, 3) not null default 0.000,
  timbre_fiscal numeric(10, 3) not null default 0.000,
  retenue_source numeric(14, 3) not null default 0.000,
  total_ttc numeric(14, 3) not null default 0.000,
  montant_regle numeric(14, 3) not null default 0.000,
  notes text,
  cree_par uuid references auth.users (id),
  cree_le timestamptz not null default now(),
  modifie_le timestamptz not null default now()
);

select app.securiser_table('public.facture_achat');
select app.tracer_modifications('public.facture_achat');

create index if not exists idx_facture_achat_fournisseur on facture_achat (fournisseur_id);
create index if not exists idx_facture_achat_statut on facture_achat (statut, statut_paiement);

create table if not exists facture_achat_ligne (
  id uuid primary key default gen_random_uuid(),
  facture_id uuid not null references facture_achat (id) on delete cascade,
  reception_ligne_id uuid references reception_ligne (id),
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  quantite numeric(14, 3) not null,
  prix_unitaire numeric(14, 3) not null,
  remise_pct numeric(6, 3) not null default 0.000,
  taux_tva_id uuid not null references taux_tva (id),
  montant_ht numeric(14, 3) not null default 0.000,
  montant_tva numeric(14, 3) not null default 0.000,
  ordre integer not null default 0,
  constraint facture_achat_ligne_quantite_positive check (quantite > 0),
  constraint facture_achat_ligne_remise_valide check (remise_pct >= 0 and remise_pct <= 100)
);

select app.securiser_table('public.facture_achat_ligne');

create index if not exists idx_facture_achat_ligne_facture on facture_achat_ligne (facture_id);

create table if not exists avoir_achat (
  id uuid primary key default gen_random_uuid(),
  numero text not null unique,
  exercice_id uuid not null references exercice (id),
  fournisseur_id uuid not null references tiers (id),
  facture_achat_id uuid not null references facture_achat (id),
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

select app.securiser_table('public.avoir_achat');
select app.tracer_modifications('public.avoir_achat');

create index if not exists idx_avoir_achat_facture on avoir_achat (facture_achat_id);

create table if not exists avoir_achat_ligne (
  id uuid primary key default gen_random_uuid(),
  avoir_id uuid not null references avoir_achat (id) on delete cascade,
  facture_ligne_id uuid references facture_achat_ligne (id),
  article_id uuid not null references article (id),
  variante_id uuid references article_variante (id),
  quantite numeric(14, 3) not null,
  prix_unitaire numeric(14, 3) not null,
  taux_tva_id uuid not null references taux_tva (id),
  montant_ht numeric(14, 3) not null default 0.000,
  montant_tva numeric(14, 3) not null default 0.000,
  ordre integer not null default 0,
  constraint avoir_achat_ligne_quantite_positive check (quantite > 0)
);

select app.securiser_table('public.avoir_achat_ligne');

create index if not exists idx_avoir_achat_ligne_avoir on avoir_achat_ligne (avoir_id);
