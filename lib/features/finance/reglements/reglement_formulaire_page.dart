import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/reglement.dart';
import '../../../models/tiers.dart';
import '../../../providers/exercice_providers.dart';
import '../../../providers/finance_providers.dart';
import '../../../widgets/tiers_select.dart';

/// Création d'un règlement (encaissement client ou décaissement fournisseur),
/// puis lettrage : affectation du montant aux factures dues du tiers
/// (PROJET.md section 4, « un règlement peut solder plusieurs factures »).
class ReglementFormulairePage extends ConsumerStatefulWidget {
  const ReglementFormulairePage({super.key});

  @override
  ConsumerState<ReglementFormulairePage> createState() => _ReglementFormulairePageState();
}

class _ReglementFormulairePageState extends ConsumerState<ReglementFormulairePage> {
  final _cleFormulaire = GlobalKey<FormBuilderState>();
  SensReglement _sens = SensReglement.encaissement;
  ModeReglement _mode = ModeReglement.especes;
  Tiers? _tiers;
  bool _enCours = false;
  String? _erreur;

  Reglement? _reglementCree;
  List<Map<String, dynamic>> _facturesDues = [];
  final Map<String, TextEditingController> _controleursAffectation = {};

  @override
  void dispose() {
    for (final c in _controleursAffectation.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _creerReglement() async {
    final etat = _cleFormulaire.currentState;
    if (etat == null || !etat.saveAndValidate()) return;
    if (_tiers?.id == null) {
      setState(() => _erreur = 'Sélectionnez un tiers.');
      return;
    }

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    try {
      final exerciceId = await ref.read(exerciceOuvertProvider.future);
      final montant = Decimal.parse((etat.value['montant'] as String).replaceAll(',', '.'));
      final repo = ref.read(reglementRepositoryProvider);

      final reglement = await repo.creer(
        exerciceId: exerciceId,
        tiersId: _tiers!.id!,
        sens: _sens,
        mode: _mode,
        montant: montant.toString(),
        dateReglement: DateTime.now(),
        reference: (etat.value['reference'] as String?)?.trim().isEmpty ?? true
            ? null
            : etat.value['reference'] as String,
        banque: (etat.value['banque'] as String?)?.trim().isEmpty ?? true ? null : etat.value['banque'] as String,
      );

      if (_mode.estUnEffet) {
        final dateEcheance = etat.value['date_echeance'] as DateTime?;
        final numeroEffet = etat.value['numero_effet'] as String?;
        if (dateEcheance != null && numeroEffet != null && numeroEffet.trim().isNotEmpty) {
          await repo.creerEffet(
            reglementId: reglement.id!,
            numeroEffet: numeroEffet.trim(),
            dateEcheance: dateEcheance,
            montant: montant.toString(),
            banque: etat.value['banque'] as String?,
          );
        }
      }

      final dues = _sens == SensReglement.encaissement
          ? await repo.facturesVenteDues(_tiers!.id!)
          : await repo.facturesAchatDues(_tiers!.id!);

      ref.read(reglementsProvider.notifier).rafraichir();

      setState(() {
        _reglementCree = reglement;
        _facturesDues = dues;
        for (final f in dues) {
          _controleursAffectation[f['id'] as String] = TextEditingController();
        }
      });
    } catch (e) {
      setState(() => _erreur = 'Création impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Decimal get _totalAffecte => _controleursAffectation.values.fold(
    Decimal.zero,
    (s, c) => s + (Decimal.tryParse(c.text.replaceAll(',', '.')) ?? Decimal.zero),
  );

  Future<void> _enregistrerAffectations() async {
    final reglement = _reglementCree;
    if (reglement == null) return;

    setState(() => _enCours = true);
    try {
      final repo = ref.read(reglementRepositoryProvider);
      for (final entry in _controleursAffectation.entries) {
        final montant = Decimal.tryParse(entry.value.text.replaceAll(',', '.'));
        if (montant == null || montant <= Decimal.zero) continue;
        await repo.affecter(
          reglementId: reglement.id!,
          factureVenteId: _sens == SensReglement.encaissement ? entry.key : null,
          factureAchatId: _sens == SensReglement.decaissement ? entry.key : null,
          montant: montant.toString(),
        );
      }
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() => _erreur = 'Affectation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_reglementCree != null) return _panneauAffectation();

    return Scaffold(
      appBar: AppBar(title: const Text('Nouveau règlement')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: FormBuilder(
            key: _cleFormulaire,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SegmentedButton<SensReglement>(
                  segments: const [
                    ButtonSegment(value: SensReglement.encaissement, label: Text('Encaissement')),
                    ButtonSegment(value: SensReglement.decaissement, label: Text('Décaissement')),
                  ],
                  selected: {_sens},
                  onSelectionChanged: (s) => setState(() => _sens = s.first),
                ),
                const SizedBox(height: 12),
                TiersSelect(
                  pourClient: _sens == SensReglement.encaissement,
                  label: _sens == SensReglement.encaissement ? 'Client' : 'Fournisseur',
                  onSelectionnee: (t) => setState(() => _tiers = t),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<ModeReglement>(
                  initialValue: _mode,
                  decoration: const InputDecoration(labelText: 'Mode de règlement'),
                  items: [
                    for (final m in ModeReglement.values) DropdownMenuItem(value: m, child: Text(m.libelle)),
                  ],
                  onChanged: (m) => setState(() => _mode = m ?? ModeReglement.especes),
                ),
                const SizedBox(height: 12),
                FormBuilderTextField(
                  name: 'montant',
                  decoration: const InputDecoration(labelText: 'Montant (TND)'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(errorText: 'Champ requis'),
                    FormBuilderValidators.numeric(errorText: 'Nombre invalide'),
                  ]),
                ),
                const SizedBox(height: 12),
                FormBuilderTextField(name: 'reference', decoration: const InputDecoration(labelText: 'Référence')),
                if (_mode.estUnEffet) ...[
                  const SizedBox(height: 12),
                  FormBuilderTextField(
                    name: 'numero_effet',
                    decoration: InputDecoration(labelText: _mode == ModeReglement.cheque ? 'N° chèque' : 'N° traite'),
                  ),
                  const SizedBox(height: 12),
                  FormBuilderTextField(name: 'banque', decoration: const InputDecoration(labelText: 'Banque')),
                  const SizedBox(height: 12),
                  FormBuilderDateTimePicker(
                    name: 'date_echeance',
                    inputType: InputType.date,
                    decoration: const InputDecoration(labelText: 'Date d\'échéance'),
                  ),
                ],
                if (_erreur != null) ...[
                  const SizedBox(height: 12),
                  Text(_erreur!, style: const TextStyle(color: AppColors.alerte)),
                ],
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: _enCours ? null : _creerReglement,
                  child: _enCours
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Enregistrer le règlement'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _panneauAffectation() {
    final reglement = _reglementCree!;
    return Scaffold(
      appBar: AppBar(title: const Text('Affectation aux factures')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Règlement de ${Formatters.montant(reglement.montant)}', style: AppText.sousTitre),
              const SizedBox(height: 4),
              Text('Reste à affecter : ${Formatters.montant(reglement.montant - _totalAffecte)}', style: AppText.corps),
              const SizedBox(height: 16),
              if (_facturesDues.isEmpty)
                Text('Aucune facture due pour ce tiers. Le règlement reste en acompte.', style: AppText.corps)
              else
                for (final f in _facturesDues)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text('${f['numero'] ?? 'Brouillon'} — reste dû : '
                              '${Formatters.montant(Decimal.parse('${f['total_ttc']}') - Decimal.parse('${f['montant_regle']}'))}'),
                        ),
                        SizedBox(
                          width: 140,
                          child: TextField(
                            controller: _controleursAffectation[f['id']],
                            decoration: const InputDecoration(labelText: 'Montant affecté', isDense: true),
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                      ],
                    ),
                  ),
              if (_erreur != null) ...[
                const SizedBox(height: 12),
                Text(_erreur!, style: const TextStyle(color: AppColors.alerte)),
              ],
              const SizedBox(height: 20),
              Row(
                children: [
                  TextButton(
                    onPressed: _enCours ? null : () => Navigator.of(context).pop(),
                    child: const Text('Terminer sans affecter'),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: _enCours ? null : _enregistrerAffectations,
                    child: const Text('Enregistrer les affectations'),
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
