import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/article.dart';
import '../../../models/ordre_fabrication.dart';
import '../../../providers/article_providers.dart';
import '../../../providers/atelier_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'of_detail_page.dart';
import 'of_entete_formulaire.dart';

class OfListePage extends ConsumerWidget {
  const OfListePage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Numéro', field: 'numero', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(
      title: 'Produit',
      field: 'article',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 220,
    ),
    PlutoColumn(
      title: 'Qté prévue',
      field: 'qte_prevue',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
    PlutoColumn(
      title: 'Qté produite',
      field: 'qte_produite',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
    PlutoColumn(title: 'Statut', field: 'statut', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
  ];

  List<PlutoRow> _lignes(List<OrdreFabrication> liste, Map<String, Article> articlesParId) => [
    for (final of in liste)
      PlutoRow(
        cells: {
          'numero': PlutoCell(value: of.numero ?? 'Brouillon'),
          'article': PlutoCell(value: articlesParId[of.articleId]?.designation ?? '—'),
          'qte_prevue': PlutoCell(value: Formatters.quantite(of.quantitePrevue)),
          'qte_produite': PlutoCell(value: Formatters.quantite(of.quantiteProduite)),
          'statut': PlutoCell(value: of.statut.libelle),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ofAsync = ref.watch(ordresFabricationProvider);
    final articlesAsync = ref.watch(articlesProvider);

    if (ofAsync.isLoading || articlesAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (ofAsync.hasError) {
      return Center(child: Text('Erreur : ${ofAsync.error}', style: const TextStyle(color: AppColors.alerte)));
    }

    final liste = ofAsync.value ?? [];
    final articlesParId = {for (final a in articlesAsync.value ?? <Article>[]) a.id!: a};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, articlesParId),
      actions: [
        FilledButton.icon(
          onPressed: () async {
            final of = await ouvrirCreationOf(context, ref);
            ref.read(ordresFabricationProvider.notifier).rafraichir();
            if (of != null && context.mounted) {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => OfDetailPage(ofId: of.id!)));
            }
          },
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Nouvel OF'),
        ),
      ],
      onSelected: (event) {
        final index = event.rowIdx;
        if (index == null) return;
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => OfDetailPage(ofId: liste[index].id!)));
      },
    );
  }
}
