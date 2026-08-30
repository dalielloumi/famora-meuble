import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/article.dart';
import '../../../models/depot.dart';
import '../../../providers/depot_providers.dart';
import '../../../providers/stock_providers.dart';
import '../../../widgets/article_select.dart';

Future<void> ouvrirFormulaireTransfert(BuildContext context, WidgetRef ref) {
  return showDialog<void>(
    context: context,
    builder: (context) => const Dialog(
      child: SizedBox(width: 420, child: _TransfertFormulaire()),
    ),
  );
}

class _TransfertFormulaire extends ConsumerStatefulWidget {
  const _TransfertFormulaire();

  @override
  ConsumerState<_TransfertFormulaire> createState() => _TransfertFormulaireState();
}

class _TransfertFormulaireState extends ConsumerState<_TransfertFormulaire> {
  final _cleFormulaire = GlobalKey<FormBuilderState>();
  Article? _article;
  Depot? _source;
  Depot? _destination;
  bool _enCours = false;
  String? _erreur;

  Future<void> _transferer() async {
    final etat = _cleFormulaire.currentState;
    if (etat == null || !etat.saveAndValidate()) return;
    if (_article == null) {
      setState(() => _erreur = 'Sélectionnez un article.');
      return;
    }
    if (_source == null || _destination == null) {
      setState(() => _erreur = 'Sélectionnez les deux dépôts.');
      return;
    }
    if (_source!.id == _destination!.id) {
      setState(() => _erreur = 'Les dépôts source et destination doivent être différents.');
      return;
    }

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    try {
      final quantite = Decimal.parse((etat.value['quantite'] as String).replaceAll(',', '.'));
      await ref
          .read(stockRepositoryProvider)
          .transferer(
            articleId: _article!.id!,
            depotSourceId: _source!.id!,
            depotDestinationId: _destination!.id!,
            quantite: quantite.toString(),
            prixUnitaire: _article!.prixAchatStandard.toString(),
          );
      ref.read(stockListeProvider.notifier).rafraichir();
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() => _erreur = 'Transfert impossible : $e');
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
            Text('Transfert entre dépôts', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            ArticleSelect(onSelectionne: (a) => setState(() => _article = a)),
            const SizedBox(height: 12),
            depotsAsync.when(
              data: (liste) => Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<Depot>(
                      initialValue: _source,
                      decoration: const InputDecoration(labelText: 'Dépôt source'),
                      items: [for (final d in liste) DropdownMenuItem(value: d, child: Text(d.libelle))],
                      onChanged: (d) => setState(() => _source = d),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<Depot>(
                      initialValue: _destination,
                      decoration: const InputDecoration(labelText: 'Dépôt destination'),
                      items: [for (final d in liste) DropdownMenuItem(value: d, child: Text(d.libelle))],
                      onChanged: (d) => setState(() => _destination = d),
                    ),
                  ),
                ],
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Erreur dépôts : $e', style: const TextStyle(color: AppColors.alerte)),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'quantite',
              decoration: const InputDecoration(labelText: 'Quantité'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'Champ requis'),
                FormBuilderValidators.numeric(errorText: 'Nombre invalide'),
              ]),
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
                  onPressed: _enCours ? null : _transferer,
                  child: _enCours
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Transférer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
