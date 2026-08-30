import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/depot.dart';
import '../../../providers/depot_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'depot_formulaire.dart';

class DepotsPage extends ConsumerWidget {
  const DepotsPage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Code', field: 'code', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(
      title: 'Libellé',
      field: 'libelle',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 220,
    ),
    PlutoColumn(title: 'Type', field: 'type', type: PlutoColumnType.text(), enableEditingMode: false),
    PlutoColumn(title: 'Adresse', field: 'adresse', type: PlutoColumnType.text(), enableEditingMode: false),
    PlutoColumn(
      title: 'Actif',
      field: 'actif',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.center,
      width: 80,
    ),
  ];

  List<PlutoRow> _lignes(List<Depot> liste) => [
    for (final d in liste)
      PlutoRow(
        cells: {
          'code': PlutoCell(value: d.code),
          'libelle': PlutoCell(value: d.libelle),
          'type': PlutoCell(value: d.type.libelle),
          'adresse': PlutoCell(value: d.adresse ?? ''),
          'actif': PlutoCell(value: d.actif ? 'Oui' : 'Non'),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final depotsAsync = ref.watch(depotsProvider);

    return depotsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erreur : $e', style: const TextStyle(color: AppColors.alerte))),
      data: (liste) {
        return AppDataGrid(
          colonnes: _colonnes(),
          lignes: _lignes(liste),
          actions: [
            FilledButton.icon(
              onPressed: () => ouvrirFormulaireDepot(context),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Nouveau dépôt'),
            ),
          ],
          onSelected: (event) {
            final index = event.rowIdx;
            if (index == null) return;
            ouvrirFormulaireDepot(context, depot: liste[index]);
          },
        );
      },
    );
  }
}
