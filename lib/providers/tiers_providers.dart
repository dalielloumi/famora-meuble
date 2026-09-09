import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/tiers.dart';
import '../repositories/tiers_repository.dart';

final tiersRepositoryProvider = Provider<TiersRepository>((ref) => TiersRepository());

class TiersNotifier extends AsyncNotifier<List<Tiers>> {
  @override
  Future<List<Tiers>> build() => ref.watch(tiersRepositoryProvider).lister();

  Future<void> creer(Tiers tiers) async {
    await ref.read(tiersRepositoryProvider).creer(tiers);
    ref.invalidateSelf();
    await future;
  }

  Future<void> modifier(Tiers tiers) async {
    await ref.read(tiersRepositoryProvider).modifier(tiers);
    ref.invalidateSelf();
    await future;
  }

  Future<void> archiver(String id, {required bool actif}) async {
    await ref.read(tiersRepositoryProvider).archiver(id, actif: actif);
    ref.invalidateSelf();
    await future;
  }

  /// Supprime plusieurs tiers d'un coup (sélection multiple dans la liste).
  /// Chaque suppression est tentée indépendamment : un tiers encore
  /// référencé par des documents échoue sans bloquer les autres. Retourne
  /// les ids qui n'ont pas pu être supprimés.
  Future<List<String>> supprimerPlusieurs(List<String> ids) async {
    final repo = ref.read(tiersRepositoryProvider);
    final echecs = <String>[];
    for (final id in ids) {
      try {
        await repo.supprimer(id);
      } catch (_) {
        echecs.add(id);
      }
    }
    ref.invalidateSelf();
    await future;
    return echecs;
  }
}

final tiersListProvider = AsyncNotifierProvider<TiersNotifier, List<Tiers>>(TiersNotifier.new);
