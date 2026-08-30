import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/depot.dart';
import '../../../providers/depot_providers.dart';

Future<void> ouvrirFormulaireDepot(BuildContext context, {Depot? depot}) {
  return showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: _DepotFormulaire(depot: depot),
      ),
    ),
  );
}

class _DepotFormulaire extends ConsumerStatefulWidget {
  const _DepotFormulaire({this.depot});

  final Depot? depot;

  @override
  ConsumerState<_DepotFormulaire> createState() => _DepotFormulaireState();
}

class _DepotFormulaireState extends ConsumerState<_DepotFormulaire> {
  final _cleFormulaire = GlobalKey<FormBuilderState>();
  bool _enCours = false;
  String? _erreur;

  bool get _modification => widget.depot != null;

  Future<void> _enregistrer() async {
    final etat = _cleFormulaire.currentState;
    if (etat == null || !etat.saveAndValidate()) return;

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    final v = etat.value;
    final depot = Depot(
      id: widget.depot?.id,
      code: v['code'] as String,
      libelle: v['libelle'] as String,
      type: v['type'] as TypeDepot,
      adresse: v['adresse'] as String?,
      actif: v['actif'] as bool? ?? true,
    );

    try {
      if (_modification) {
        await ref.read(depotsProvider.notifier).modifier(depot);
      } else {
        await ref.read(depotsProvider.notifier).creer(depot);
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
    final d = widget.depot;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: FormBuilder(
        key: _cleFormulaire,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _modification ? 'Modifier le dépôt' : 'Nouveau dépôt',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            FormBuilderTextField(
              name: 'code',
              initialValue: d?.code,
              decoration: const InputDecoration(labelText: 'Code'),
              validator: FormBuilderValidators.required(errorText: 'Champ requis'),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'libelle',
              initialValue: d?.libelle,
              decoration: const InputDecoration(labelText: 'Libellé'),
              validator: FormBuilderValidators.required(errorText: 'Champ requis'),
            ),
            const SizedBox(height: 12),
            FormBuilderDropdown<TypeDepot>(
              name: 'type',
              initialValue: d?.type ?? TypeDepot.magasin,
              decoration: const InputDecoration(labelText: 'Type'),
              items: [
                for (final t in TypeDepot.values) DropdownMenuItem(value: t, child: Text(t.libelle)),
              ],
              validator: FormBuilderValidators.required(errorText: 'Champ requis'),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'adresse',
              initialValue: d?.adresse,
              decoration: const InputDecoration(labelText: 'Adresse (optionnel)'),
            ),
            const SizedBox(height: 8),
            FormBuilderSwitch(name: 'actif', initialValue: d?.actif ?? true, title: const Text('Actif')),
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
                  onPressed: _enCours ? null : _enregistrer,
                  child: _enCours
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Enregistrer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
