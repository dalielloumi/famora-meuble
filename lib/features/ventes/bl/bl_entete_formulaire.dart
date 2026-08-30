import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/bl.dart';
import '../../../models/depot.dart';
import '../../../models/tiers.dart';
import '../../../providers/depot_providers.dart';
import '../../../providers/exercice_providers.dart';
import '../../../providers/ventes_providers.dart';
import '../../../widgets/tiers_select.dart';

/// Crée un BL vierge (sans commande d'origine). Le lien commande_client_id
/// reste facultatif dans le schéma — un BL peut exister seul (livraison
/// ponctuelle, vente directe sans commande préalable).
Future<Bl?> ouvrirCreationBl(BuildContext context, WidgetRef ref) {
  return showDialog<Bl>(
    context: context,
    builder: (context) => const Dialog(
      child: SizedBox(width: 420, child: _BlEnteteFormulaire()),
    ),
  );
}

class _BlEnteteFormulaire extends ConsumerStatefulWidget {
  const _BlEnteteFormulaire();

  @override
  ConsumerState<_BlEnteteFormulaire> createState() => _BlEnteteFormulaireState();
}

class _BlEnteteFormulaireState extends ConsumerState<_BlEnteteFormulaire> {
  Tiers? _client;
  Depot? _depot;
  bool _enCours = false;
  String? _erreur;

  Future<void> _creer() async {
    if (_client?.id == null) {
      setState(() => _erreur = 'Sélectionnez un client.');
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
      final bl = await ref
          .read(blRepositoryProvider)
          .creerBrouillon(
            exerciceId: exerciceId,
            clientId: _client!.id!,
            depotId: _depot!.id!,
            dateBl: DateTime.now(),
          );
      if (mounted) Navigator.of(context).pop(bl);
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
          Text('Nouveau bon de livraison', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          TiersSelect(pourClient: true, onSelectionnee: (t) => setState(() => _client = t)),
          const SizedBox(height: 12),
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
