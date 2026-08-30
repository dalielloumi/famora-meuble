import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'nomenclatures/nomenclatures_page.dart';
import 'of/of_liste_page.dart';

class AtelierPage extends StatelessWidget {
  const AtelierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                Tab(text: 'Ordres de fabrication'),
                Tab(text: 'Nomenclatures'),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.bordure),
          const Expanded(
            child: TabBarView(children: [OfListePage(), NomenclaturesPage()]),
          ),
        ],
      ),
    );
  }
}
