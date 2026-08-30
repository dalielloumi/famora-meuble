import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/article.dart';
import '../providers/article_providers.dart';

/// Sélecteur d'article avec recherche, utilisé à l'ajout d'une ligne de
/// document (PROJET.md section 6).
class ArticleSelect extends ConsumerWidget {
  const ArticleSelect({super.key, required this.onSelectionne, this.label = 'Article'});

  final ValueChanged<Article> onSelectionne;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesAsync = ref.watch(articlesProvider);

    return articlesAsync.when(
      loading: () => const LinearProgressIndicator(),
      error: (e, _) => Text('Erreur chargement articles : $e'),
      data: (liste) {
        final actifs = liste.where((a) => a.actif).toList();

        return Autocomplete<Article>(
          displayStringForOption: (a) => '${a.reference} — ${a.designation}',
          optionsBuilder: (texte) {
            if (texte.text.isEmpty) return actifs;
            final recherche = texte.text.toLowerCase();
            return actifs.where(
              (a) =>
                  a.reference.toLowerCase().contains(recherche) ||
                  a.designation.toLowerCase().contains(recherche),
            );
          },
          onSelected: onSelectionne,
          fieldViewBuilder: (context, controleur, noeudFocus, onSubmit) {
            return TextField(
              controller: controleur,
              focusNode: noeudFocus,
              decoration: InputDecoration(labelText: label, prefixIcon: const Icon(Icons.search, size: 18)),
            );
          },
        );
      },
    );
  }
}
