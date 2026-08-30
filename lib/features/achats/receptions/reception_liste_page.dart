import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/reception.dart';
import '../../../models/tiers.dart';
import '../../../providers/achats_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'reception_detail_page.dart';

class ReceptionListePage extends ConsumerWidget {
  const ReceptionListePage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Numéro', field: 'numero', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(
      title: 'Fournisseur',
      field: 'fournisseur',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 200,
    ),
    PlutoColumn(title: 'Date', field: 'date', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(title: 'Statut', field: 'statut', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
  ];

  List<PlutoRow> _lignes(List<Reception> liste, Map<String, Tiers> tiersParId) => [
    for (final r in liste)
      PlutoRow(
        cells: {
          'numero': PlutoCell(value: r.numero ?? 'Brouillon'),
          'fournisseur': PlutoCell(value: tiersParId[r.fournisseurId]?.raisonSociale ?? '—'),
          'date': PlutoCell(value: Formatters.date.format(r.dateReception)),
          'statut': PlutoCell(value: r.statut.libelle),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receptionsAsync = ref.watch(receptionListeProvider);
    final tiersAsync = ref.watch(tiersListProvider);

    if (receptionsAsync.isLoading || tiersAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (receptionsAsync.hasError) {
      return Center(child: Text('Erreur : ${receptionsAsync.error}', style: const TextStyle(color: AppColors.alerte)));
    }

    final liste = receptionsAsync.value ?? [];
    final tiersParId = {for (final t in tiersAsync.value ?? <Tiers>[]) t.id!: t};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, tiersParId),
      onSelected: (event) {
        final index = event.rowIdx;
        if (index == null) return;
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => ReceptionDetailPage(receptionId: liste[index].id!)));
      },
    );
  }
}
