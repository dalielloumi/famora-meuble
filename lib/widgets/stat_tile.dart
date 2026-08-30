import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text.dart';

class StatTile extends StatelessWidget {
  const StatTile({super.key, required this.libelle, required this.valeur, this.accent = AppColors.accent});

  final String libelle;
  final String valeur;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.bordure),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(libelle, style: AppText.corps.copyWith(color: AppColors.texteAttenue)),
          const SizedBox(height: 8),
          Text(valeur, style: AppText.montantVitrine.copyWith(color: accent)),
        ],
      ),
    );
  }
}
