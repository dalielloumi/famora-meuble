-- ============================================================================
-- 015_corrections_numerotation.sql
-- Corrige une violation de la règle « numérotation séquentielle continue sans
-- trou » (section 4) : numero était NOT NULL dès la création, donc un
-- brouillon créé puis abandonné aurait consommé un numéro pour rien. Le
-- numéro est maintenant assigné uniquement à la validation (ou au lancement
-- pour l'OF), jamais à la création d'un brouillon.
-- Ré-exécutable.
-- ============================================================================

alter table devis alter column numero drop not null;
alter table commande_client alter column numero drop not null;
alter table bl alter column numero drop not null;
alter table commande_fournisseur alter column numero drop not null;
alter table reception alter column numero drop not null;
alter table facture_achat alter column numero drop not null;
alter table facture_vente alter column numero drop not null;
alter table avoir_achat alter column numero drop not null;
alter table avoir_vente alter column numero drop not null;
alter table inventaire alter column numero drop not null;
alter table ordre_fabrication alter column numero drop not null;

-- ----------------------------------------------------------------------------
-- Documents à cycle de vie brouillon → validé (ou brouillon → lancé pour
-- l'OF) : le numéro est assigné à cette transition, jamais avant.
-- ----------------------------------------------------------------------------

create or replace function app.assigner_numero_validation() returns trigger
language plpgsql as $$
declare
  v_type type_document := tg_argv[0]::type_document;
begin
  if new.numero is null then
    new.numero := next_numero(v_type, new.exercice_id);
  end if;
  return new;
end;
$$;

drop trigger if exists trg_numero_devis on devis;
create trigger trg_numero_devis before update on devis for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.assigner_numero_validation('DEVIS');

drop trigger if exists trg_numero_commande_client on commande_client;
create trigger trg_numero_commande_client before update on commande_client for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.assigner_numero_validation('COMMANDE_CLIENT');

drop trigger if exists trg_numero_bl on bl;
create trigger trg_numero_bl before update on bl for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.assigner_numero_validation('BL');

drop trigger if exists trg_numero_commande_fournisseur on commande_fournisseur;
create trigger trg_numero_commande_fournisseur before update on commande_fournisseur for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.assigner_numero_validation('COMMANDE_FOURNISSEUR');

drop trigger if exists trg_numero_reception on reception;
create trigger trg_numero_reception before update on reception for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.assigner_numero_validation('RECEPTION');

drop trigger if exists trg_numero_facture_achat on facture_achat;
create trigger trg_numero_facture_achat before update on facture_achat for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.assigner_numero_validation('FACTURE_ACHAT');

drop trigger if exists trg_numero_facture_vente on facture_vente;
create trigger trg_numero_facture_vente before update on facture_vente for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.assigner_numero_validation('FACTURE_VENTE');

drop trigger if exists trg_numero_avoir_achat on avoir_achat;
create trigger trg_numero_avoir_achat before update on avoir_achat for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.assigner_numero_validation('AVOIR_ACHAT');

drop trigger if exists trg_numero_avoir_vente on avoir_vente;
create trigger trg_numero_avoir_vente before update on avoir_vente for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.assigner_numero_validation('AVOIR_VENTE');

drop trigger if exists trg_numero_inventaire on inventaire;
create trigger trg_numero_inventaire before update on inventaire for each row
  when (old.statut = 'BROUILLON' and new.statut = 'VALIDE')
  execute function app.assigner_numero_validation('INVENTAIRE');

drop trigger if exists trg_numero_of on ordre_fabrication;
create trigger trg_numero_of before update on ordre_fabrication for each row
  when (old.statut = 'BROUILLON' and new.statut = 'LANCE')
  execute function app.assigner_numero_validation('OF');

-- ----------------------------------------------------------------------------
-- Documents sans brouillon (créés déjà « définitifs ») : numéro assigné à
-- la création. reglement porte exercice_id ; sav et tournee_livraison non,
-- donc on résout l'exercice ouvert directement.
-- ----------------------------------------------------------------------------

create or replace function app.assigner_numero_creation() returns trigger
language plpgsql as $$
declare
  v_type type_document := tg_argv[0]::type_document;
begin
  if new.numero is null then
    new.numero := next_numero(v_type, new.exercice_id);
  end if;
  return new;
end;
$$;

drop trigger if exists trg_numero_reglement on reglement;
create trigger trg_numero_reglement before insert on reglement for each row
  execute function app.assigner_numero_creation('REGLEMENT');

create or replace function app.assigner_numero_creation_exercice_ouvert() returns trigger
language plpgsql as $$
declare
  v_type type_document := tg_argv[0]::type_document;
begin
  if new.numero is null then
    new.numero := next_numero(v_type, exercice_ouvert());
  end if;
  return new;
end;
$$;

drop trigger if exists trg_numero_sav on sav;
create trigger trg_numero_sav before insert on sav for each row
  execute function app.assigner_numero_creation_exercice_ouvert('SAV');

drop trigger if exists trg_numero_tournee on tournee_livraison;
create trigger trg_numero_tournee before insert on tournee_livraison for each row
  execute function app.assigner_numero_creation_exercice_ouvert('TOURNEE_LIVRAISON');
