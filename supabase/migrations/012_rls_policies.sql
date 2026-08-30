-- ============================================================================
-- 012_rls_policies.sql
-- Chaque table a déjà reçu sa policy RLS dans sa propre migration de création
-- (app.securiser_table, appelée juste après chaque CREATE TABLE — règle
-- PROJET.md section 8). Cette migration :
--   1. accorde les GRANT PostgREST nécessaires (obligatoire pour les projets
--      Supabase créés après le 30/05/2026, sinon les tables ne sont pas
--      exposées par l'API) ;
--   2. vérifie qu'aucune table publique n'a été oubliée sans RLS.
-- Aucun accès n'est donné au rôle anon : application interne, sans portail
-- public (section 2/3 de PROJET.md).
-- Ré-exécutable.
-- ============================================================================

grant usage on schema public to authenticated;

grant select, insert, update, delete on all tables in schema public to authenticated;

grant execute on all functions in schema public to authenticated;

-- Les objets créés par de futures migrations héritent des mêmes droits.
alter default privileges in schema public
  grant select, insert, update, delete on tables to authenticated;

alter default privileges in schema public
  grant execute on functions to authenticated;

-- Le schéma app (fonctions internes) n'est jamais exposé à PostgREST : pas de grant.
revoke all on schema app from anon, authenticated;

-- ----------------------------------------------------------------------------
-- Garde-fou : toute table du schéma public doit avoir la RLS activée.
-- ----------------------------------------------------------------------------

do $$
declare
  r record;
begin
  for r in
    select schemaname, tablename
      from pg_tables
     where schemaname = 'public'
       and rowsecurity = false
  loop
    raise exception 'RLS désactivée sur %.%: ajouter app.securiser_table(''public.%'') dans la migration concernée.',
      r.schemaname, r.tablename, r.tablename;
  end loop;
end $$;
