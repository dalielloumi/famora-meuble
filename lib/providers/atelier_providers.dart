import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/nomenclature.dart';
import '../models/ordre_fabrication.dart';
import '../repositories/nomenclature_repository.dart';
import '../repositories/ordre_fabrication_repository.dart';

final nomenclatureRepositoryProvider = Provider<NomenclatureRepository>((ref) => NomenclatureRepository());
final ordreFabricationRepositoryProvider = Provider<OrdreFabricationRepository>(
  (ref) => OrdreFabricationRepository(),
);

class NomenclaturesNotifier extends AsyncNotifier<List<Nomenclature>> {
  @override
  Future<List<Nomenclature>> build() => ref.watch(nomenclatureRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final nomenclaturesProvider = AsyncNotifierProvider<NomenclaturesNotifier, List<Nomenclature>>(
  NomenclaturesNotifier.new,
);

class OrdresFabricationNotifier extends AsyncNotifier<List<OrdreFabrication>> {
  @override
  Future<List<OrdreFabrication>> build() => ref.watch(ordreFabricationRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final ordresFabricationProvider = AsyncNotifierProvider<OrdresFabricationNotifier, List<OrdreFabrication>>(
  OrdresFabricationNotifier.new,
);
