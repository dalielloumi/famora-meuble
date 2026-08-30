import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/sav.dart';
import '../../../providers/livraison_sav_providers.dart';
import '../../../widgets/statut_bar.dart';
import '../../../widgets/tiers_select.dart';

class SavPage extends ConsumerWidget {
  const SavPage({super.key});

  EtatStatutBar _etat(StatutSav s) => switch (s) {
    StatutSav.ouvert => EtatStatutBar.annuleImpaye,
    StatutSav.enCours => EtatStatutBar.partiel,
    StatutSav.resolu => EtatStatutBar.valide,
    StatutSav.ferme => EtatStatutBar.solde,
  };

  Future<void> _nouveauSav(BuildContext context, WidgetRef ref) async {
    final descriptionControleur = TextEditingController();
    String? clientId;
    TypeInterventionSav? type;

    final confirme = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setEtatLocal) => AlertDialog(
          title: const Text('Nouveau dossier SAV'),
          content: SizedBox(
            width: 380,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TiersSelect(pourClient: true, onSelectionnee: (t) => clientId = t.id),
                const SizedBox(height: 8),
                TextField(
                  controller: descriptionControleur,
                  decoration: const InputDecoration(labelText: 'Description du problème'),
                  maxLines: 3,
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<TypeInterventionSav>(
                  initialValue: type,
                  decoration: const InputDecoration(labelText: 'Type d\'intervention (optionnel)'),
                  items: [
                    for (final t in TypeInterventionSav.values)
                      DropdownMenuItem(value: t, child: Text(t.libelle)),
                  ],
                  onChanged: (t) => setEtatLocal(() => type = t),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Annuler')),
            FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Créer')),
          ],
        ),
      ),
    );

    if (confirme != true || clientId == null || descriptionControleur.text.trim().isEmpty) return;

    await ref
        .read(savRepositoryProvider)
        .creer(clientId: clientId!, descriptionProbleme: descriptionControleur.text.trim(), typeIntervention: type);
    ref.read(savListeProvider.notifier).rafraichir();
  }

  Future<void> _changerStatut(WidgetRef ref, Sav sav, StatutSav statut) async {
    await ref.read(savRepositoryProvider).changerStatut(sav.id!, statut);
    ref.read(savListeProvider.notifier).rafraichir();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savAsync = ref.watch(savListeProvider);

    return savAsync.when(
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
                onPressed: () => _nouveauSav(context, ref),
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Nouveau dossier'),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: liste.isEmpty
                  ? Center(child: Text('Aucun dossier SAV.', style: AppText.corps))
                  : ListView(
                      children: [
                        for (final s in liste)
                          Card(
                            child: ListTile(
                              leading: StatutBar(etat: _etat(s.statut), hauteur: 36),
                              title: Text(s.numero ?? 'SAV'),
                              subtitle: Text(
                                '${s.statut.libelle} · ${Formatters.date.format(s.dateOuverture)}\n${s.descriptionProbleme}',
                              ),
                              isThreeLine: true,
                              trailing: DropdownButton<StatutSav>(
                                value: s.statut,
                                items: [
                                  for (final st in StatutSav.values)
                                    DropdownMenuItem(value: st, child: Text(st.libelle)),
                                ],
                                onChanged: (st) {
                                  if (st != null) _changerStatut(ref, s, st);
                                },
                              ),
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
