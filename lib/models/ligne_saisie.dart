import 'package:decimal/decimal.dart';

import '../core/utils/calculs.dart';

/// Vue-modèle mutable d'une ligne de document en cours de saisie (devis,
/// commande, facture…). Structure commune à toutes les tables *_ligne
/// (article, variante, quantité, prix, remise, TVA) — jamais persistée telle
/// quelle : convertie en payload spécifique par chaque repository au moment
/// de l'enregistrement. Les totaux affichés ici sont un aperçu (Decimal,
/// jamais double) ; le calcul qui fait foi reste celui des triggers PL/pgSQL
/// (PROJET.md section 4 et 8, migration 017 pour le FODEC).
class LigneSaisie {
  LigneSaisie({
    this.id,
    required this.articleId,
    required this.designation,
    this.varianteId,
    required this.quantite,
    required this.prixUnitaire,
    Decimal? remisePct,
    required this.tauxTvaId,
    required this.tauxTvaPct,
    Decimal? tauxFodecPct,
  }) : remisePct = remisePct ?? Decimal.zero,
       tauxFodecPct = tauxFodecPct ?? Decimal.zero;

  final String? id;
  final String articleId;
  final String designation;
  final String? varianteId;
  Decimal quantite;
  Decimal prixUnitaire;
  Decimal remisePct;
  final String tauxTvaId;
  final Decimal tauxTvaPct;

  /// Taux FODEC (1 % sur le cycle vente, 0 ailleurs — BL et cycle achat).
  final Decimal tauxFodecPct;

  Decimal get montantHt =>
      Calculs.montantHtLigne(quantite: quantite, prixUnitaire: prixUnitaire, remisePct: remisePct);

  Decimal get montantFodec => Calculs.montantFodecLigne(montantHtLigne: montantHt, tauxFodec: tauxFodecPct);

  Decimal get montantTva =>
      Calculs.montantTvaLigne(montantHtLigne: montantHt, montantFodecLigne: montantFodec, tauxTva: tauxTvaPct);

  Decimal get montantTtc => montantHt + montantFodec + montantTva;
}
