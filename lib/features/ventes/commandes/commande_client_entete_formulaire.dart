import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/commande_client.dart';
import '../../../models/tiers.dart';
import '../../../providers/exercice_providers.dart';
import '../../../providers/ventes_providers.dart';
import '../../../widgets/tiers_select.dart';

/// Crée une commande client vierge (sans devis d'origine).
Future<CommandeClient?> ouvrirCreationCommandeClient(BuildContext context, WidgetRef ref) {
  return showDialog<CommandeClient>(
    context: context,
    builder: (context) => const Dialog(
      child: SizedBox(width: 420, child: _CommandeClientEnteteFormulaire()),
    ),
  );
}

class _CommandeClientEnteteFormulaire extends ConsumerStatefulWidget {
  const _CommandeClientEnteteFormulaire();

  @override
  ConsumerState<_CommandeClientEnteteFormulaire> createState() => _CommandeClientEnteteFormulaireState();
}

class _CommandeClientEnteteFormulaireState extends ConsumerState<_CommandeClientEnteteFormulaire> {
  Tiers? _client;
  bool _enCours = false;
  String? _erreur;

  Future<void> _creer() async {
    if (_client?.id == null) {
      setState(() => _erreur = 'Sélectionnez un client.');
      return;
    }
    setState(() {
      _enCours = true;
      _erreur = null;
    });
    try {
      final exerciceId = await ref.read(exerciceOuvertProvider.future);
      final commande = await ref
          .read(commandeClientRepositoryProvider)
          .creerBrouillon(exerciceId: exerciceId, clientId: _client!.id!, dateCommande: DateTime.now());
      if (mounted) Navigator.of(context).pop(commande);
    } catch (e) {
      setState(() => _erreur = 'Création impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Nouvelle commande client', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          TiersSelect(pourClient: true, onSelectionnee: (t) => setState(() => _client = t)),
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
