import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'consultation/stock_consultation_page.dart';
import 'inventaire/inventaire_liste_page.dart';
import 'mouvements/mouvements_page.dart';
import 'produits/produits_catalogue_page.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

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
                Tab(text: 'Produits'),
                Tab(text: 'Stock par dépôt'),
                Tab(text: 'Mouvements'),
                Tab(text: 'Inventaires'),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.bordure),
          const Expanded(
            child: TabBarView(
              children: [
                ProduitsCataloguePage(),
                StockConsultationPage(),
                MouvementsPage(),
                InventaireListePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
