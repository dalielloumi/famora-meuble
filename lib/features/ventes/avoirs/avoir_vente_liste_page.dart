import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/avoir_vente.dart';
import '../../../models/tiers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../providers/ventes_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'avoir_vente_detail_page.dart';

class AvoirVenteListePage extends ConsumerWidget {
  const AvoirVenteListePage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Numéro', field: 'numero', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(title: 'Client', field: 'client', type: PlutoColumnType.text(), enableEditingMode: false, width: 200),
    PlutoColumn(title: 'Motif', field: 'motif', type: PlutoColumnType.text(), enableEditingMode: false, width: 200),
    PlutoColumn(title: 'Date', field: 'date', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(title: 'Statut', field: 'statut', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(
      title: 'Total TTC',
      field: 'total_ttc',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
  ];

  List<PlutoRow> _lignes(List<AvoirVente> liste, Map<String, Tiers> tiersParId) => [
    for (final a in liste)
      PlutoRow(
        cells: {
          'numero': PlutoCell(value: a.numero ?? 'Brouillon'),
          'client': PlutoCell(value: tiersParId[a.clientId]?.raisonSociale ?? '—'),
          'motif': PlutoCell(value: a.motif),
          'date': PlutoCell(value: Formatters.date.format(a.dateAvoir)),
          'statut': PlutoCell(value: a.statut.libelle),
          'total_ttc': PlutoCell(value: Formatters.montant(a.totalTtc)),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avoirsAsync = ref.watch(avoirVenteListeProvider);
    final tiersAsync = ref.watch(tiersListProvider);

    if (avoirsAsync.isLoading || tiersAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (avoirsAsync.hasError) {
      return Center(child: Text('Erreur : ${avoirsAsync.error}', style: const TextStyle(color: AppColors.alerte)));
    }

    final liste = avoirsAsync.value ?? [];
    final tiersParId = {for (final t in tiersAsync.value ?? <Tiers>[]) t.id!: t};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, tiersParId),
      onSelected: (event) {
        final index = event.rowIdx;
        if (index == null) return;
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => AvoirVenteDetailPage(avoirId: liste[index].id!)));
      },
    );
  }
}
