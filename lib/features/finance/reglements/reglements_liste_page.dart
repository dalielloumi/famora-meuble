import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/reglement.dart';
import '../../../models/tiers.dart';
import '../../../providers/finance_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'reglement_formulaire_page.dart';

class ReglementsListePage extends ConsumerWidget {
  const ReglementsListePage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Numéro', field: 'numero', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(title: 'Tiers', field: 'tiers', type: PlutoColumnType.text(), enableEditingMode: false, width: 200),
    PlutoColumn(title: 'Sens', field: 'sens', type: PlutoColumnType.text(), enableEditingMode: false, width: 110),
    PlutoColumn(title: 'Mode', field: 'mode', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(title: 'Date', field: 'date', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(
      title: 'Montant',
      field: 'montant',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
  ];

  List<PlutoRow> _lignes(List<Reglement> liste, Map<String, Tiers> tiersParId) => [
    for (final r in liste)
      PlutoRow(
        cells: {
          'numero': PlutoCell(value: r.numero ?? '—'),
          'tiers': PlutoCell(value: tiersParId[r.tiersId]?.raisonSociale ?? '—'),
          'sens': PlutoCell(value: r.sens.libelle),
          'mode': PlutoCell(value: r.mode.libelle),
          'date': PlutoCell(value: Formatters.date.format(r.dateReglement)),
          'montant': PlutoCell(value: Formatters.montant(r.montant)),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reglementsAsync = ref.watch(reglementsProvider);
    final tiersAsync = ref.watch(tiersListProvider);

    if (reglementsAsync.isLoading || tiersAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (reglementsAsync.hasError) {
      return Center(
        child: Text('Erreur : ${reglementsAsync.error}', style: const TextStyle(color: AppColors.alerte)),
      );
    }

    final liste = reglementsAsync.value ?? [];
    final tiersParId = {for (final t in tiersAsync.value ?? <Tiers>[]) t.id!: t};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, tiersParId),
      actions: [
        FilledButton.icon(
          onPressed: () async {
            await Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const ReglementFormulairePage()));
            ref.read(reglementsProvider.notifier).rafraichir();
          },
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Nouveau règlement'),
        ),
      ],
    );
  }
}
