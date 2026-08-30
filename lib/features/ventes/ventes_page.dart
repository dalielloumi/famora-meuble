import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'avoirs/avoir_vente_liste_page.dart';
import 'bl/bl_liste_page.dart';
import 'commandes/commande_client_liste_page.dart';
import 'devis/devis_liste_page.dart';
import 'factures/facture_vente_liste_page.dart';
import 'livraisons/livraisons_page.dart';
import 'sav/sav_page.dart';

class VentesPage extends StatelessWidget {
  const VentesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
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
                Tab(text: 'Devis'),
                Tab(text: 'Commandes'),
                Tab(text: 'Bons de livraison'),
                Tab(text: 'Factures'),
                Tab(text: 'Avoirs'),
                Tab(text: 'Livraisons'),
                Tab(text: 'SAV'),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.bordure),
          const Expanded(
            child: TabBarView(
              children: [
                DevisListePage(),
                CommandeClientListePage(),
                BlListePage(),
                FactureVenteListePage(),
                AvoirVenteListePage(),
                LivraisonsPage(),
                SavPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
