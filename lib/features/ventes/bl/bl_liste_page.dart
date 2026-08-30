import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/bl.dart';
import '../../../models/tiers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../providers/ventes_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'bl_detail_page.dart';
import 'bl_entete_formulaire.dart';

class BlListePage extends ConsumerWidget {
  const BlListePage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Numéro', field: 'numero', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(title: 'Client', field: 'client', type: PlutoColumnType.text(), enableEditingMode: false, width: 200),
    PlutoColumn(title: 'Date', field: 'date', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(title: 'Statut', field: 'statut', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
  ];

  List<PlutoRow> _lignes(List<Bl> liste, Map<String, Tiers> tiersParId) => [
    for (final b in liste)
      PlutoRow(
        cells: {
          'numero': PlutoCell(value: b.numero ?? 'Brouillon'),
          'client': PlutoCell(value: tiersParId[b.clientId]?.raisonSociale ?? '—'),
          'date': PlutoCell(value: Formatters.date.format(b.dateBl)),
          'statut': PlutoCell(value: b.statut.libelle),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blAsync = ref.watch(blListeProvider);
    final tiersAsync = ref.watch(tiersListProvider);

    if (blAsync.isLoading || tiersAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (blAsync.hasError) {
      return Center(child: Text('Erreur : ${blAsync.error}', style: const TextStyle(color: AppColors.alerte)));
    }

    final liste = blAsync.value ?? [];
    final tiersParId = {for (final t in tiersAsync.value ?? <Tiers>[]) t.id!: t};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, tiersParId),
      actions: [
        FilledButton.icon(
          onPressed: () async {
            final bl = await ouvrirCreationBl(context, ref);
            ref.read(blListeProvider.notifier).rafraichir();
            if (bl != null && context.mounted) {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => BlDetailPage(blId: bl.id!)));
            }
          },
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Nouveau BL'),
        ),
      ],
      onSelected: (event) {
        final index = event.rowIdx;
        if (index == null) return;
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => BlDetailPage(blId: liste[index].id!)));
      },
    );
  }
}
