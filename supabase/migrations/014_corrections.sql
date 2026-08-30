-- ============================================================================
-- 014_corrections.sql
-- Corrige deux problèmes découverts après la mise en ligne initiale :
--
-- 1. La migration 012 a fait `revoke all on schema app from authenticated`.
--    Or les triggers du schéma app (ex: app.calculer_ligne) s'exécutent avec
--    les droits de l'appelant (authenticated), pas ceux du propriétaire, et
--    leur corps appelle d'autres fonctions app.* par du SQL classique (pas
--    le mécanisme de déclenchement lui-même, qui lui ne demande aucun droit).
--    Ces appels imbriqués ont donc besoin de USAGE sur le schéma app et de
--    EXECUTE sur les fonctions. PostgREST n'exposant que le schéma public
--    (configuration par défaut de Supabase), le schéma app reste de toute
--    façon inatteignable depuis l'API REST : la révocation n'apportait aucune
--    protection supplémentaire et cassait le fonctionnement interne.
--
-- 2. app.provisionner_utilisateur_admin (migration 013) est dans le schéma
--    app, donc jamais exposée en RPC PostgREST. Ajout d'un wrapper public,
--    restreint à l'auto-provisioning (un utilisateur ne peut provisionner que
--    son propre profil).
-- ============================================================================

grant usage on schema app to authenticated;
grant execute on all functions in schema app to authenticated;

alter default privileges in schema app
  grant execute on functions to authenticated;

create or replace function provisionner_utilisateur_admin(p_user_id uuid, p_nom text, p_prenom text)
returns void
language plpgsql
security definer
set search_path = public, app
as $$
begin
  if p_user_id is distinct from auth.uid() then
    raise exception 'Un utilisateur ne peut provisionner que son propre profil.';
  end if;

  perform app.provisionner_utilisateur_admin(p_user_id, p_nom, p_prenom);
end;
$$;

revoke all on function provisionner_utilisateur_admin(uuid, text, text) from public;
grant execute on function provisionner_utilisateur_admin(uuid, text, text) to authenticated;
