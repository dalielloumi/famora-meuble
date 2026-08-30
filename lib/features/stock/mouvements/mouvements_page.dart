import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/article.dart';
import '../../../models/depot.dart';
import '../../../models/stock.dart';
import '../../../providers/article_providers.dart';
import '../../../providers/depot_providers.dart';
import '../../../providers/stock_providers.dart';
import '../../../widgets/app_data_grid.dart';

class MouvementsPage extends ConsumerWidget {
  const MouvementsPage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Date', field: 'date', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(title: 'Type', field: 'type', type: PlutoColumnType.text(), enableEditingMode: false, width: 160),
    PlutoColumn(
      title: 'Article',
      field: 'article',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 220,
    ),
    PlutoColumn(title: 'Dépôt', field: 'depot', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(title: 'Sens', field: 'sens', type: PlutoColumnType.text(), enableEditingMode: false, width: 80),
    PlutoColumn(
      title: 'Quantité',
      field: 'quantite',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
    PlutoColumn(
      title: 'Prix U.',
      field: 'prix',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
  ];

  List<PlutoRow> _lignes(
    List<MouvementStock> liste,
    Map<String, Article> articlesParId,
    Map<String, Depot> depotsParId,
  ) => [
    for (final m in liste)
      PlutoRow(
        cells: {
          'date': PlutoCell(value: Formatters.dateHeure.format(m.dateMouvement)),
          'type': PlutoCell(value: m.typeMouvement.libelle),
          'article': PlutoCell(value: articlesParId[m.articleId]?.designation ?? '—'),
          'depot': PlutoCell(value: depotsParId[m.depotId]?.libelle ?? '—'),
          'sens': PlutoCell(value: m.sens == SensMouvement.entree ? 'Entrée' : 'Sortie'),
          'quantite': PlutoCell(value: Formatters.quantite(m.quantite)),
          'prix': PlutoCell(value: Formatters.montant(m.prixUnitaire)),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mouvementsAsync = ref.watch(mouvementsProvider);
    final articlesAsync = ref.watch(articlesProvider);
    final depotsAsync = ref.watch(depotsProvider);

    if (mouvementsAsync.isLoading || articlesAsync.isLoading || depotsAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (mouvementsAsync.hasError) {
      return Center(
        child: Text('Erreur : ${mouvementsAsync.error}', style: const TextStyle(color: AppColors.alerte)),
      );
    }

    final liste = mouvementsAsync.value ?? [];
    final articlesParId = {for (final a in articlesAsync.value ?? <Article>[]) a.id!: a};
    final depotsParId = {for (final d in depotsAsync.value ?? <Depot>[]) d.id!: d};

    return AppDataGrid(colonnes: _colonnes(), lignes: _lignes(liste, articlesParId, depotsParId));
  }
}
