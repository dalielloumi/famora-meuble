-- ============================================================================
-- 018_fonction_manquante_solde_tiers.sql
-- Corrige un oubli réel dans la migration 011 : app.recalculer_solde_tiers()
-- était appelée par six triggers (affectation de règlement, effet impayé,
-- et les triggers trg_solde_* sur facture_vente/facture_achat/avoir_vente/
-- avoir_achat/reglement) mais sa définition n'avait jamais été écrite,
-- provoquant une erreur 42883 (function does not exist) dès la première
-- facture créée.
--
-- solde tiers = (créances clients dues - avoirs de vente - acomptes non
-- lettrés) - (dettes fournisseurs dues - avoirs d'achat). Un solde positif
-- signifie que le tiers doit de l'argent à la société.
-- Ré-exécutable.
-- ============================================================================

create or replace function app.recalculer_solde_tiers(p_tiers_id uuid) returns void
language plpgsql as $$
declare
  v_creances numeric;
  v_avoirs_ventes numeric;
  v_acomptes numeric;
  v_dettes numeric;
  v_avoirs_achats numeric;
begin
  select coalesce(sum(total_ttc - montant_regle), 0) into v_creances
    from facture_vente where client_id = p_tiers_id and statut = 'VALIDE';

  select coalesce(sum(total_ttc), 0) into v_avoirs_ventes
    from avoir_vente where client_id = p_tiers_id and statut = 'VALIDE';

  select coalesce(sum(reglement.montant), 0) into v_acomptes
    from reglement
   where tiers_id = p_tiers_id
     and sens = 'ENCAISSEMENT'
     and commande_client_id is not null
     and not exists (
       select 1 from reglement_affectation where reglement_affectation.reglement_id = reglement.id
     );

  select coalesce(sum(total_ttc - montant_regle), 0) into v_dettes
    from facture_achat where fournisseur_id = p_tiers_id and statut = 'VALIDE';

  select coalesce(sum(total_ttc), 0) into v_avoirs_achats
    from avoir_achat where fournisseur_id = p_tiers_id and statut = 'VALIDE';

  update tiers
     set solde = round((v_creances - v_avoirs_ventes - v_acomptes) - (v_dettes - v_avoirs_achats), 3)
   where id = p_tiers_id;
end;
$$;
