import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/article.dart';
import '../../../models/famille_article.dart';
import '../../../providers/article_providers.dart';
import '../../../providers/famille_article_providers.dart';
import '../../../providers/reference_providers.dart';

const _nouvelleCategorieSentinel = '__nouvelle_categorie__';

/// Préfixe de référence par famille (SAL, BUR...) — si la famille ne
/// correspond à aucune entrée connue (nouvelle catégorie créée par
/// l'utilisateur), dérivé des 3 premières lettres de son libellé.
const _prefixesConnus = {
  'SALON': 'SAL',
  'CHAMBRE': 'CHA',
  'BUREAU': 'BUR',
  'CUISINE': 'CUI',
  'SALLE_A_MANGER': 'SAM',
  'RANGEMENT': 'RAN',
  'ACCESSOIRE': 'ACC',
  'AUTRE': 'AUT',
};

String _prefixePourFamille(FamilleArticle famille) {
  final connu = _prefixesConnus[famille.code];
  if (connu != null) return connu;
  final lettres = famille.libelle.toUpperCase().replaceAll(RegExp('[^A-Z]'), '');
  return lettres.length >= 3 ? lettres.substring(0, 3) : lettres.padRight(3, 'X');
}

/// Formulaire de création/édition d'un article, affiché en boîte de dialogue.
Future<void> ouvrirFormulaireArticle(BuildContext context, {Article? article}) {
  return showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: _ArticleFormulaire(article: article),
      ),
    ),
  );
}

class _ArticleFormulaire extends ConsumerStatefulWidget {
  const _ArticleFormulaire({this.article});

  final Article? article;

  @override
  ConsumerState<_ArticleFormulaire> createState() => _ArticleFormulaireState();
}

class _ArticleFormulaireState extends ConsumerState<_ArticleFormulaire> {
  final _cleFormulaire = GlobalKey<FormBuilderState>();
  bool _enCours = false;
  String? _erreur;
  FamilleArticle? _familleSelectionnee;
  String? _referenceApercu;

  bool get _modification => widget.article != null;

  @override
  void initState() {
    super.initState();
    if (_modification) _referenceApercu = widget.article!.reference;
  }

  Future<void> _actualiserApercuReference(FamilleArticle famille) async {
    if (_modification) return; // La référence d'un article existant ne change pas.
    try {
      final compte = await ref.read(articleRepositoryProvider).compterParFamille(famille.id!);
      if (!mounted) return;
      setState(() => _referenceApercu = '${_prefixePourFamille(famille)}${(compte + 1).toString().padLeft(3, '0')}');
    } catch (_) {
      // Aperçu best-effort : une erreur ici n'empêche pas la saisie, la
      // référence définitive est de toute façon recalculée à l'enregistrement.
    }
  }

  Future<void> _creerNouvelleCategorie() async {
    final controleur = TextEditingController();
    final libelle = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nouvelle catégorie'),
        content: TextField(
          controller: controleur,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Nom de la catégorie'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Annuler')),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controleur.text.trim()),
            child: const Text('Créer'),
          ),
        ],
      ),
    );

    if (libelle == null || libelle.isEmpty) {
      // L'utilisateur a annulé : on revient à la sélection précédente.
      _cleFormulaire.currentState?.fields['famille_id']?.didChange(_familleSelectionnee?.id);
      return;
    }

    final code = libelle.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]+'), '_');
    try {
      final famille = await ref.read(familleArticleRepositoryProvider).creer(code: code, libelle: libelle);
      ref.read(famillesArticleProvider.notifier).rafraichir();
      _cleFormulaire.currentState?.fields['famille_id']?.didChange(famille.id);
      setState(() => _familleSelectionnee = famille);
      await _actualiserApercuReference(famille);
    } catch (e) {
      setState(() => _erreur = 'Création de la catégorie impossible : $e');
      _cleFormulaire.currentState?.fields['famille_id']?.didChange(_familleSelectionnee?.id);
    }
  }

  Future<void> _enregistrer() async {
    final etat = _cleFormulaire.currentState;
    if (etat == null || !etat.saveAndValidate()) return;

    final familleId = etat.value['famille_id'] as String?;
    if (familleId == null) {
      setState(() => _erreur = 'Sélectionnez une catégorie.');
      return;
    }

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    try {
      final unites = await ref.read(unitesMesureProvider.future);
      final tauxTva = await ref.read(tauxTvaListProvider.future);
      final uniteParDefautId = unites.firstWhere((u) => u.code == 'PCE', orElse: () => unites.first).id;

      final v = etat.value;
      var reference = widget.article?.reference;
      final famille = _familleSelectionnee;
      if (!_modification && famille != null) {
        final compte = await ref.read(articleRepositoryProvider).compterParFamille(famille.id!);
        reference = '${_prefixePourFamille(famille)}${(compte + 1).toString().padLeft(3, '0')}';
      }

      final article = Article(
        id: widget.article?.id,
        reference: reference!,
        designation: v['designation'] as String,
        familleId: familleId,
        typeArticle: v['type_article'] as TypeArticle,
        uniteId: widget.article?.uniteId ?? uniteParDefautId,
        tauxTvaId: v['taux_tva_id'] as String? ?? (tauxTva.isNotEmpty ? tauxTva.first.id : ''),
        prixAchatStandard: widget.article?.prixAchatStandard ?? Decimal.zero,
        prixVenteHt: Decimal.parse((v['prix_vente_ht'] as String).replaceAll(',', '.')),
        seuilAlerte: Decimal.parse(((v['seuil_alerte'] as String?) ?? '0').replaceAll(',', '.')),
        gereStock: v['gere_stock'] as bool? ?? true,
        actif: v['actif'] as bool? ?? true,
      );

      if (_modification) {
        await ref.read(articlesProvider.notifier).modifier(article);
      } else {
        await ref.read(articlesProvider.notifier).creer(article);
      }
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() => _erreur = 'Enregistrement impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tauxTva = ref.watch(tauxTvaListProvider);
    final familles = ref.watch(famillesArticleProvider);
    final a = widget.article;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: FormBuilder(
        key: _cleFormulaire,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _modification ? 'Modifier le produit' : 'Nouveau produit',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  onPressed: _enCours ? null : () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, size: 18),
                  style: IconButton.styleFrom(
                    side: const BorderSide(color: AppColors.bordure, width: 1.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            FormBuilderTextField(
              name: 'designation',
              initialValue: a?.designation,
              decoration: const InputDecoration(labelText: 'Nom du produit'),
              validator: FormBuilderValidators.required(errorText: 'Champ requis'),
            ),
            const SizedBox(height: 12),
            familles.when(
              data: (liste) {
                if (_familleSelectionnee == null && a?.familleId != null) {
                  _familleSelectionnee = liste.where((f) => f.id == a!.familleId).firstOrNull;
                }
                return FormBuilderDropdown<String>(
                  name: 'famille_id',
                  initialValue: a?.familleId,
                  decoration: const InputDecoration(labelText: 'Catégorie'),
                  validator: FormBuilderValidators.required(errorText: 'Sélectionnez une catégorie'),
                  items: [
                    for (final f in liste) DropdownMenuItem(value: f.id, child: Text(f.libelle)),
                    const DropdownMenuItem(
                      value: _nouvelleCategorieSentinel,
                      child: Text('+ Nouvelle catégorie', style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ],
                  onChanged: (id) {
                    if (id == _nouvelleCategorieSentinel) {
                      _creerNouvelleCategorie();
                      return;
                    }
                    final famille = liste.where((f) => f.id == id).firstOrNull;
                    setState(() => _familleSelectionnee = famille);
                    if (famille != null) _actualiserApercuReference(famille);
                  },
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Erreur catégories : $e', style: const TextStyle(color: AppColors.alerte)),
            ),
            if (_referenceApercu != null) ...[
              const SizedBox(height: 6),
              Text(
                'Référence : $_referenceApercu',
                style: const TextStyle(fontSize: 12, color: AppColors.texteAttenue, fontWeight: FontWeight.w600),
              ),
            ],
            const SizedBox(height: 12),
            FormBuilderDropdown<TypeArticle>(
              name: 'type_article',
              initialValue: a?.typeArticle ?? TypeArticle.produitFini,
              decoration: const InputDecoration(labelText: 'Type'),
              items: [
                for (final t in TypeArticle.values) DropdownMenuItem(value: t, child: Text(t.libelle)),
              ],
              validator: FormBuilderValidators.required(errorText: 'Champ requis'),
            ),
            const SizedBox(height: 12),
            tauxTva.when(
              data: (liste) => FormBuilderDropdown<String>(
                name: 'taux_tva_id',
                initialValue: a?.tauxTvaId ?? (liste.isNotEmpty ? liste.first.id : null),
                decoration: const InputDecoration(labelText: 'Taux de TVA'),
                items: [
                  for (final t in liste) DropdownMenuItem(value: t.id, child: Text(t.libelle)),
                ],
                validator: FormBuilderValidators.required(errorText: 'Champ requis'),
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Erreur TVA : $e', style: const TextStyle(color: AppColors.alerte)),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'prix_vente_ht',
              initialValue: a?.prixVenteHt.toString() ?? '0',
              decoration: const InputDecoration(labelText: 'Prix de vente HT (TND)'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'Champ requis'),
                FormBuilderValidators.numeric(errorText: 'Nombre invalide'),
              ]),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'seuil_alerte',
              initialValue: a?.seuilAlerte.toString() ?? '0',
              decoration: const InputDecoration(labelText: 'Seuil d\'alerte stock'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: FormBuilderValidators.numeric(errorText: 'Nombre invalide'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: FormBuilderSwitch(
                    name: 'gere_stock',
                    initialValue: a?.gereStock ?? true,
                    title: const Text('Géré en stock'),
                  ),
                ),
                Expanded(
                  child: FormBuilderSwitch(
                    name: 'actif',
                    initialValue: a?.actif ?? true,
                    title: const Text('Actif'),
                  ),
                ),
              ],
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
                ElevatedButton.icon(
                  onPressed: _enCours ? null : _enregistrer,
                  icon: _enCours
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('💾'),
                  label: const Text('Enregistrer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
