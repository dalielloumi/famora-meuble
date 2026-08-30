import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/article.dart';
import '../../../models/depot.dart';
import '../../../models/nomenclature.dart';
import '../../../models/ordre_fabrication.dart';
import '../../../providers/atelier_providers.dart';
import '../../../providers/depot_providers.dart';
import '../../../providers/exercice_providers.dart';
import '../../../widgets/article_select.dart';

Future<OrdreFabrication?> ouvrirCreationOf(BuildContext context, WidgetRef ref) {
  return showDialog<OrdreFabrication>(
    context: context,
    builder: (context) => const Dialog(
      child: SizedBox(width: 460, child: _OfEnteteFormulaire()),
    ),
  );
}

class _OfEnteteFormulaire extends ConsumerStatefulWidget {
  const _OfEnteteFormulaire();

  @override
  ConsumerState<_OfEnteteFormulaire> createState() => _OfEnteteFormulaireState();
}

class _OfEnteteFormulaireState extends ConsumerState<_OfEnteteFormulaire> {
  final _cleFormulaire = GlobalKey<FormBuilderState>();
  Article? _produitFini;
  Nomenclature? _nomenclature;
  List<Nomenclature> _nomenclaturesDisponibles = [];
  Depot? _depotSource;
  Depot? _depotDestination;
  bool _enCours = false;
  String? _erreur;

  Future<void> _choisirArticle(Article article) async {
    setState(() {
      _produitFini = article;
      _nomenclature = null;
      _nomenclaturesDisponibles = [];
    });
    final toutes = await ref.read(nomenclatureRepositoryProvider).lister();
    final disponibles = toutes.where((n) => n.articleId == article.id && n.actif).toList();
    setState(() {
      _nomenclaturesDisponibles = disponibles;
      _nomenclature = disponibles.isNotEmpty ? disponibles.first : null;
    });
  }

  Future<void> _creer() async {
    final etat = _cleFormulaire.currentState;
    if (etat == null || !etat.saveAndValidate()) return;
    if (_produitFini == null) {
      setState(() => _erreur = 'Sélectionnez le produit à fabriquer.');
      return;
    }
    if (_nomenclature == null) {
      setState(() => _erreur = "Cet article n'a pas de nomenclature active.");
      return;
    }
    if (_depotSource == null || _depotDestination == null) {
      setState(() => _erreur = 'Sélectionnez les dépôts source et destination.');
      return;
    }

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    try {
      final exerciceId = await ref.read(exerciceOuvertProvider.future);
      final of = await ref
          .read(ordreFabricationRepositoryProvider)
          .creerBrouillon(
            exerciceId: exerciceId,
            articleId: _produitFini!.id!,
            nomenclatureId: _nomenclature!.id!,
            quantitePrevue: (etat.value['quantite'] as String).replaceAll(',', '.'),
            depotSourceId: _depotSource!.id!,
            depotDestinationId: _depotDestination!.id!,
          );
      if (mounted) Navigator.of(context).pop(of);
    } catch (e) {
      setState(() => _erreur = 'Création impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final depotsAsync = ref.watch(depotsProvider);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: FormBuilder(
        key: _cleFormulaire,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Nouvel ordre de fabrication", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            ArticleSelect(label: 'Produit à fabriquer', onSelectionne: _choisirArticle),
            if (_produitFini != null && _nomenclaturesDisponibles.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text('Aucune nomenclature active pour cet article.', style: TextStyle(color: AppColors.alerte, fontSize: 12)),
              ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'quantite',
              decoration: const InputDecoration(labelText: 'Quantité à produire'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'Champ requis'),
                FormBuilderValidators.numeric(errorText: 'Nombre invalide'),
              ]),
            ),
            const SizedBox(height: 12),
            depotsAsync.when(
              data: (liste) => Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<Depot>(
                      initialValue: _depotSource,
                      decoration: const InputDecoration(labelText: 'Dépôt atelier (source)'),
                      items: [for (final d in liste) DropdownMenuItem(value: d, child: Text(d.libelle))],
                      onChanged: (d) => setState(() => _depotSource = d),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<Depot>(
                      initialValue: _depotDestination,
                      decoration: const InputDecoration(labelText: 'Dépôt magasin (destination)'),
                      items: [for (final d in liste) DropdownMenuItem(value: d, child: Text(d.libelle))],
                      onChanged: (d) => setState(() => _depotDestination = d),
                    ),
                  ),
                ],
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Erreur dépôts : $e', style: const TextStyle(color: AppColors.alerte)),
            ),
            if (_erreur != null) ...[
              const SizedBox(height: 8),
              Text(_erreur!, style: const TextStyle(color: AppColors.alerte)),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _enCours ? null : () => Navigator.of(context).pop(),
                  child: const Text('Annuler'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _enCours ? null : _creer,
                  child: _enCours
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Créer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
