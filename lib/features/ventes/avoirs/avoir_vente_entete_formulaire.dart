import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/avoir_vente.dart';
import '../../../models/facture_vente.dart';
import '../../../models/ligne_saisie.dart';
import '../../../providers/exercice_providers.dart';
import '../../../providers/ventes_providers.dart';
import 'avoir_vente_detail_page.dart';

/// Crée un avoir référençant obligatoirement sa facture d'origine, avec un
/// motif (règle métier section 4). Les lignes de la facture sont copiées
/// intégralement par défaut ; l'utilisateur ajuste ensuite les quantités
/// dans le détail de l'avoir pour un avoir partiel.
Future<AvoirVente?> ouvrirCreationAvoirVente(
  BuildContext context,
  WidgetRef ref, {
  required FactureVente facture,
  required List<LigneSaisie> lignesFacture,
}) {
  return showDialog<AvoirVente>(
    context: context,
    builder: (context) => Dialog(
      child: SizedBox(
        width: 420,
        child: _AvoirVenteEnteteFormulaire(facture: facture, lignesFacture: lignesFacture),
      ),
    ),
  );
}

class _AvoirVenteEnteteFormulaire extends ConsumerStatefulWidget {
  const _AvoirVenteEnteteFormulaire({required this.facture, required this.lignesFacture});

  final FactureVente facture;
  final List<LigneSaisie> lignesFacture;

  @override
  ConsumerState<_AvoirVenteEnteteFormulaire> createState() => _AvoirVenteEnteteFormulaireState();
}

class _AvoirVenteEnteteFormulaireState extends ConsumerState<_AvoirVenteEnteteFormulaire> {
  final _motifControleur = TextEditingController();
  bool _enCours = false;
  String? _erreur;

  @override
  void dispose() {
    _motifControleur.dispose();
    super.dispose();
  }

  Future<void> _creer() async {
    if (_motifControleur.text.trim().isEmpty) {
      setState(() => _erreur = 'Le motif est obligatoire.');
      return;
    }

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    try {
      final exerciceId = await ref.read(exerciceOuvertProvider.future);
      final repo = ref.read(avoirVenteRepositoryProvider);
      final avoir = await repo.creerBrouillon(
        exerciceId: exerciceId,
        clientId: widget.facture.clientId,
        factureVenteId: widget.facture.id!,
        motif: _motifControleur.text.trim(),
        dateAvoir: DateTime.now(),
      );
      await repo.remplacerLignes(avoir.id!, widget.lignesFacture);

      if (mounted) {
        Navigator.of(context).pop(avoir);
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => AvoirVenteDetailPage(avoirId: avoir.id!)));
      }
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
          Text('Nouvel avoir', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'Facture ${widget.facture.numero ?? ''}',
            style: const TextStyle(color: AppColors.texte, fontSize: 12),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _motifControleur,
            decoration: const InputDecoration(labelText: 'Motif'),
            maxLines: 2,
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
