import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../models/article.dart';
import '../../../models/nomenclature.dart';
import '../../../providers/article_providers.dart';
import '../../../providers/atelier_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'nomenclature_formulaire.dart';

class NomenclaturesPage extends ConsumerWidget {
  const NomenclaturesPage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(
      title: 'Produit fini',
      field: 'article',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 260,
    ),
    PlutoColumn(title: 'Version', field: 'version', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(title: 'Actif', field: 'actif', type: PlutoColumnType.text(), enableEditingMode: false, width: 80),
  ];

  List<PlutoRow> _lignes(List<Nomenclature> liste, Map<String, Article> articlesParId) => [
    for (final n in liste)
      PlutoRow(
        cells: {
          'article': PlutoCell(value: articlesParId[n.articleId]?.designation ?? '—'),
          'version': PlutoCell(value: 'v${n.version}'),
          'actif': PlutoCell(value: n.actif ? 'Oui' : 'Non'),
        },
      ),
  ];

  Future<void> _voirLignes(BuildContext context, WidgetRef ref, Nomenclature n, String nomArticle) async {
    final lignes = await ref.read(nomenclatureRepositoryProvider).chargerLignes(n.id!);
    final articles = await ref.read(articlesProvider.future);
    final articlesParId = {for (final a in articles) a.id!: a};

    if (!context.mounted) return;
    showDialog<void>(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$nomArticle · v${n.version}', style: AppText.sousTitre),
                const SizedBox(height: 12),
                for (final l in lignes)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      '${articlesParId[l.composantId]?.designation ?? l.composantId} — ${l.quantite}',
                      style: AppText.corps,
                    ),
                  ),
                if (lignes.isEmpty) Text('Aucun composant.', style: AppText.corps),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nomenclaturesAsync = ref.watch(nomenclaturesProvider);
    final articlesAsync = ref.watch(articlesProvider);

    if (nomenclaturesAsync.isLoading || articlesAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (nomenclaturesAsync.hasError) {
      return Center(
        child: Text('Erreur : ${nomenclaturesAsync.error}', style: const TextStyle(color: AppColors.alerte)),
      );
    }

    final liste = nomenclaturesAsync.value ?? [];
    final articlesParId = {for (final a in articlesAsync.value ?? <Article>[]) a.id!: a};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, articlesParId),
      actions: [
        FilledButton.icon(
          onPressed: () async {
            await Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const NomenclatureFormulairePage()));
          },
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Nouvelle nomenclature'),
        ),
      ],
      onSelected: (event) {
        final index = event.rowIdx;
        if (index == null) return;
        final n = liste[index];
        _voirLignes(context, ref, n, articlesParId[n.articleId]?.designation ?? '—');
      },
    );
  }
}
