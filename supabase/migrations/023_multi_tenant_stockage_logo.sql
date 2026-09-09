-- ============================================================================
-- 023_multi_tenant_stockage_logo.sql
-- Le bucket "logos" stockait un seul fichier plat ("logo") partagé par tout
-- le monde. Chaque entreprise a désormais son propre dossier
-- (<societe_id>/logo), avec des politiques limitant l'accès au dossier de
-- l'entreprise de l'utilisateur connecté.
-- ============================================================================

drop policy if exists "logos_lecture_authentifie" on storage.objects;
create policy "logos_lecture_authentifie" on storage.objects for select
  using (bucket_id = 'logos' and (storage.foldername(name))[1] = app.societe_id_courante()::text);

drop policy if exists "logos_ecriture_authentifie" on storage.objects;
create policy "logos_ecriture_authentifie" on storage.objects for insert
  with check (bucket_id = 'logos' and (storage.foldername(name))[1] = app.societe_id_courante()::text);

drop policy if exists "logos_maj_authentifie" on storage.objects;
create policy "logos_maj_authentifie" on storage.objects for update
  using (bucket_id = 'logos' and (storage.foldername(name))[1] = app.societe_id_courante()::text);

drop policy if exists "logos_suppression_authentifie" on storage.objects;
create policy "logos_suppression_authentifie" on storage.objects for delete
  using (bucket_id = 'logos' and (storage.foldername(name))[1] = app.societe_id_courante()::text);
