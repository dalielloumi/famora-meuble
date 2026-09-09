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

class FactureVenteListePage extends ConsumerStatefulWidget {
  const FactureVenteListePage({super.key});

  @override
  ConsumerState<FactureVenteListePage> createState() => _FactureVenteListePageState();
}

class _FactureVenteListePageState extends ConsumerState<FactureVenteListePage> {
  PlutoGridStateManager? _stateManager;
  int _nombreCoches = 0;
  bool _traitementEnCours = false;

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(
      title: 'Numéro',
      field: 'numero',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      enableRowChecked: true,
      width: 140,
    ),
    PlutoColumn(title: 'id', field: 'id', type: PlutoColumnType.text(), hide: true, width: 1),
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
          'id': PlutoCell(value: f.id ?? ''),
          'client': PlutoCell(value: tiersParId[f.clientId]?.raisonSociale ?? '—'),
          'date': PlutoCell(value: Formatters.date.format(f.dateFacture)),
          'statut': PlutoCell(value: f.statut.libelle),
          'paiement': PlutoCell(value: f.statutPaiement.libelle),
          'total_ttc': PlutoCell(value: Formatters.montant(f.totalTtc)),
        },
      ),
  ];

  Future<void> _traiterSelection() async {
    final manager = _stateManager;
    if (manager == null) return;
    final ids = [
      for (final row in manager.checkedRows) row.cells['id']!.value as String,
    ];
    if (ids.isEmpty) return;

    final confirme = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Traiter la sélection'),
        content: Text(
          'Les brouillons seront supprimés, les factures déjà validées seront annulées.\n'
          '${ids.length} document(s) concerné(s). Une facture déjà réglée ne peut pas être annulée.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Annuler')),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.alerte),
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
    if (confirme != true) return;

    setState(() => _traitementEnCours = true);
    final echecs = await ref.read(factureVenteListeProvider.notifier).annulerOuSupprimerPlusieurs(ids);
    if (!mounted) return;
    setState(() {
      _traitementEnCours = false;
      _nombreCoches = 0;
    });
    if (echecs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${ids.length - echecs.length} traité(s). ${echecs.length} échec(s).'),
          backgroundColor: AppColors.alerte,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
        if (_nombreCoches > 0)
          OutlinedButton.icon(
            onPressed: _traitementEnCours ? null : _traiterSelection,
            style: OutlinedButton.styleFrom(foregroundColor: AppColors.alerte),
            icon: _traitementEnCours
                ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.block, size: 18),
            label: Text('Annuler/Supprimer ($_nombreCoches)'),
          ),
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
      onLoaded: (event) => _stateManager = event.stateManager,
      onRowChecked: (event) {
        final manager = _stateManager;
        if (manager == null) return;
        setState(() => _nombreCoches = manager.checkedRows.length);
      },
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
