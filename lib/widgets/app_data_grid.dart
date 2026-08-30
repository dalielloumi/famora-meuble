import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text.dart';
import '../core/theme/app_theme.dart';

/// Tableau éditable façon tableur, obligatoire sur tous les écrans de liste
/// (PROJET.md section 2). Inclut une recherche intégrée : le rendu web
/// CanvasKit de Flutter ne permet pas au Ctrl+F du navigateur de trouver du
/// texte dans le canvas (section 2, contraintes Flutter web).
class AppDataGrid extends StatefulWidget {
  const AppDataGrid({
    super.key,
    required this.colonnes,
    required this.lignes,
    this.onLoaded,
    this.onChanged,
    this.onSelected,
    this.actions,
  });

  final List<PlutoColumn> colonnes;
  final List<PlutoRow> lignes;
  final void Function(PlutoGridOnLoadedEvent)? onLoaded;
  final void Function(PlutoGridOnChangedEvent)? onChanged;
  final void Function(PlutoGridOnSelectedEvent)? onSelected;
  final List<Widget>? actions;

  @override
  State<AppDataGrid> createState() => _AppDataGridState();
}

class _AppDataGridState extends State<AppDataGrid> {
  PlutoGridStateManager? _stateManager;

  void _filtrer(String texte) {
    final manager = _stateManager;
    if (manager == null) return;

    if (texte.isEmpty) {
      manager.setFilter(null);
      return;
    }

    final recherche = texte.toLowerCase();
    manager.setFilter(
      (row) => row.cells.values.any((cell) => '${cell.value}'.toLowerCase().contains(recherche)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: AppText.corps,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 18),
                    hintText: 'Rechercher…',
                  ),
                  onChanged: _filtrer,
                ),
              ),
              if (widget.actions != null) ...[const SizedBox(width: 8), ...widget.actions!],
            ],
          ),
        ),
        const Divider(height: 1, color: AppColors.bordure),
        Expanded(
          child: PlutoGrid(
            columns: widget.colonnes,
            rows: widget.lignes,
            mode: PlutoGridMode.normal,
            onLoaded: (event) {
              _stateManager = event.stateManager;
              event.stateManager.setShowColumnFilter(false);
              widget.onLoaded?.call(event);
            },
            onChanged: widget.onChanged,
            onSelected: widget.onSelected,
            configuration: PlutoGridConfiguration(
              style: PlutoGridStyleConfig(
                rowHeight: AppTheme.hauteurLigneGrille,
                columnHeight: AppTheme.hauteurLigneGrille + 6,
                gridBackgroundColor: AppColors.surface,
                rowColor: AppColors.surface,
                borderColor: AppColors.bordure,
                gridBorderColor: AppColors.bordure,
                activatedColor: AppColors.accent.withValues(alpha: 0.08),
                activatedBorderColor: AppColors.accent,
                iconColor: AppColors.texte.withValues(alpha: 0.5),
                columnTextStyle: AppText.libelleChamp,
                cellTextStyle: AppText.corps,
              ),
              columnSize: const PlutoGridColumnSizeConfig(autoSizeMode: PlutoAutoSizeMode.scale),
            ),
          ),
        ),
      ],
    );
  }
}
