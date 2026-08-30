import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/depot.dart';
import '../repositories/depot_repository.dart';

final depotRepositoryProvider = Provider<DepotRepository>((ref) => DepotRepository());

class DepotsNotifier extends AsyncNotifier<List<Depot>> {
  @override
  Future<List<Depot>> build() => ref.watch(depotRepositoryProvider).lister();

  Future<void> creer(Depot depot) async {
    await ref.read(depotRepositoryProvider).creer(depot);
    ref.invalidateSelf();
    await future;
  }

  Future<void> modifier(Depot depot) async {
    await ref.read(depotRepositoryProvider).modifier(depot);
    ref.invalidateSelf();
    await future;
  }

  Future<void> archiver(String id, {required bool actif}) async {
    await ref.read(depotRepositoryProvider).archiver(id, actif: actif);
    ref.invalidateSelf();
    await future;
  }
}

final depotsProvider = AsyncNotifierProvider<DepotsNotifier, List<Depot>>(DepotsNotifier.new);
