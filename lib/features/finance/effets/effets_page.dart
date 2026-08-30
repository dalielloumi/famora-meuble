import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/reglement.dart';
import '../../../providers/finance_providers.dart';
import '../../../widgets/statut_bar.dart';

class EffetsPage extends ConsumerWidget {
  const EffetsPage({super.key});

  EtatStatutBar _etat(StatutEffet s) => switch (s) {
    StatutEffet.enPortefeuille => EtatStatutBar.partiel,
    StatutEffet.encaisse => EtatStatutBar.solde,
    StatutEffet.impaye => EtatStatutBar.annuleImpaye,
    StatutEffet.escompte => EtatStatutBar.valide,
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final effetsAsync = ref.watch(effetsProvider);

    return effetsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erreur : $e', style: const TextStyle(color: AppColors.alerte))),
      data: (liste) {
        if (liste.isEmpty) {
          return Center(child: Text('Aucun chèque ni traite enregistré.', style: AppText.corps));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: liste.length,
          separatorBuilder: (context, index) => const Divider(height: 1, color: AppColors.bordure),
          itemBuilder: (context, index) {
            final e = liste[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  StatutBar(etat: _etat(e.statut), hauteur: 36),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${e.numeroEffet} — ${Formatters.montant(e.montant)}', style: AppText.corps),
                        Text(
                          '${e.statut.libelle} · échéance ${Formatters.date.format(e.dateEcheance)}${e.banque != null ? ' · ${e.banque}' : ''}',
                          style: AppText.corps.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  if (e.statut == StatutEffet.enPortefeuille) ...[
                    TextButton(
                      onPressed: () async {
                        await ref.read(reglementRepositoryProvider).marquerEffetEncaisse(e.id!);
                        ref.read(effetsProvider.notifier).rafraichir();
                      },
                      child: const Text('Encaissé'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(foregroundColor: AppColors.alerte),
                      onPressed: () async {
                        await ref.read(reglementRepositoryProvider).marquerEffetImpaye(e.id!);
                        ref.read(effetsProvider.notifier).rafraichir();
                      },
                      child: const Text('Impayé'),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}
