import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/tiers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'tiers_formulaire.dart';

class TiersPage extends ConsumerWidget {
  const TiersPage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Code', field: 'code', type: PlutoColumnType.text(), enableEditingMode: false, width: 90),
    PlutoColumn(
      title: 'Nom / raison sociale',
      field: 'raison_sociale',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 220,
    ),
    PlutoColumn(title: 'Type', field: 'type', type: PlutoColumnType.text(), enableEditingMode: false, width: 130),
    PlutoColumn(title: 'Ville', field: 'ville', type: PlutoColumnType.text(), enableEditingMode: false),
    PlutoColumn(title: 'Téléphone', field: 'telephone', type: PlutoColumnType.text(), enableEditingMode: false),
    PlutoColumn(
      title: 'Solde',
      field: 'solde',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
      width: 120,
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

  List<PlutoRow> _lignes(List<Tiers> liste) => [
    for (final t in liste)
      PlutoRow(
        cells: {
          'code': PlutoCell(value: t.code),
          'raison_sociale': PlutoCell(value: t.raisonSociale),
          'type': PlutoCell(value: t.type.libelle),
          'ville': PlutoCell(value: t.ville ?? ''),
          'telephone': PlutoCell(value: t.telephone ?? ''),
          'solde': PlutoCell(value: '${t.solde} TND'),
          'actif': PlutoCell(value: t.actif ? 'Oui' : 'Non'),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tiersAsync = ref.watch(tiersListProvider);

    return tiersAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erreur : $e', style: const TextStyle(color: AppColors.alerte))),
      data: (liste) {
        return AppDataGrid(
          colonnes: _colonnes(),
          lignes: _lignes(liste),
          actions: [
            FilledButton.icon(
              onPressed: () => ouvrirFormulaireTiers(context),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Nouveau tiers'),
            ),
          ],
          onSelected: (event) {
            final index = event.rowIdx;
            if (index == null) return;
            ouvrirFormulaireTiers(context, tiers: liste[index]);
          },
        );
      },
    );
  }
}
