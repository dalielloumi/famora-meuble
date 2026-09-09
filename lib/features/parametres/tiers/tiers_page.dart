import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/tiers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../widgets/app_data_grid.dart';
import 'tiers_formulaire.dart';

class TiersPage extends ConsumerStatefulWidget {
  const TiersPage({super.key});

  @override
  ConsumerState<TiersPage> createState() => _TiersPageState();
}

class _TiersPageState extends ConsumerState<TiersPage> {
  PlutoGridStateManager? _stateManager;
  int _nombreCoches = 0;
  bool _suppressionEnCours = false;

  List<PlutoColumn> _colonnes() => [
    PlutoColumn(
      title: 'Code',
      field: 'code',
      type: PlutoColumnType.text(),
      enableEditingMode: false,
      enableRowChecked: true,
      width: 110,
    ),
    PlutoColumn(title: 'id', field: 'id', type: PlutoColumnType.text(), hide: true, width: 1),
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
          'id': PlutoCell(value: t.id ?? ''),
          'raison_sociale': PlutoCell(value: t.raisonSociale),
          'type': PlutoCell(value: t.type.libelle),
          'ville': PlutoCell(value: t.ville ?? ''),
          'telephone': PlutoCell(value: t.telephone ?? ''),
          'solde': PlutoCell(value: '${t.solde} TND'),
          'actif': PlutoCell(value: t.actif ? 'Oui' : 'Non'),
        },
      ),
  ];

  Future<void> _supprimerSelection() async {
    final manager = _stateManager;
    if (manager == null) return;
    final ids = [
      for (final row in manager.checkedRows) row.cells['id']!.value as String,
    ];
    if (ids.isEmpty) return;

    final confirme = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Supprimer la sélection'),
        content: Text(
          ids.length == 1
              ? 'Supprimer définitivement ce tiers ?'
              : 'Supprimer définitivement ces ${ids.length} tiers ?',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Annuler')),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.alerte),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
    if (confirme != true) return;

    setState(() => _suppressionEnCours = true);
    final echecs = await ref.read(tiersListProvider.notifier).supprimerPlusieurs(ids);
    if (!mounted) return;
    setState(() {
      _suppressionEnCours = false;
      _nombreCoches = 0;
    });

    if (echecs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${ids.length - echecs.length} supprimé(s). ${echecs.length} impossible(s) : encore utilisé(s) dans '
            'des documents (désactivez-les plutôt).',
          ),
          backgroundColor: AppColors.alerte,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final tiersAsync = ref.watch(tiersListProvider);

    return tiersAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erreur : $e', style: const TextStyle(color: AppColors.alerte))),
      data: (liste) {
        return AppDataGrid(
          colonnes: _colonnes(),
          lignes: _lignes(liste),
          actions: [
            if (_nombreCoches > 0)
              OutlinedButton.icon(
                onPressed: _suppressionEnCours ? null : _supprimerSelection,
                style: OutlinedButton.styleFrom(foregroundColor: AppColors.alerte),
                icon: _suppressionEnCours
                    ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.delete_outline, size: 18),
                label: Text('Supprimer ($_nombreCoches)'),
              ),
            FilledButton.icon(
              onPressed: () => ouvrirFormulaireTiers(context),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Nouveau tiers'),
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
            ouvrirFormulaireTiers(context, tiers: liste[index]);
          },
        );
      },
    );
  }
}
