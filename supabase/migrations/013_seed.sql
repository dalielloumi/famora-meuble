-- ============================================================================
-- 013_seed.sql
-- Données de référence minimales : rôle ADMIN, société, exercice, dépôts,
-- unités, taux de TVA. Ré-exécutable (ON CONFLICT DO NOTHING / DO UPDATE).
--
-- L'utilisateur applicatif n'est PAS créé ici : Supabase Auth doit rester seul
-- maître des mots de passe (hachage géré par GoTrue). Étapes après cette
-- migration :
--   1. Créer le compte dans Supabase Dashboard > Authentication > Add user.
--   2. Appeler select app.provisionner_utilisateur_admin('<uuid auth>', 'Nom', 'Prénom');
-- ============================================================================

insert into role (code, libelle) values ('ADMIN', 'Administrateur')
on conflict (code) do nothing;

insert into societe (id, raison_sociale, matricule_fiscal, adresse, timbre_fiscal, taux_retenue_source_defaut)
values (true, 'À renseigner', '0000000A', 'À renseigner, Tunisie', 1.000, 1.500)
on conflict (id) do nothing;

insert into exercice (annee, date_debut, date_fin, cloture)
values (extract(year from current_date)::integer, date_trunc('year', current_date)::date,
        (date_trunc('year', current_date) + interval '1 year - 1 day')::date, false)
on conflict (annee) do nothing;

insert into depot (code, libelle, type) values
  ('MAG-01', 'Magasin principal', 'MAGASIN'),
  ('ATL-01', 'Atelier de fabrication', 'ATELIER')
on conflict (code) do nothing;

insert into unite_mesure (code, libelle) values
  ('PCE', 'Pièce'),
  ('M2', 'Mètre carré'),
  ('ML', 'Mètre linéaire'),
  ('M3', 'Mètre cube'),
  ('KG', 'Kilogramme'),
  ('L', 'Litre')
on conflict (code) do nothing;

insert into taux_tva (code, taux, libelle) values
  ('TVA19', 19.000, 'TVA 19%'),
  ('TVA13', 13.000, 'TVA 13%'),
  ('TVA7', 7.000, 'TVA 7%'),
  ('TVA0', 0.000, 'Exonéré')
on conflict (code) do nothing;

-- ----------------------------------------------------------------------------
-- app.provisionner_utilisateur_admin — à appeler une fois le compte créé dans
-- Supabase Auth, pour créer le profil applicatif correspondant.
-- ----------------------------------------------------------------------------

create or replace function app.provisionner_utilisateur_admin(p_user_id uuid, p_nom text, p_prenom text) returns void
language plpgsql as $$
declare
  v_role_id uuid;
begin
  select id into v_role_id from role where code = 'ADMIN';
  if v_role_id is null then
    raise exception 'Rôle ADMIN introuvable : exécuter la migration 013 avant de provisionner un utilisateur.';
  end if;

  insert into utilisateur_profil (id, nom, prenom, role_id, actif)
  values (p_user_id, p_nom, p_prenom, v_role_id, true)
  on conflict (id) do update set nom = excluded.nom, prenom = excluded.prenom, role_id = excluded.role_id;
end;
$$;

grant execute on function app.provisionner_utilisateur_admin(uuid, text, text) to authenticated;
