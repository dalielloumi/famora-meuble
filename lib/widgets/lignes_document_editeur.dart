import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text.dart';
import '../core/utils/formatters.dart';
import '../models/ligne_saisie.dart';
import '../providers/reference_providers.dart';
import '../providers/societe_providers.dart';
import 'article_select.dart';

/// Éditeur de lignes de document (devis, commande, facture, avoir…).
/// Saisie clavier : Tab passe au champ suivant, Entrée valide la ligne
/// (comportement natif de Flutter pour les TextField successifs).
class LignesDocumentEditeur extends ConsumerStatefulWidget {
  const LignesDocumentEditeur({
    super.key,
    required this.lignes,
    required this.onChanged,
    this.avecRemise = true,
    this.avecFodec = false,
  });

  final List<LigneSaisie> lignes;
  final ValueChanged<List<LigneSaisie>> onChanged;
  final bool avecRemise;

  /// FODEC (migration 017) : uniquement le cycle vente (devis, commande
  /// client, facture, avoir). Jamais pour le BL (pas de montants) ni les
  /// achats (le fournisseur facture déjà son propre FODEC inclus).
  final bool avecFodec;

  @override
  ConsumerState<LignesDocumentEditeur> createState() => _LignesDocumentEditeurState();
}

class _LignesDocumentEditeurState extends ConsumerState<LignesDocumentEditeur> {
  late List<LigneSaisie> _lignes;

  @override
  void initState() {
    super.initState();
    _lignes = List.of(widget.lignes);
  }

  @override
  void didUpdateWidget(covariant LignesDocumentEditeur oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.lignes, widget.lignes)) {
      _lignes = List.of(widget.lignes);
    }
  }

  void _notifier() => widget.onChanged(List.of(_lignes));

  void _ajouterArticle(dynamic article, String tauxTvaId, Decimal tauxTvaPct, Decimal tauxFodecPct) {
    setState(() {
      _lignes.add(
        LigneSaisie(
          articleId: article.id as String,
          designation: article.designation as String,
          quantite: Decimal.one,
          prixUnitaire: article.prixVenteHt as Decimal,
          tauxTvaId: tauxTvaId,
          tauxTvaPct: tauxTvaPct,
          tauxFodecPct: tauxFodecPct,
        ),
      );
    });
    _notifier();
  }

  void _supprimer(int index) {
    setState(() => _lignes.removeAt(index));
    _notifier();
  }

  Decimal get _totalHt => _lignes.fold(Decimal.zero, (s, l) => s + l.montantHt);
  Decimal get _totalFodec => _lignes.fold(Decimal.zero, (s, l) => s + l.montantFodec);
  Decimal get _totalTva => _lignes.fold(Decimal.zero, (s, l) => s + l.montantTva);
  Decimal get _totalTtc => _totalHt + _totalFodec + _totalTva;

  @override
  Widget build(BuildContext context) {
    final tauxTvaAsync = ref.watch(tauxTvaListProvider);
    final societeAsync = widget.avecFodec ? ref.watch(societeProvider) : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_lignes.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text('Aucune ligne. Ajoutez un article ci-dessous.', style: AppText.corps),
          )
        else
          Table(
            columnWidths: const {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1.2),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(1.3),
              5: FixedColumnWidth(40),
            },
            children: [
              TableRow(
                children: [
                  Padding(padding: const EdgeInsets.all(6), child: Text('Article', style: AppText.libelleChamp)),
                  Padding(padding: const EdgeInsets.all(6), child: Text('Qté', style: AppText.libelleChamp)),
                  Padding(padding: const EdgeInsets.all(6), child: Text('Prix U.', style: AppText.libelleChamp)),
                  Padding(padding: const EdgeInsets.all(6), child: Text('Remise %', style: AppText.libelleChamp)),
                  Padding(padding: const EdgeInsets.all(6), child: Text('Montant HT', style: AppText.libelleChamp)),
                  const SizedBox(),
                ],
              ),
              for (var i = 0; i < _lignes.length; i++) _ligneRow(i),
            ],
          ),
        const Divider(color: AppColors.bordure),
        tauxTvaAsync.when(
          data: (liste) {
            if (liste.isEmpty) return Text('Aucun taux de TVA configuré.', style: AppText.corps);
            return Row(
              children: [
                Expanded(
                  child: ArticleSelect(
                    label: 'Ajouter un article',
                    onSelectionne: (article) => _ajouterArticle(
                      article,
                      liste.first.id,
                      Decimal.parse('${liste.first.taux}'),
                      widget.avecFodec ? (societeAsync?.value?.tauxFodec ?? Decimal.zero) : Decimal.zero,
                    ),
                  ),
                ),
              ],
            );
          },
          loading: () => const LinearProgressIndicator(),
          error: (e, _) => Text('Erreur TVA : $e', style: const TextStyle(color: AppColors.alerte)),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Total HT : ${Formatters.montant(_totalHt)}', style: AppText.montant),
              if (widget.avecFodec) Text('FODEC : ${Formatters.montant(_totalFodec)}', style: AppText.montant),
              Text('Total TVA : ${Formatters.montant(_totalTva)}', style: AppText.montant),
              Text('Total TTC : ${Formatters.montant(_totalTtc)}', style: AppText.montantAccent),
            ],
          ),
        ),
      ],
    );
  }

  TableRow _ligneRow(int index) {
    final ligne = _lignes[index];

    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(6), child: Text(ligne.designation, style: AppText.corps)),
        Padding(
          padding: const EdgeInsets.all(4),
          child: _champNumerique(
            valeur: ligne.quantite,
            onChange: (v) {
              setState(() => ligne.quantite = v);
              _notifier();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: _champNumerique(
            valeur: ligne.prixUnitaire,
            onChange: (v) {
              setState(() => ligne.prixUnitaire = v);
              _notifier();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: widget.avecRemise
              ? _champNumerique(
                  valeur: ligne.remisePct,
                  onChange: (v) {
                    setState(() => ligne.remisePct = v);
                    _notifier();
                  },
                )
              : const SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.all(6),
          child: Text(Formatters.montant(ligne.montantHt), style: AppText.montant, textAlign: TextAlign.right),
        ),
        IconButton(
          icon: const Icon(Icons.close, size: 16, color: AppColors.alerte),
          onPressed: () => _supprimer(index),
        ),
      ],
    );
  }

  Widget _champNumerique({required Decimal valeur, required ValueChanged<Decimal> onChange}) {
    return TextFormField(
      initialValue: valeur.toString(),
      style: AppText.montant,
      textAlign: TextAlign.right,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: const InputDecoration(isDense: true, contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 6)),
      onFieldSubmitted: (texte) {
        final v = Decimal.tryParse(texte.replaceAll(',', '.'));
        if (v != null) onChange(v);
      },
      onEditingComplete: () {},
      onChanged: (texte) {
        final v = Decimal.tryParse(texte.replaceAll(',', '.'));
        if (v != null) onChange(v);
      },
    );
  }
}
