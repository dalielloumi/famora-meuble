-- ============================================================================
-- 021_multi_tenant_fondations.sql
-- Conversion du schéma en multi-tenant : chaque société (compte créé dans
-- Supabase Auth) obtient un espace totalement isolé — plus de données
-- partagées entre entreprises. Voir le plan de migration pour le contexte
-- complet.
--
-- Principe : societe cesse d'être une ligne unique (id boolean) et devient
-- la table locataire elle-même (id uuid, une ligne par entreprise). Toutes
-- les autres tables métier reçoivent une colonne societe_id, remplie
-- automatiquement à l'insertion par un déclencheur (app.fixer_societe_id),
-- et la RLS générique (app.securiser_table, définie en 001) filtre
-- désormais par societe_id au lieu du simple auth.uid() is not null.
--
-- Les données existantes (celles de FAMORA MEUBLE, déjà en production) sont
-- rattachées à un identifiant de société généré une fois ici, de façon à ne
-- rien perdre ni casser pour le client actuel.
--
-- Ordre important : les colonnes societe_id doivent exister AVANT la
-- définition de app.societe_id_courante() (fonction SQL, dont le corps est
-- validé au moment du CREATE, contrairement à plpgsql).
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. societe : de ligne unique (id boolean) à vraie table multi-locataire
--    (id uuid). L'identifiant généré pour la ligne existante est conservé
--    dans un paramètre de session pour les étapes suivantes de cette même
--    migration (transaction unique).
-- ----------------------------------------------------------------------------

do $$
declare
  v_legacy_id uuid := gen_random_uuid();
begin
  alter table societe drop constraint if exists societe_ligne_unique;
  alter table societe alter column id drop default;
  execute format(
    'alter table societe alter column id type uuid using (case when id then %L::uuid else null end)',
    v_legacy_id
  );
  alter table societe alter column id set default gen_random_uuid();

  perform set_config('famora.societe_legacy_id', v_legacy_id::text, true);
end $$;

-- ----------------------------------------------------------------------------
-- 2. Ajout de societe_id à toutes les tables métier (49 tables — tout le
--    schéma sauf role, qui reste un référentiel système partagé, et societe
--    elle-même, dont l'id EST déjà l'identifiant du locataire).
--
--    Les déclencheurs existants (immuabilité des documents validés,
--    insert-only de mouvement_stock...) sont désactivés le temps du
--    rattachement rétroactif, puis réactivés — ce ne sont que des gardes
--    métier sur les écritures applicatives, pas sur cette migration.
-- ----------------------------------------------------------------------------

do $$
declare
  v_legacy_id uuid := current_setting('famora.societe_legacy_id')::uuid;
  v_table text;
  v_tables text[] := array[
    'utilisateur_profil', 'exercice', 'depot', 'unite_mesure', 'taux_tva', 'sequence_document', 'journal_audit',
    'famille_article', 'article', 'article_variante', 'liste_prix', 'liste_prix_ligne',
    'tiers', 'tiers_contact',
    'commande_fournisseur', 'commande_fournisseur_ligne', 'reception', 'reception_ligne',
    'facture_achat', 'facture_achat_ligne', 'avoir_achat', 'avoir_achat_ligne',
    'devis', 'devis_ligne', 'commande_client', 'commande_client_ligne', 'bl', 'bl_ligne',
    'facture_vente', 'facture_vente_ligne', 'avoir_vente', 'avoir_vente_ligne',
    'nomenclature', 'nomenclature_ligne', 'ordre_fabrication', 'of_consommation',
    'mouvement_stock', 'stock', 'inventaire', 'inventaire_ligne',
    'reglement', 'reglement_affectation', 'effet', 'caisse', 'caisse_operation',
    'tournee_livraison', 'tournee_livraison_ligne', 'sav', 'sav_intervention'
  ];
begin
  foreach v_table in array v_tables loop
    execute format('alter table %I add column if not exists societe_id uuid references societe (id)', v_table);
    execute format('alter table %I disable trigger user', v_table);
    execute format('update %I set societe_id = %L where societe_id is null', v_table, v_legacy_id);
    execute format('alter table %I enable trigger user', v_table);
    execute format('alter table %I alter column societe_id set not null', v_table);
    execute format('create index if not exists %I on %I (societe_id)', 'idx_' || v_table || '_societe', v_table);
  end loop;
end $$;

-- ----------------------------------------------------------------------------
-- 3. Contraintes d'unicité globales devenues invalides en multi-tenant :
--    deux entreprises différentes doivent pouvoir toutes les deux avoir un
--    dépôt "MAG-01", un client "CL001", une facture "FV-2026-000001", etc.
--    Chaque unicité passe donc de (colonne) à (societe_id, colonne).
-- ----------------------------------------------------------------------------

do $$
declare
  v_pair text[];
  v_pairs text[][] := array[
    ['exercice', 'annee'],
    ['depot', 'code'],
    ['unite_mesure', 'code'],
    ['taux_tva', 'code'],
    ['famille_article', 'code'],
    ['article', 'reference'],
    ['liste_prix', 'code'],
    ['tiers', 'code'],
    ['devis', 'numero'],
    ['commande_client', 'numero'],
    ['bl', 'numero'],
    ['facture_vente', 'numero'],
    ['avoir_vente', 'numero'],
    ['commande_fournisseur', 'numero'],
    ['reception', 'numero'],
    ['facture_achat', 'numero'],
    ['avoir_achat', 'numero'],
    ['ordre_fabrication', 'numero'],
    ['inventaire', 'numero'],
    ['reglement', 'numero'],
    ['tournee_livraison', 'numero'],
    ['sav', 'numero']
  ];
begin
  foreach v_pair slice 1 in array v_pairs loop
    execute format('alter table %I drop constraint if exists %I', v_pair[1], v_pair[1] || '_' || v_pair[2] || '_key');
    execute format(
      'alter table %I add constraint %I unique (societe_id, %I)',
      v_pair[1],
      v_pair[1] || '_societe_' || v_pair[2] || '_key',
      v_pair[2]
    );
  end loop;
end $$;

-- ----------------------------------------------------------------------------
-- 4. app.societe_id_courante() — résout la société de l'utilisateur connecté.
--    SECURITY DEFINER : contourne volontairement la RLS de utilisateur_profil
--    (qui va elle-même filtrer par societe_id) pour éviter toute récursion.
--    Ne peut être définie qu'une fois utilisateur_profil.societe_id créée
--    (étape 2 ci-dessus) : le corps d'une fonction SQL est validé au CREATE.
-- ----------------------------------------------------------------------------

create or replace function app.societe_id_courante() returns uuid
language sql stable security definer set search_path = public as $$
  select societe_id from utilisateur_profil where id = auth.uid();
$$;

-- ----------------------------------------------------------------------------
-- 5. app.fixer_societe_id() — déclencheur générique BEFORE INSERT : remplit
--    societe_id automatiquement si absent, pour que le code applicatif n'ait
--    jamais besoin de le fournir explicitement.
-- ----------------------------------------------------------------------------

create or replace function app.fixer_societe_id() returns trigger
language plpgsql as $$
begin
  if new.societe_id is null then
    new.societe_id := app.societe_id_courante();
  end if;
  return new;
end;
$$;

-- ----------------------------------------------------------------------------
-- 6. RLS : la politique générique filtre désormais par societe_id, et
--    attache le déclencheur de remplissage automatique. Comme chaque table
--    a déjà appelé app.securiser_table() lors de sa création (voir les
--    migrations 001-009), il suffit de redéfinir la fonction puis de la
--    ré-invoquer sur chaque table pour que la nouvelle politique s'applique
--    — aucune des migrations existantes n'a besoin d'être modifiée.
-- ----------------------------------------------------------------------------

create or replace function app.securiser_table(p_table regclass) returns void
language plpgsql as $$
begin
  execute format('alter table %s enable row level security', p_table);
  execute format('drop policy if exists acces_admin on %s', p_table);
  execute format(
    'create policy acces_admin on %s for all using (societe_id = app.societe_id_courante()) with check (societe_id = app.societe_id_courante())',
    p_table
  );
  execute format('drop trigger if exists trg_fixer_societe_id on %s', p_table);
  execute format(
    'create trigger trg_fixer_societe_id before insert on %s for each row execute function app.fixer_societe_id()',
    p_table
  );
end;
$$;

do $$
declare
  v_table text;
  v_tables text[] := array[
    'utilisateur_profil', 'exercice', 'depot', 'unite_mesure', 'taux_tva', 'sequence_document', 'journal_audit',
    'famille_article', 'article', 'article_variante', 'liste_prix', 'liste_prix_ligne',
    'tiers', 'tiers_contact',
    'commande_fournisseur', 'commande_fournisseur_ligne', 'reception', 'reception_ligne',
    'facture_achat', 'facture_achat_ligne', 'avoir_achat', 'avoir_achat_ligne',
    'devis', 'devis_ligne', 'commande_client', 'commande_client_ligne', 'bl', 'bl_ligne',
    'facture_vente', 'facture_vente_ligne', 'avoir_vente', 'avoir_vente_ligne',
    'nomenclature', 'nomenclature_ligne', 'ordre_fabrication', 'of_consommation',
    'mouvement_stock', 'stock', 'inventaire', 'inventaire_ligne',
    'reglement', 'reglement_affectation', 'effet', 'caisse', 'caisse_operation',
    'tournee_livraison', 'tournee_livraison_ligne', 'sav', 'sav_intervention'
  ];
begin
  foreach v_table in array v_tables loop
    perform app.securiser_table(format('public.%I', v_table)::regclass);
  end loop;
end $$;

-- societe elle-même : cas particulier, son propre id EST l'identifiant du
-- locataire (pas de colonne societe_id sur cette table).
alter table societe enable row level security;
drop policy if exists acces_admin on societe;
create policy acces_admin on societe for all
  using (id = app.societe_id_courante())
  with check (id = app.societe_id_courante());

-- role reste un référentiel système partagé entre toutes les entreprises :
-- sa politique d'origine (auth.uid() is not null) n'est pas modifiée.
