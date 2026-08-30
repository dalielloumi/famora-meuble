import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/avoir_achat.dart';
import '../../../models/tiers.dart';
import '../../../providers/achats_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'avoir_achat_detail_page.dart';

class AvoirAchatListePage extends ConsumerWidget {
  const AvoirAchatListePage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Numéro', field: 'numero', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(
      title: 'Fournisseur',
      field: 'fournisseur',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 200,
    ),
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

  List<PlutoRow> _lignes(List<AvoirAchat> liste, Map<String, Tiers> tiersParId) => [
    for (final a in liste)
      PlutoRow(
        cells: {
          'numero': PlutoCell(value: a.numero ?? 'Brouillon'),
          'fournisseur': PlutoCell(value: tiersParId[a.fournisseurId]?.raisonSociale ?? '—'),
          'motif': PlutoCell(value: a.motif),
          'date': PlutoCell(value: Formatters.date.format(a.dateAvoir)),
          'statut': PlutoCell(value: a.statut.libelle),
          'total_ttc': PlutoCell(value: Formatters.montant(a.totalTtc)),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avoirsAsync = ref.watch(avoirAchatListeProvider);
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
        ).push(MaterialPageRoute(builder: (_) => AvoirAchatDetailPage(avoirId: liste[index].id!)));
      },
    );
  }
}
