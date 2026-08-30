import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/facture_achat.dart';
import '../../../models/tiers.dart';
import '../../../providers/achats_providers.dart';
import '../../../providers/exercice_providers.dart';
import '../../../widgets/tiers_select.dart';

/// Crée une facture d'achat vierge (sans réception d'origine).
Future<FactureAchat?> ouvrirCreationFactureAchat(BuildContext context, WidgetRef ref) {
  return showDialog<FactureAchat>(
    context: context,
    builder: (context) => const Dialog(
      child: SizedBox(width: 420, child: _FactureAchatEnteteFormulaire()),
    ),
  );
}

class _FactureAchatEnteteFormulaire extends ConsumerStatefulWidget {
  const _FactureAchatEnteteFormulaire();

  @override
  ConsumerState<_FactureAchatEnteteFormulaire> createState() => _FactureAchatEnteteFormulaireState();
}

class _FactureAchatEnteteFormulaireState extends ConsumerState<_FactureAchatEnteteFormulaire> {
  Tiers? _fournisseur;
  final _numeroFournisseurControleur = TextEditingController();
  bool _enCours = false;
  String? _erreur;

  @override
  void dispose() {
    _numeroFournisseurControleur.dispose();
    super.dispose();
  }

  Future<void> _creer() async {
    if (_fournisseur?.id == null) {
      setState(() => _erreur = 'Sélectionnez un fournisseur.');
      return;
    }
    setState(() {
      _enCours = true;
      _erreur = null;
    });
    try {
      final exerciceId = await ref.read(exerciceOuvertProvider.future);
      final facture = await ref
          .read(factureAchatRepositoryProvider)
          .creerBrouillon(
            exerciceId: exerciceId,
            fournisseurId: _fournisseur!.id!,
            numeroFactureFournisseur: _numeroFournisseurControleur.text.trim().isEmpty
                ? null
                : _numeroFournisseurControleur.text.trim(),
            dateFacture: DateTime.now(),
          );
      if (mounted) Navigator.of(context).pop(facture);
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
          Text('Nouvelle facture d\'achat', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          TiersSelect(
            pourClient: false,
            label: 'Fournisseur',
            onSelectionnee: (t) => setState(() => _fournisseur = t),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _numeroFournisseurControleur,
            decoration: const InputDecoration(labelText: 'N° facture fournisseur (optionnel)'),
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
