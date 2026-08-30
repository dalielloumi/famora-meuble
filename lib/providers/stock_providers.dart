import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/inventaire.dart';
import '../models/stock.dart';
import '../repositories/inventaire_repository.dart';
import '../repositories/stock_repository.dart';

final stockRepositoryProvider = Provider<StockRepository>((ref) => StockRepository());
final inventaireRepositoryProvider = Provider<InventaireRepository>((ref) => InventaireRepository());

class StockListeNotifier extends AsyncNotifier<List<StockLigne>> {
  @override
  Future<List<StockLigne>> build() => ref.watch(stockRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final stockListeProvider = AsyncNotifierProvider<StockListeNotifier, List<StockLigne>>(StockListeNotifier.new);

final mouvementsProvider = FutureProvider<List<MouvementStock>>((ref) {
  return ref.watch(stockRepositoryProvider).listerMouvements();
});

class InventaireListeNotifier extends AsyncNotifier<List<Inventaire>> {
  @override
  Future<List<Inventaire>> build() => ref.watch(inventaireRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final inventaireListeProvider = AsyncNotifierProvider<InventaireListeNotifier, List<Inventaire>>(
  InventaireListeNotifier.new,
);
