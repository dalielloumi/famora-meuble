import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text.dart';

/// Page de remplacement pour les modules pas encore construits (voir
/// AVANCEMENT.md pour l'ordre de construction, PROJET.md section 7).
class EnConstructionPage extends StatelessWidget {
  const EnConstructionPage({super.key, required this.titre});

  final String titre;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.construction, color: AppColors.attente, size: 32),
          const SizedBox(height: 12),
          Text(titre, style: AppText.titre),
          const SizedBox(height: 4),
          Text('Module pas encore construit.', style: AppText.corps),
        ],
      ),
    );
  }
}
