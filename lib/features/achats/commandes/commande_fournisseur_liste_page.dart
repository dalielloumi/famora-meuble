import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/commande_fournisseur.dart';
import '../../../models/tiers.dart';
import '../../../providers/achats_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'commande_fournisseur_detail_page.dart';
import 'commande_fournisseur_entete_formulaire.dart';

class CommandeFournisseurListePage extends ConsumerWidget {
  const CommandeFournisseurListePage({super.key});

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
    PlutoColumn(
      title: 'Total TTC',
      field: 'total_ttc',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
    ),
  ];

  List<PlutoRow> _lignes(List<CommandeFournisseur> liste, Map<String, Tiers> tiersParId) => [
    for (final c in liste)
      PlutoRow(
        cells: {
          'numero': PlutoCell(value: c.numero ?? 'Brouillon'),
          'fournisseur': PlutoCell(value: tiersParId[c.fournisseurId]?.raisonSociale ?? '—'),
          'date': PlutoCell(value: Formatters.date.format(c.dateCommande)),
          'statut': PlutoCell(value: c.statut.libelle),
          'total_ttc': PlutoCell(value: Formatters.montant(c.totalTtc)),
        },
      ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commandesAsync = ref.watch(commandeFournisseurListeProvider);
    final tiersAsync = ref.watch(tiersListProvider);

    if (commandesAsync.isLoading || tiersAsync.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (commandesAsync.hasError) {
      return Center(child: Text('Erreur : ${commandesAsync.error}', style: const TextStyle(color: AppColors.alerte)));
    }

    final liste = commandesAsync.value ?? [];
    final tiersParId = {for (final t in tiersAsync.value ?? <Tiers>[]) t.id!: t};

    return AppDataGrid(
      colonnes: _colonnes(),
      lignes: _lignes(liste, tiersParId),
      actions: [
        FilledButton.icon(
          onPressed: () async {
            final commande = await ouvrirCreationCommandeFournisseur(context, ref);
            ref.read(commandeFournisseurListeProvider.notifier).rafraichir();
            if (commande != null && context.mounted) {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => CommandeFournisseurDetailPage(commandeId: commande.id!)));
            }
          },
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Nouvelle commande'),
        ),
      ],
      onSelected: (event) {
        final index = event.rowIdx;
        if (index == null) return;
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => CommandeFournisseurDetailPage(commandeId: liste[index].id!)));
      },
    );
  }
}
