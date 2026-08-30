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
import '../transferts/transfert_formulaire.dart';

class StockConsultationPage extends ConsumerWidget {
  const StockConsultationPage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(
      title: 'Article',
      field: 'article',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 240,
    ),
    PlutoColumn(title: 'Dépôt', field: 'depot', type: PlutoColumnType.text(), enableEditingMode: false, width: 160),
    PlutoColumn(
      title: 'Quantité',
      field: 'quantite',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
    PlutoColumn(
      title: 'CMP',
      field: 'cmp',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
    PlutoColumn(
      title: 'Valeur stock',
      field: 'valeur',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
  ];

  List<PlutoRow> _lignes(List<StockLigne> liste, Map<String, Article> articlesParId, Map<String, Depot> depotsParId) => [
    for (final s in liste)
      PlutoRow(
        cells: {
          'article': PlutoCell(value: articlesParId[s.articleId]?.designation ?? '—'),
          'depot': PlutoCell(value: depotsParId[s.depotId]?.libelle ?? '—'),
          'quantite': PlutoCell(value: Formatters.quantite(s.quantite)),
          'cmp': PlutoCell(value: Formatters.montant(s.cmp)),
          'valeur': PlutoCell(value: Formatters.montant(s.quantite * s.cmp)),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockAsync = ref.watch(stockListeProvider);
    final articlesAsync = ref.watch(articlesProvider);
    final depotsAsync = ref.watch(depotsProvider);

    if (stockAsync.isLoading || articlesAsync.isLoading || depotsAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (stockAsync.hasError) {
      return Center(child: Text('Erreur : ${stockAsync.error}', style: const TextStyle(color: AppColors.alerte)));
    }

    final liste = stockAsync.value ?? [];
    final articlesParId = {for (final a in articlesAsync.value ?? <Article>[]) a.id!: a};
    final depotsParId = {for (final d in depotsAsync.value ?? <Depot>[]) d.id!: d};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, articlesParId, depotsParId),
      actions: [
        OutlinedButton.icon(
          onPressed: () => ouvrirFormulaireTransfert(context, ref),
          icon: const Icon(Icons.swap_horiz, size: 18),
          label: const Text('Transfert'),
        ),
      ],
    );
  }
}
