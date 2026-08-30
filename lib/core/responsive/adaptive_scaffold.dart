import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text.dart';
import 'breakpoints.dart';

class DestinationNav {
  const DestinationNav({required this.emoji, required this.label});

  final String emoji;
  final String label;
}

/// Un seul arbre de widgets, deux mises en page décidées par [LayoutBuilder]
/// au seuil de 900 px (PROJET.md section 5) : NavigationRail fixe à gauche en
/// desktop, barre de navigation façon FAMORA MEUBLE en mobile.
class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    super.key,
    required this.destinations,
    required this.indexSelectionne,
    required this.surSelection,
    required this.enfant,
    this.titre = 'Gestion Meuble',
  });

  final List<DestinationNav> destinations;
  final int indexSelectionne;
  final ValueChanged<int> surSelection;
  final Widget enfant;
  final String titre;

  @override
  Widget build(BuildContext context) {
    final estDesktop = Breakpoints.estDesktop(context);

    if (estDesktop) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: indexSelectionne,
              onDestinationSelected: surSelection,
              labelType: NavigationRailLabelType.all,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  titre,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              destinations: [
                for (final d in destinations)
                  NavigationRailDestination(
                    icon: Text(d.emoji, style: const TextStyle(fontSize: 20)),
                    label: Text(d.label),
                  ),
              ],
            ),
            const VerticalDivider(width: 1, color: AppColors.bordure),
            Expanded(child: enfant),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        title: Text(
          destinations[indexSelectionne].label,
          style: const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.3),
        ),
      ),
      body: enfant,
      bottomNavigationBar: _BarreNavigationFamora(
        destinations: destinations,
        indexSelectionne: indexSelectionne,
        surSelection: surSelection,
      ),
    );
  }
}

class _BarreNavigationFamora extends StatelessWidget {
  const _BarreNavigationFamora({
    required this.destinations,
    required this.indexSelectionne,
    required this.surSelection,
  });

  final List<DestinationNav> destinations;
  final int indexSelectionne;
  final ValueChanged<int> surSelection;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.bordure)),
        boxShadow: [BoxShadow(color: Color(0x1A2C4A1E), blurRadius: 16, offset: Offset(0, -4))],
      ),
      padding: EdgeInsets.only(top: 8, bottom: 8 + MediaQuery.paddingOf(context).bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < destinations.length; i++)
            _OngletNav(
              destination: destinations[i],
              actif: i == indexSelectionne,
              onTap: () => surSelection(i),
            ),
        ],
      ),
    );
  }
}

class _OngletNav extends StatelessWidget {
  const _OngletNav({required this.destination, required this.actif, required this.onTap});

  final DestinationNav destination;
  final bool actif;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                transform: Matrix4.translationValues(0, actif ? -2 : 0, 0),
                child: Text(destination.emoji, style: const TextStyle(fontSize: 21)),
              ),
              const SizedBox(height: 3),
              Text(
                destination.label,
                style: AppText.corps.copyWith(
                  fontSize: 9.5,
                  letterSpacing: 0.2,
                  fontWeight: actif ? FontWeight.w700 : FontWeight.w500,
                  color: actif ? AppColors.accent : AppColors.texteAttenue,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: actif ? AppColors.accent : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
