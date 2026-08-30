-- ============================================================================
-- 019_stockage_logo.sql
-- Bucket de stockage pour le logo de la société (Supabase Storage). Privé :
-- accessible uniquement à l'utilisateur authentifié (même politique que le
-- reste de l'application, section 2/3 de PROJET.md — aucun accès public).
-- Ré-exécutable.
-- ============================================================================

insert into storage.buckets (id, name, public)
values ('logos', 'logos', false)
on conflict (id) do nothing;

drop policy if exists "logos_lecture_authentifie" on storage.objects;
create policy "logos_lecture_authentifie" on storage.objects for select
  using (bucket_id = 'logos' and auth.uid() is not null);

drop policy if exists "logos_ecriture_authentifie" on storage.objects;
create policy "logos_ecriture_authentifie" on storage.objects for insert
  with check (bucket_id = 'logos' and auth.uid() is not null);

drop policy if exists "logos_maj_authentifie" on storage.objects;
create policy "logos_maj_authentifie" on storage.objects for update
  using (bucket_id = 'logos' and auth.uid() is not null);

drop policy if exists "logos_suppression_authentifie" on storage.objects;
create policy "logos_suppression_authentifie" on storage.objects for delete
  using (bucket_id = 'logos' and auth.uid() is not null);
