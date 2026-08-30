import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'avoirs/avoir_achat_liste_page.dart';
import 'commandes/commande_fournisseur_liste_page.dart';
import 'factures/facture_achat_liste_page.dart';
import 'receptions/reception_liste_page.dart';

class AchatsPage extends StatelessWidget {
  const AchatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
                Tab(text: 'Commandes'),
                Tab(text: 'Réceptions'),
                Tab(text: 'Factures'),
                Tab(text: 'Avoirs'),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.bordure),
          const Expanded(
            child: TabBarView(
              children: [
                CommandeFournisseurListePage(),
                ReceptionListePage(),
                FactureAchatListePage(),
                AvoirAchatListePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
