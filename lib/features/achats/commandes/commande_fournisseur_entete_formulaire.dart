import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/commande_fournisseur.dart';
import '../../../models/depot.dart';
import '../../../models/tiers.dart';
import '../../../providers/achats_providers.dart';
import '../../../providers/depot_providers.dart';
import '../../../providers/exercice_providers.dart';
import '../../../widgets/tiers_select.dart';

Future<CommandeFournisseur?> ouvrirCreationCommandeFournisseur(BuildContext context, WidgetRef ref) {
  return showDialog<CommandeFournisseur>(
    context: context,
    builder: (context) => const Dialog(
      child: SizedBox(width: 420, child: _CommandeFournisseurEnteteFormulaire()),
    ),
  );
}

class _CommandeFournisseurEnteteFormulaire extends ConsumerStatefulWidget {
  const _CommandeFournisseurEnteteFormulaire();

  @override
  ConsumerState<_CommandeFournisseurEnteteFormulaire> createState() =>
      _CommandeFournisseurEnteteFormulaireState();
}

class _CommandeFournisseurEnteteFormulaireState extends ConsumerState<_CommandeFournisseurEnteteFormulaire> {
  Tiers? _fournisseur;
  Depot? _depot;
  bool _enCours = false;
  String? _erreur;

  Future<void> _creer() async {
    if (_fournisseur?.id == null) {
      setState(() => _erreur = 'Sélectionnez un fournisseur.');
      return;
    }
    if (_depot?.id == null) {
      setState(() => _erreur = 'Sélectionnez un dépôt.');
      return;
    }
    setState(() {
      _enCours = true;
      _erreur = null;
    });
    try {
      final exerciceId = await ref.read(exerciceOuvertProvider.future);
      final commande = await ref
          .read(commandeFournisseurRepositoryProvider)
          .creerBrouillon(
            exerciceId: exerciceId,
            fournisseurId: _fournisseur!.id!,
            depotId: _depot!.id!,
            dateCommande: DateTime.now(),
          );
      if (mounted) Navigator.of(context).pop(commande);
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Nouvelle commande fournisseur', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          TiersSelect(
            pourClient: false,
            label: 'Fournisseur',
            onSelectionnee: (t) => setState(() => _fournisseur = t),
          ),
          const SizedBox(height: 12),
          depotsAsync.when(
            data: (liste) => DropdownButtonFormField<Depot>(
              initialValue: _depot,
              decoration: const InputDecoration(labelText: 'Dépôt de réception'),
              items: [for (final d in liste) DropdownMenuItem(value: d, child: Text(d.libelle))],
              onChanged: (d) => setState(() => _depot = d),
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
    );
  }
}
