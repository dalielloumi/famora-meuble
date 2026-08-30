import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/livraison.dart';
import '../models/sav.dart';
import '../repositories/livraison_repository.dart';
import '../repositories/sav_repository.dart';

final livraisonRepositoryProvider = Provider<LivraisonRepository>((ref) => LivraisonRepository());
final savRepositoryProvider = Provider<SavRepository>((ref) => SavRepository());

class TourneesNotifier extends AsyncNotifier<List<TourneeLivraison>> {
  @override
  Future<List<TourneeLivraison>> build() => ref.watch(livraisonRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final tourneesProvider = AsyncNotifierProvider<TourneesNotifier, List<TourneeLivraison>>(TourneesNotifier.new);

class SavListeNotifier extends AsyncNotifier<List<Sav>> {
  @override
  Future<List<Sav>> build() => ref.watch(savRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final savListeProvider = AsyncNotifierProvider<SavListeNotifier, List<Sav>>(SavListeNotifier.new);
