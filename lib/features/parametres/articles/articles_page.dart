import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/article.dart';
import '../../../providers/article_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'article_formulaire.dart';

class ArticlesPage extends ConsumerWidget {
  const ArticlesPage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Référence', field: 'reference', type: PlutoColumnType.text(), enableEditingMode: false),
    PlutoColumn(
      title: 'Désignation',
      field: 'designation',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 220,
    ),
    PlutoColumn(title: 'Type', field: 'type', type: PlutoColumnType.text(), enableEditingMode: false),
    PlutoColumn(
      title: 'Prix vente HT',
      field: 'prix_vente',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
    PlutoColumn(
      title: 'Stock géré',
      field: 'gere_stock',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.center,
      width: 100,
    ),
    PlutoColumn(
      title: 'Actif',
      field: 'actif',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.center,
      width: 80,
    ),
  ];

  List<PlutoRow> _lignes(List<Article> articles) => [
    for (final a in articles)
      PlutoRow(
        cells: {
          'reference': PlutoCell(value: a.reference),
          'designation': PlutoCell(value: a.designation),
          'type': PlutoCell(value: a.typeArticle.libelle),
          'prix_vente': PlutoCell(value: '${a.prixVenteHt} TND'),
          'gere_stock': PlutoCell(value: a.gereStock ? 'Oui' : 'Non'),
          'actif': PlutoCell(value: a.actif ? 'Oui' : 'Non'),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesAsync = ref.watch(articlesProvider);

    return articlesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erreur : $e', style: const TextStyle(color: AppColors.alerte))),
      data: (articles) {
        return AppDataGrid(
          colonnes: _colonnes(),
          lignes: _lignes(articles),
          actions: [
            FilledButton.icon(
              onPressed: () => ouvrirFormulaireArticle(context),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Nouvel article'),
            ),
          ],
          onSelected: (event) {
            final index = event.rowIdx;
            if (index == null) return;
            ouvrirFormulaireArticle(context, article: articles[index]);
          },
        );
      },
    );
  }
}
