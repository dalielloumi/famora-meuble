import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/caisse.dart';
import '../../../providers/finance_providers.dart';

class CaissePage extends ConsumerWidget {
  const CaissePage({super.key});

  Future<void> _nouvelleCaisse(BuildContext context, WidgetRef ref) async {
    final controleur = TextEditingController();
    final libelle = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nouvelle caisse'),
        content: TextField(controller: controleur, decoration: const InputDecoration(labelText: 'Libellé')),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Annuler')),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(controleur.text.trim()),
            child: const Text('Créer'),
          ),
        ],
      ),
    );
    if (libelle != null && libelle.isNotEmpty) {
      await ref.read(caisseRepositoryProvider).creer(libelle);
      ref.read(caissesProvider.notifier).rafraichir();
    }
  }

  Future<void> _nouvelleOperation(BuildContext context, WidgetRef ref, Caisse caisse) async {
    final montantControleur = TextEditingController();
    final libelleControleur = TextEditingController();
    var sens = SensReglement.encaissement;

    final confirme = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setEtatLocal) => AlertDialog(
          title: Text('Opération — ${caisse.libelle}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SegmentedButton<SensReglement>(
                segments: const [
                  ButtonSegment(value: SensReglement.encaissement, label: Text('Entrée')),
                  ButtonSegment(value: SensReglement.decaissement, label: Text('Sortie')),
                ],
                selected: {sens},
                onSelectionChanged: (s) => setEtatLocal(() => sens = s.first),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: montantControleur,
                decoration: const InputDecoration(labelText: 'Montant'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 12),
              TextField(controller: libelleControleur, decoration: const InputDecoration(labelText: 'Libellé')),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Annuler')),
            FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Enregistrer')),
          ],
        ),
      ),
    );

    if (confirme != true) return;
    final montant = Decimal.tryParse(montantControleur.text.replaceAll(',', '.'));
    if (montant == null || montant <= Decimal.zero) return;

    await ref
        .read(caisseRepositoryProvider)
        .ajouterOperation(
          caisseId: caisse.id!,
          sens: sens,
          montant: montant.toString(),
          libelle: libelleControleur.text.trim().isEmpty ? 'Opération de caisse' : libelleControleur.text.trim(),
        );
    ref.read(caissesProvider.notifier).rafraichir();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caissesAsync = ref.watch(caissesProvider);

    return caissesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erreur : $e', style: const TextStyle(color: AppColors.alerte))),
      data: (liste) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton.icon(
                  onPressed: () => _nouvelleCaisse(context, ref),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Nouvelle caisse'),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: liste.isEmpty
                    ? Center(child: Text('Aucune caisse. Créez-en une.', style: AppText.corps))
                    : ListView(
                        children: [
                          for (final c in liste)
                            Card(
                              child: ListTile(
                                title: Text(c.libelle, style: AppText.sousTitre),
                                subtitle: Text('Solde : ${Formatters.montant(c.solde)}', style: AppText.montant),
                                trailing: IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () => _nouvelleOperation(context, ref, c),
                                ),
                              ),
                            ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
