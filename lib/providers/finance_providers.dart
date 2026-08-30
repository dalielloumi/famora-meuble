import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/caisse.dart';
import '../models/reglement.dart';
import '../repositories/caisse_repository.dart';
import '../repositories/reglement_repository.dart';

final reglementRepositoryProvider = Provider<ReglementRepository>((ref) => ReglementRepository());
final caisseRepositoryProvider = Provider<CaisseRepository>((ref) => CaisseRepository());

class ReglementsNotifier extends AsyncNotifier<List<Reglement>> {
  @override
  Future<List<Reglement>> build() => ref.watch(reglementRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final reglementsProvider = AsyncNotifierProvider<ReglementsNotifier, List<Reglement>>(ReglementsNotifier.new);

class EffetsNotifier extends AsyncNotifier<List<Effet>> {
  @override
  Future<List<Effet>> build() => ref.watch(reglementRepositoryProvider).listerEffets();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final effetsProvider = AsyncNotifierProvider<EffetsNotifier, List<Effet>>(EffetsNotifier.new);

class CaissesNotifier extends AsyncNotifier<List<Caisse>> {
  @override
  Future<List<Caisse>> build() => ref.watch(caisseRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final caissesProvider = AsyncNotifierProvider<CaissesNotifier, List<Caisse>>(CaissesNotifier.new);
