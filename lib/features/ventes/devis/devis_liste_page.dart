import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/devis.dart';
import '../../../models/tiers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../providers/ventes_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'devis_detail_page.dart';
import 'devis_entete_formulaire.dart';

class DevisListePage extends ConsumerWidget {
  const DevisListePage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Numéro', field: 'numero', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(
      title: 'Client',
      field: 'client',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 200,
    ),
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

  List<PlutoRow> _lignes(List<Devis> liste, Map<String, Tiers> tiersParId) => [
    for (final d in liste)
      PlutoRow(
        cells: {
          'numero': PlutoCell(value: d.numero ?? 'Brouillon'),
          'client': PlutoCell(value: tiersParId[d.clientId]?.raisonSociale ?? '—'),
          'date': PlutoCell(value: Formatters.date.format(d.dateDevis)),
          'statut': PlutoCell(value: d.statut.libelle),
          'total_ttc': PlutoCell(value: Formatters.montant(d.totalTtc)),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devisAsync = ref.watch(devisListeProvider);
    final tiersAsync = ref.watch(tiersListProvider);

    if (devisAsync.isLoading || tiersAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (devisAsync.hasError) {
      return Center(child: Text('Erreur : ${devisAsync.error}', style: const TextStyle(color: AppColors.alerte)));
    }

    final liste = devisAsync.value ?? [];
    final tiersParId = {for (final t in tiersAsync.value ?? <Tiers>[]) t.id!: t};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, tiersParId),
      actions: [
        FilledButton.icon(
          onPressed: () async {
            final devis = await ouvrirCreationDevis(context, ref);
            ref.read(devisListeProvider.notifier).rafraichir();
            if (devis != null && context.mounted) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => DevisDetailPage(devisId: devis.id!)));
            }
          },
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Nouveau devis'),
        ),
      ],
      onSelected: (event) {
        final index = event.rowIdx;
        if (index == null) return;
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => DevisDetailPage(devisId: liste[index].id!)));
      },
    );
  }
}
