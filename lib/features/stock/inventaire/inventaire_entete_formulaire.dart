import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/depot.dart';
import '../../../models/inventaire.dart';
import '../../../providers/depot_providers.dart';
import '../../../providers/exercice_providers.dart';
import '../../../providers/stock_providers.dart';

Future<Inventaire?> ouvrirCreationInventaire(BuildContext context, WidgetRef ref) {
  return showDialog<Inventaire>(
    context: context,
    builder: (context) => const Dialog(
      child: SizedBox(width: 420, child: _InventaireEnteteFormulaire()),
    ),
  );
}

class _InventaireEnteteFormulaire extends ConsumerStatefulWidget {
  const _InventaireEnteteFormulaire();

  @override
  ConsumerState<_InventaireEnteteFormulaire> createState() => _InventaireEnteteFormulaireState();
}

class _InventaireEnteteFormulaireState extends ConsumerState<_InventaireEnteteFormulaire> {
  Depot? _depot;
  bool _enCours = false;
  String? _erreur;

  Future<void> _creer() async {
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
      final repo = ref.read(inventaireRepositoryProvider);
      final inventaire = await repo.creerBrouillon(
        exerciceId: exerciceId,
        depotId: _depot!.id!,
        dateInventaire: DateTime.now(),
      );
      await repo.initialiserLignesDepuisStock(inventaire.id!, _depot!.id!);
      if (mounted) Navigator.of(context).pop(inventaire);
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
          Text('Nouvel inventaire', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'Initialise le comptage avec le stock théorique du dépôt choisi.',
            style: const TextStyle(fontSize: 12, color: AppColors.texte),
          ),
          const SizedBox(height: 16),
          depotsAsync.when(
            data: (liste) => DropdownButtonFormField<Depot>(
              initialValue: _depot,
              decoration: const InputDecoration(labelText: 'Dépôt'),
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
