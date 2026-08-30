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
}

final tiersListProvider = AsyncNotifierProvider<TiersNotifier, List<Tiers>>(TiersNotifier.new);
