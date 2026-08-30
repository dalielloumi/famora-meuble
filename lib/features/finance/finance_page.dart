import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'caisse/caisse_page.dart';
import 'effets/effets_page.dart';
import 'reglements/reglements_liste_page.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const Material(
            color: AppColors.surface,
            child: TabBar(
              isScrollable: true,
              labelColor: AppColors.accent,
              unselectedLabelColor: AppColors.texte,
              indicatorColor: AppColors.accent,
              tabs: [
                Tab(text: 'Règlements'),
                Tab(text: 'Effets'),
                Tab(text: 'Caisse'),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.bordure),
          const Expanded(
            child: TabBarView(children: [ReglementsListePage(), EffetsPage(), CaissePage()]),
          ),
        ],
      ),
    );
  }
}
