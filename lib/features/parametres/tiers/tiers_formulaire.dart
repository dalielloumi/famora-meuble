import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/tiers.dart';
import '../../../providers/tiers_providers.dart';

Future<void> ouvrirFormulaireTiers(BuildContext context, {Tiers? tiers}) {
  return showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: _TiersFormulaire(tiers: tiers),
      ),
    ),
  );
}

class _TiersFormulaire extends ConsumerStatefulWidget {
  const _TiersFormulaire({this.tiers});

  final Tiers? tiers;

  @override
  ConsumerState<_TiersFormulaire> createState() => _TiersFormulaireState();
}

class _TiersFormulaireState extends ConsumerState<_TiersFormulaire> {
  final _cleFormulaire = GlobalKey<FormBuilderState>();
  bool _enCours = false;
  String? _erreur;

  bool get _modification => widget.tiers != null;

  Future<void> _enregistrer() async {
    final etat = _cleFormulaire.currentState;
    if (etat == null || !etat.saveAndValidate()) return;

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    final v = etat.value;
    final tiers = Tiers(
      id: widget.tiers?.id,
      type: v['type'] as TypeTiers,
      code: v['code'] as String,
      raisonSociale: v['raison_sociale'] as String,
      matriculeFiscal: v['matricule_fiscal'] as String?,
      adresse: v['adresse'] as String?,
      ville: v['ville'] as String?,
      telephone: v['telephone'] as String?,
      email: v['email'] as String?,
      tauxRetenueSource: Decimal.parse(((v['taux_retenue_source'] as String?) ?? '0').replaceAll(',', '.')),
      plafondCredit: Decimal.parse(((v['plafond_credit'] as String?) ?? '0').replaceAll(',', '.')),
      solde: widget.tiers?.solde ?? Decimal.zero,
      actif: v['actif'] as bool? ?? true,
    );

    try {
      if (_modification) {
        await ref.read(tiersListProvider.notifier).modifier(tiers);
      } else {
        await ref.read(tiersListProvider.notifier).creer(tiers);
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
    final t = widget.tiers;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: FormBuilder(
          key: _cleFormulaire,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _modification ? 'Modifier le tiers' : 'Nouveau tiers',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'code',
                      initialValue: t?.code,
                      decoration: const InputDecoration(labelText: 'Code'),
                      validator: FormBuilderValidators.required(errorText: 'Champ requis'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FormBuilderDropdown<TypeTiers>(
                      name: 'type',
                      initialValue: t?.type ?? TypeTiers.client,
                      decoration: const InputDecoration(labelText: 'Type'),
                      items: [
                        for (final v in TypeTiers.values) DropdownMenuItem(value: v, child: Text(v.libelle)),
                      ],
                      validator: FormBuilderValidators.required(errorText: 'Champ requis'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              FormBuilderTextField(
                name: 'raison_sociale',
                initialValue: t?.raisonSociale,
                decoration: const InputDecoration(labelText: 'Nom / raison sociale'),
                validator: FormBuilderValidators.required(errorText: 'Champ requis'),
              ),
              const SizedBox(height: 12),
              FormBuilderTextField(
                name: 'matricule_fiscal',
                initialValue: t?.matriculeFiscal,
                decoration: const InputDecoration(labelText: 'Matricule fiscal (optionnel)'),
              ),
              const SizedBox(height: 12),
              FormBuilderTextField(
                name: 'adresse',
                initialValue: t?.adresse,
                decoration: const InputDecoration(labelText: 'Adresse'),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'ville',
                      initialValue: t?.ville,
                      decoration: const InputDecoration(labelText: 'Ville'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'telephone',
                      initialValue: t?.telephone,
                      decoration: const InputDecoration(labelText: 'Téléphone'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              FormBuilderTextField(
                name: 'email',
                initialValue: t?.email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (valeur) {
                  if (valeur == null || valeur.isEmpty) return null;
                  return FormBuilderValidators.email(errorText: 'Email invalide')(valeur);
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'taux_retenue_source',
                      initialValue: t?.tauxRetenueSource.toString() ?? '0',
                      decoration: const InputDecoration(labelText: 'Retenue source (%)'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      validator: FormBuilderValidators.numeric(errorText: 'Nombre invalide'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FormBuilderTextField(
                      name: 'plafond_credit',
                      initialValue: t?.plafondCredit.toString() ?? '0',
                      decoration: const InputDecoration(labelText: 'Plafond crédit (TND)'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      validator: FormBuilderValidators.numeric(errorText: 'Nombre invalide'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              FormBuilderSwitch(name: 'actif', initialValue: t?.actif ?? true, title: const Text('Actif')),
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
      ),
    );
  }
}
