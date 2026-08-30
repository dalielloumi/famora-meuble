import 'package:decimal/decimal.dart';

/// Aperçu client des calculs de ligne et de totaux (PROJET.md section 4).
/// Ces fonctions ne remplacent jamais le calcul serveur : la base de données
/// (triggers PL/pgSQL) reste la seule source de vérité. Utilisées uniquement
/// pour afficher un aperçu instantané pendant la saisie, avant validation.
abstract final class Calculs {
  static final _cent = Decimal.fromInt(100);

  static Decimal _arrondi(Decimal valeur) => valeur.round(scale: 3);

  /// Étape 1 : montant_ht_ligne = quantite × prix_unitaire × (1 - remise_pct/100)
  static Decimal montantHtLigne({
    required Decimal quantite,
    required Decimal prixUnitaire,
    required Decimal remisePct,
  }) {
    final coefficientRemise = Decimal.one - (remisePct / _cent).toDecimal(scaleOnInfinitePrecision: 6);
    return _arrondi(quantite * prixUnitaire * coefficientRemise);
  }

  /// FODEC (taxe tunisienne 1 %, migration 017) : montant_fodec_ligne =
  /// montant_ht_ligne × taux_fodec/100. Inclus dans l'assiette de la TVA.
  static Decimal montantFodecLigne({
    required Decimal montantHtLigne,
    required Decimal tauxFodec,
  }) {
    return _arrondi((montantHtLigne * tauxFodec / _cent).toDecimal(scaleOnInfinitePrecision: 6));
  }

  /// Étape 3 (avec FODEC) : montant_tva_ligne = (montant_ht_ligne + montant_fodec_ligne) × taux_tva/100
  static Decimal montantTvaLigne({
    required Decimal montantHtLigne,
    required Decimal montantFodecLigne,
    required Decimal tauxTva,
  }) {
    return _arrondi(
      ((montantHtLigne + montantFodecLigne) * tauxTva / _cent).toDecimal(scaleOnInfinitePrecision: 6),
    );
  }

  /// total_ttc = total_ht + fodec + total_tva + timbre + frais_livraison - retenue_source
  static Decimal totalTtc({
    required Decimal totalHt,
    required Decimal fodec,
    required Decimal totalTva,
    required Decimal timbreFiscal,
    required Decimal fraisLivraison,
    required Decimal retenueSource,
  }) {
    return _arrondi(totalHt + fodec + totalTva + timbreFiscal + fraisLivraison - retenueSource);
  }

  /// retenue_source = total_ht × taux_retenue_source du tiers
  static Decimal retenueSource({
    required Decimal totalHt,
    required Decimal tauxRetenueSource,
  }) {
    return _arrondi((totalHt * tauxRetenueSource / _cent).toDecimal(scaleOnInfinitePrecision: 6));
  }

  /// CMP = (stock × CMP + qté × prix) / (stock + qté)
  static Decimal nouveauCmp({
    required Decimal stockActuel,
    required Decimal cmpActuel,
    required Decimal quantiteEntree,
    required Decimal prixEntree,
  }) {
    final nouveauStock = stockActuel + quantiteEntree;
    if (nouveauStock == Decimal.zero) return Decimal.zero;
    final numerateur = stockActuel * cmpActuel + quantiteEntree * prixEntree;
    return _arrondi((numerateur / nouveauStock).toDecimal(scaleOnInfinitePrecision: 6));
  }
}
