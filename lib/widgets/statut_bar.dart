import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

enum EtatStatutBar { brouillon, valide, partiel, solde, annuleImpaye }

/// Signature visuelle du produit (PROJET.md section 5) : une barre colorée en
/// bord gauche de chaque ligne de document. Utilisée partout, jamais
/// recréée localement — l'état de toute l'activité doit se lire d'un coup
/// d'œil sans lire un mot.
class StatutBar extends StatelessWidget {
  const StatutBar({super.key, required this.etat, this.hauteur = 36});

  final EtatStatutBar etat;
  final double hauteur;

  Color get _couleur => switch (etat) {
    EtatStatutBar.brouillon => AppColors.brouillon,
    EtatStatutBar.valide => AppColors.accent,
    EtatStatutBar.partiel => AppColors.attente,
    EtatStatutBar.solde => AppColors.succes,
    EtatStatutBar.annuleImpaye => AppColors.alerte,
  };

  @override
  Widget build(BuildContext context) {
    return Container(width: 4, height: hauteur, color: _couleur);
  }
}
