import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/tiers.dart';
import '../providers/tiers_providers.dart';

/// Sélecteur de tiers (client ou fournisseur) avec recherche, utilisé dans
/// tous les formulaires d'en-tête de document (PROJET.md section 6).
class TiersSelect extends ConsumerWidget {
  const TiersSelect({
    super.key,
    required this.onSelectionnee,
    this.tiersInitial,
    this.pourClient = true,
    this.label = 'Client',
  });

  final ValueChanged<Tiers> onSelectionnee;
  final Tiers? tiersInitial;
  final bool pourClient;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tiersAsync = ref.watch(tiersListProvider);

    return tiersAsync.when(
      loading: () => const LinearProgressIndicator(),
      error: (e, _) => Text('Erreur chargement tiers : $e'),
      data: (liste) {
        final eligibles = liste
            .where(
              (t) =>
                  t.actif &&
                  (t.type == TypeTiers.lesDeux ||
                      (pourClient && t.type == TypeTiers.client) ||
                      (!pourClient && t.type == TypeTiers.fournisseur)),
            )
            .toList();

        return Autocomplete<Tiers>(
          initialValue: TextEditingValue(text: tiersInitial?.raisonSociale ?? ''),
          displayStringForOption: (t) => t.raisonSociale,
          optionsBuilder: (texte) {
            if (texte.text.isEmpty) return eligibles;
            final recherche = texte.text.toLowerCase();
            return eligibles.where(
              (t) =>
                  t.raisonSociale.toLowerCase().contains(recherche) ||
                  t.code.toLowerCase().contains(recherche),
            );
          },
          onSelected: onSelectionnee,
          fieldViewBuilder: (context, controleur, noeudFocus, onSubmit) {
            return TextField(
              controller: controleur,
              focusNode: noeudFocus,
              decoration: InputDecoration(labelText: label),
            );
          },
        );
      },
    );
  }
}
