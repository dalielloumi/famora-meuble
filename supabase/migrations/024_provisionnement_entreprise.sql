-- ============================================================================
-- 024_provisionnement_entreprise.sql
-- Provisionnement d'une nouvelle entreprise (locataire) : appelé une seule
-- fois, au premier login d'un utilisateur dont le compte a été créé
-- manuellement dans Supabase Auth (pas d'auto-inscription, voir PROJET.md
-- section 3). Crée la société, le profil ADMIN qui la dirige, et les
-- données de référence de base pour que l'espace ne soit pas vide au
-- premier usage (mêmes valeurs que la seed FAMORA, migrations 013 et 020).
--
-- Remplace app.provisionner_utilisateur_admin (013_seed.sql) et son wrapper
-- public (014_corrections.sql), qui ne créaient qu'un profil rattaché à la
-- société singleton — inapplicable maintenant que chaque utilisateur a sa
-- propre société. Même principe de wrapper conservé : la fonction interne
-- (schéma app, jamais exposée en RPC) fait le travail, un wrapper public
-- restreint l'appel à l'auto-provisioning (p_user_id doit être auth.uid()).
-- ============================================================================

drop function if exists provisionner_utilisateur_admin(uuid, text, text);
drop function if exists app.provisionner_utilisateur_admin(uuid, text, text);

create or replace function app.provisionner_nouvelle_entreprise(
  p_user_id uuid,
  p_nom text,
  p_prenom text,
  p_raison_sociale text,
  p_matricule_fiscal text,
  p_adresse text
) returns uuid
language plpgsql security definer set search_path = public as $$
declare
  v_role_id uuid;
  v_societe_id uuid;
  v_exercice_id uuid;
begin
  select id into v_role_id from role where code = 'ADMIN';
  if v_role_id is null then
    raise exception 'Rôle ADMIN introuvable : exécuter la migration 013 avant de provisionner une entreprise.';
  end if;

  insert into societe (raison_sociale, matricule_fiscal, adresse, timbre_fiscal, taux_retenue_source_defaut)
  values (p_raison_sociale, p_matricule_fiscal, p_adresse, 1.000, 1.500)
  returning id into v_societe_id;

  insert into utilisateur_profil (id, societe_id, nom, prenom, role_id, actif)
  values (p_user_id, v_societe_id, p_nom, p_prenom, v_role_id, true)
  on conflict (id) do update
    set societe_id = excluded.societe_id, nom = excluded.nom, prenom = excluded.prenom, role_id = excluded.role_id;

  insert into exercice (societe_id, annee, date_debut, date_fin, cloture)
  values (
    v_societe_id, extract(year from current_date)::integer, date_trunc('year', current_date)::date,
    (date_trunc('year', current_date) + interval '1 year - 1 day')::date, false
  )
  returning id into v_exercice_id;

  insert into depot (societe_id, code, libelle, type) values
    (v_societe_id, 'MAG-01', 'Magasin principal', 'MAGASIN'),
    (v_societe_id, 'ATL-01', 'Atelier de fabrication', 'ATELIER');

  insert into unite_mesure (societe_id, code, libelle) values
    (v_societe_id, 'PCE', 'Pièce'),
    (v_societe_id, 'M2', 'Mètre carré'),
    (v_societe_id, 'ML', 'Mètre linéaire'),
    (v_societe_id, 'M3', 'Mètre cube'),
    (v_societe_id, 'KG', 'Kilogramme'),
    (v_societe_id, 'L', 'Litre');

  insert into taux_tva (societe_id, code, taux, libelle) values
    (v_societe_id, 'TVA19', 19.000, 'TVA 19%'),
    (v_societe_id, 'TVA13', 13.000, 'TVA 13%'),
    (v_societe_id, 'TVA7', 7.000, 'TVA 7%'),
    (v_societe_id, 'TVA0', 0.000, 'Exonéré');

  insert into famille_article (societe_id, code, libelle) values
    (v_societe_id, 'SALON', 'Salon'),
    (v_societe_id, 'CHAMBRE', 'Chambre'),
    (v_societe_id, 'BUREAU', 'Bureau'),
    (v_societe_id, 'CUISINE', 'Cuisine'),
    (v_societe_id, 'SALLE_A_MANGER', 'Salle à manger'),
    (v_societe_id, 'RANGEMENT', 'Rangement'),
    (v_societe_id, 'ACCESSOIRE', 'Accessoire'),
    (v_societe_id, 'AUTRE', 'Autre');

  return v_societe_id;
end;
$$;

-- Wrapper public exposé en RPC (le schéma app ne l'est jamais, voir
-- 014_corrections.sql) — un utilisateur ne peut provisionner que lui-même.
create or replace function provisionner_nouvelle_entreprise(
  p_user_id uuid,
  p_nom text,
  p_prenom text,
  p_raison_sociale text,
  p_matricule_fiscal text,
  p_adresse text
) returns uuid
language plpgsql security definer set search_path = public, app as $$
begin
  if p_user_id is distinct from auth.uid() then
    raise exception 'Un utilisateur ne peut provisionner que sa propre entreprise.';
  end if;

  return app.provisionner_nouvelle_entreprise(
    p_user_id, p_nom, p_prenom, p_raison_sociale, p_matricule_fiscal, p_adresse
  );
end;
$$;

revoke all on function provisionner_nouvelle_entreprise(uuid, text, text, text, text, text) from public;
grant execute on function provisionner_nouvelle_entreprise(uuid, text, text, text, text, text) to authenticated;
