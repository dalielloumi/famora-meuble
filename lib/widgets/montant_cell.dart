import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_text.dart';
import '../core/utils/formatters.dart';

/// Affichage d'un montant avec chiffres tabulaires (PROJET.md section 5).
/// À utiliser pour toute valeur monétaire ou quantité dans les tableaux.
class MontantCell extends StatelessWidget {
  const MontantCell(this.valeur, {super.key, this.suffixe = ' TND', this.accent = false});

  final Decimal valeur;
  final String suffixe;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    return Text(
      Formatters.montant(valeur, suffixe: suffixe),
      style: accent ? AppText.montantAccent : AppText.montant,
      textAlign: TextAlign.right,
    );
  }
}
