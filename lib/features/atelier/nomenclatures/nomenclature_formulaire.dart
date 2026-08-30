import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../models/article.dart';
import '../../../models/reference.dart';
import '../../../providers/atelier_providers.dart';
import '../../../providers/reference_providers.dart';
import '../../../widgets/article_select.dart';

class _LigneComposant {
  _LigneComposant({required this.composant, required this.unite, this.quantite = '1'});

  final Article composant;
  UniteMesure unite;
  String quantite;
}

/// Création d'une nomenclature (produit fini + version + composants).
/// Page complète plutôt qu'une boîte de dialogue : la saisie des composants
/// demande de la place.
class NomenclatureFormulairePage extends ConsumerStatefulWidget {
  const NomenclatureFormulairePage({super.key});

  @override
  ConsumerState<NomenclatureFormulairePage> createState() => _NomenclatureFormulairePageState();
}

class _NomenclatureFormulairePageState extends ConsumerState<NomenclatureFormulairePage> {
  Article? _produitFini;
  final _versionControleur = TextEditingController(text: '1');
  final _notesControleur = TextEditingController();
  final List<_LigneComposant> _lignes = [];
  bool _enCours = false;
  String? _erreur;

  @override
  void dispose() {
    _versionControleur.dispose();
    _notesControleur.dispose();
    super.dispose();
  }

  Future<void> _enregistrer() async {
    if (_produitFini == null) {
      setState(() => _erreur = 'Sélectionnez le produit fini.');
      return;
    }
    if (_lignes.isEmpty) {
      setState(() => _erreur = 'Ajoutez au moins un composant.');
      return;
    }

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    try {
      final repo = ref.read(nomenclatureRepositoryProvider);
      final nomenclature = await repo.creer(
        articleId: _produitFini!.id!,
        version: int.tryParse(_versionControleur.text) ?? 1,
        notes: _notesControleur.text.trim().isEmpty ? null : _notesControleur.text.trim(),
      );
      await repo.remplacerLignes(nomenclature.id!, [
        for (final l in _lignes) (composantId: l.composant.id!, quantite: l.quantite, uniteId: l.unite.id),
      ]);
      ref.read(nomenclaturesProvider.notifier).rafraichir();
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() => _erreur = 'Enregistrement impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final unitesAsync = ref.watch(unitesMesureProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle nomenclature')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArticleSelect(label: 'Produit fini', onSelectionne: (a) => setState(() => _produitFini = a)),
              const SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: _versionControleur,
                      decoration: const InputDecoration(labelText: 'Version'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _notesControleur,
                      decoration: const InputDecoration(labelText: 'Notes (optionnel)'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Composants', style: AppText.sousTitre),
              const SizedBox(height: 8),
              unitesAsync.when(
                data: (unites) => Column(
                  children: [
                    for (var i = 0; i < _lignes.length; i++) _ligneWidget(i, unites),
                    Row(
                      children: [
                        Expanded(
                          child: ArticleSelect(
                            label: 'Ajouter un composant',
                            onSelectionne: (a) {
                              if (unites.isEmpty) return;
                              setState(
                                () => _lignes.add(_LigneComposant(composant: a, unite: unites.first, quantite: '1')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text('Erreur unités : $e', style: const TextStyle(color: AppColors.alerte)),
              ),
              if (_erreur != null) ...[
                const SizedBox(height: 12),
                Text(_erreur!, style: const TextStyle(color: AppColors.alerte)),
              ],
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _enCours ? null : _enregistrer,
                child: _enCours
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text('Enregistrer la nomenclature'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ligneWidget(int index, List<UniteMesure> unites) {
    final ligne = _lignes[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(ligne.composant.designation, style: AppText.corps)),
          SizedBox(
            width: 100,
            child: TextFormField(
              initialValue: ligne.quantite,
              decoration: const InputDecoration(labelText: 'Quantité', isDense: true),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (v) => ligne.quantite = v,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 120,
            child: DropdownButtonFormField<UniteMesure>(
              initialValue: ligne.unite,
              decoration: const InputDecoration(labelText: 'Unité', isDense: true),
              items: [for (final u in unites) DropdownMenuItem(value: u, child: Text(u.code))],
              onChanged: (u) => setState(() {
                if (u != null) ligne.unite = u;
              }),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 16, color: AppColors.alerte),
            onPressed: () => setState(() => _lignes.removeAt(index)),
          ),
        ],
      ),
    );
  }
}
