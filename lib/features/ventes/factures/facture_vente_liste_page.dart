import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/facture_vente.dart';
import '../../../models/tiers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../providers/ventes_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'facture_vente_detail_page.dart';
import 'facture_vente_entete_formulaire.dart';

class FactureVenteListePage extends ConsumerWidget {
  const FactureVenteListePage({super.key});

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(title: 'Numéro', field: 'numero', type: PlutoColumnType.text(), enableEditingMode: false, width: 140),
    PlutoColumn(title: 'Client', field: 'client', type: PlutoColumnType.text(), enableEditingMode: false, width: 200),
    PlutoColumn(title: 'Date', field: 'date', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(title: 'Statut', field: 'statut', type: PlutoColumnType.text(), enableEditingMode: false, width: 100),
    PlutoColumn(
      title: 'Paiement',
      field: 'paiement',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      width: 100,
    ),
    PlutoColumn(
      title: 'Total TTC',
      field: 'total_ttc',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
  ];

  List<PlutoRow> _lignes(List<FactureVente> liste, Map<String, Tiers> tiersParId) => [
    for (final f in liste)
      PlutoRow(
        cells: {
          'numero': PlutoCell(value: f.numero ?? 'Brouillon'),
          'client': PlutoCell(value: tiersParId[f.clientId]?.raisonSociale ?? '—'),
          'date': PlutoCell(value: Formatters.date.format(f.dateFacture)),
          'statut': PlutoCell(value: f.statut.libelle),
          'paiement': PlutoCell(value: f.statutPaiement.libelle),
          'total_ttc': PlutoCell(value: Formatters.montant(f.totalTtc)),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facturesAsync = ref.watch(factureVenteListeProvider);
    final tiersAsync = ref.watch(tiersListProvider);

    if (facturesAsync.isLoading || tiersAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (facturesAsync.hasError) {
      return Center(child: Text('Erreur : ${facturesAsync.error}', style: const TextStyle(color: AppColors.alerte)));
    }

    final liste = facturesAsync.value ?? [];
    final tiersParId = {for (final t in tiersAsync.value ?? <Tiers>[]) t.id!: t};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, tiersParId),
      actions: [
        FilledButton.icon(
          onPressed: () async {
            final facture = await ouvrirCreationFactureVente(context, ref);
            ref.read(factureVenteListeProvider.notifier).rafraichir();
            if (facture != null && context.mounted) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => FactureVenteDetailPage(factureId: facture.id!)));
            }
          },
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Nouvelle facture'),
        ),
      ],
      onSelected: (event) {
        final index = event.rowIdx;
        if (index == null) return;
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => FactureVenteDetailPage(factureId: liste[index].id!)));
      },
    );
  }
}
