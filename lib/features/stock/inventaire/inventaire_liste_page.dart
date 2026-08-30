import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/depot.dart';
import '../../../models/inventaire.dart';
import '../../../providers/depot_providers.dart';
import '../../../providers/stock_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'inventaire_detail_page.dart';
import 'inventaire_entete_formulaire.dart';

class InventaireListePage extends ConsumerWidget {
  const InventaireListePage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Numéro', field: 'numero', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(title: 'Dépôt', field: 'depot', type: PlutoColumnType.text(), enableEditingMode: false, width: 160),
    PlutoColumn(title: 'Date', field: 'date', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(title: 'Statut', field: 'statut', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
  ];

  List<PlutoRow> _lignes(List<Inventaire> liste, Map<String, Depot> depotsParId) => [
    for (final i in liste)
      PlutoRow(
        cells: {
          'numero': PlutoCell(value: i.numero ?? 'Brouillon'),
          'depot': PlutoCell(value: depotsParId[i.depotId]?.libelle ?? '—'),
          'date': PlutoCell(value: Formatters.date.format(i.dateInventaire)),
          'statut': PlutoCell(value: i.statut.libelle),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inventairesAsync = ref.watch(inventaireListeProvider);
    final depotsAsync = ref.watch(depotsProvider);

    if (inventairesAsync.isLoading || depotsAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (inventairesAsync.hasError) {
      return Center(
        child: Text('Erreur : ${inventairesAsync.error}', style: const TextStyle(color: AppColors.alerte)),
      );
    }

    final liste = inventairesAsync.value ?? [];
    final depotsParId = {for (final d in depotsAsync.value ?? <Depot>[]) d.id!: d};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, depotsParId),
      actions: [
        FilledButton.icon(
          onPressed: () async {
            final inventaire = await ouvrirCreationInventaire(context, ref);
            ref.read(inventaireListeProvider.notifier).rafraichir();
            if (inventaire != null && context.mounted) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => InventaireDetailPage(inventaireId: inventaire.id!)));
            }
          },
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Nouvel inventaire'),
        ),
      ],
      onSelected: (event) {
        final index = event.rowIdx;
        if (index == null) return;
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => InventaireDetailPage(inventaireId: liste[index].id!)));
      },
    );
  }
}
