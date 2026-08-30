import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/livraison.dart';
import '../../../providers/livraison_sav_providers.dart';
import 'tournee_detail_page.dart';

class LivraisonsPage extends ConsumerWidget {
  const LivraisonsPage({super.key});

  Future<void> _nouvelleTournee(BuildContext context, WidgetRef ref) async {
    final chauffeurControleur = TextEditingController();
    final vehiculeControleur = TextEditingController();

    final confirme = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nouvelle tournée'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: chauffeurControleur, decoration: const InputDecoration(labelText: 'Chauffeur')),
            const SizedBox(height: 8),
            TextField(controller: vehiculeControleur, decoration: const InputDecoration(labelText: 'Véhicule')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Annuler')),
          FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Créer')),
        ],
      ),
    );

    if (confirme != true) return;
    final tournee = await ref
        .read(livraisonRepositoryProvider)
        .creer(
          dateTournee: DateTime.now(),
          chauffeur: chauffeurControleur.text.trim().isEmpty ? null : chauffeurControleur.text.trim(),
          vehicule: vehiculeControleur.text.trim().isEmpty ? null : vehiculeControleur.text.trim(),
        );
    ref.read(tourneesProvider.notifier).rafraichir();
    if (context.mounted) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => TourneeDetailPage(tourneeId: tournee.id!)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tourneesAsync = ref.watch(tourneesProvider);

    return tourneesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erreur : $e', style: const TextStyle(color: AppColors.alerte))),
      data: (liste) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: () => _nouvelleTournee(context, ref),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Nouvelle tournée'),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: liste.isEmpty
                  ? Center(child: Text('Aucune tournée.', style: AppText.corps))
                  : ListView(
                      children: [
                        for (final t in liste)
                          Card(
                            child: ListTile(
                              title: Text(t.numero ?? 'Tournée'),
                              subtitle: Text(
                                '${t.statut.libelle} · ${Formatters.date.format(t.dateTournee)}'
                                '${t.chauffeur != null ? ' · ${t.chauffeur}' : ''}',
                              ),
                              onTap: () => Navigator.of(
                                context,
                              ).push(MaterialPageRoute(builder: (_) => TourneeDetailPage(tourneeId: t.id!))),
                            ),
                          ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
