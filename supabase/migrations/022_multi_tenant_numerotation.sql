-- ============================================================================
-- 022_multi_tenant_numerotation.sql
-- Numérotation des documents et exercices comptables scopés par société :
-- chaque entreprise doit avoir sa propre séquence (FV-2026-000001 pour
-- chacune, pas une suite continue partagée), et son propre exercice ouvert.
-- ============================================================================

-- sequence_document : la clé primaire inclut désormais societe_id, pour que
-- deux entreprises ne se disputent jamais le même compteur.
alter table sequence_document drop constraint if exists sequence_document_pkey;
alter table sequence_document add primary key (societe_id, type_document, exercice_id);

create or replace function next_numero(p_type_document type_document, p_exercice_id uuid) returns text
language plpgsql as $$
declare
  v_societe_id uuid := app.societe_id_courante();
  v_annee integer;
  v_prefixe text;
  v_dernier integer;
begin
  select annee into v_annee from exercice where id = p_exercice_id and societe_id = v_societe_id;
  if v_annee is null then
    raise exception 'Exercice % introuvable', p_exercice_id;
  end if;

  v_prefixe := case p_type_document
    when 'DEVIS' then 'DEV'
    when 'COMMANDE_CLIENT' then 'CC'
    when 'BL' then 'BL'
    when 'FACTURE_VENTE' then 'FV'
    when 'AVOIR_VENTE' then 'AV'
    when 'COMMANDE_FOURNISSEUR' then 'CF'
    when 'RECEPTION' then 'REC'
    when 'FACTURE_ACHAT' then 'FA'
    when 'AVOIR_ACHAT' then 'AA'
    when 'OF' then 'OF'
    when 'INVENTAIRE' then 'INV'
    when 'REGLEMENT' then 'RG'
    when 'SAV' then 'SAV'
    when 'TOURNEE_LIVRAISON' then 'TL'
  end;

  insert into sequence_document (societe_id, type_document, exercice_id, dernier_numero)
  values (v_societe_id, p_type_document, p_exercice_id, 0)
  on conflict (societe_id, type_document, exercice_id) do nothing;

  select dernier_numero into v_dernier
    from sequence_document
   where societe_id = v_societe_id and type_document = p_type_document and exercice_id = p_exercice_id
   for update;

  v_dernier := v_dernier + 1;

  update sequence_document
     set dernier_numero = v_dernier
   where societe_id = v_societe_id and type_document = p_type_document and exercice_id = p_exercice_id;

  return format('%s-%s-%s', v_prefixe, v_annee, lpad(v_dernier::text, 6, '0'));
end;
$$;

create or replace function exercice_ouvert() returns uuid
language sql stable as $$
  select id from exercice
   where cloture = false and societe_id = app.societe_id_courante()
   order by annee desc limit 1;
$$;
