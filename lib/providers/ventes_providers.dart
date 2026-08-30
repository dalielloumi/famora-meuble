import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/avoir_vente.dart';
import '../models/bl.dart';
import '../models/commande_client.dart';
import '../models/devis.dart';
import '../models/facture_vente.dart';
import '../repositories/avoir_vente_repository.dart';
import '../repositories/bl_repository.dart';
import '../repositories/commande_client_repository.dart';
import '../repositories/devis_repository.dart';
import '../repositories/facture_vente_repository.dart';

final devisRepositoryProvider = Provider<DevisRepository>((ref) => DevisRepository());
final commandeClientRepositoryProvider = Provider<CommandeClientRepository>((ref) => CommandeClientRepository());
final blRepositoryProvider = Provider<BlRepository>((ref) => BlRepository());
final factureVenteRepositoryProvider = Provider<FactureVenteRepository>((ref) => FactureVenteRepository());
final avoirVenteRepositoryProvider = Provider<AvoirVenteRepository>((ref) => AvoirVenteRepository());

class DevisListeNotifier extends AsyncNotifier<List<Devis>> {
  @override
  Future<List<Devis>> build() => ref.watch(devisRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final devisListeProvider = AsyncNotifierProvider<DevisListeNotifier, List<Devis>>(DevisListeNotifier.new);

class CommandeClientListeNotifier extends AsyncNotifier<List<CommandeClient>> {
  @override
  Future<List<CommandeClient>> build() => ref.watch(commandeClientRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final commandeClientListeProvider =
    AsyncNotifierProvider<CommandeClientListeNotifier, List<CommandeClient>>(CommandeClientListeNotifier.new);

class BlListeNotifier extends AsyncNotifier<List<Bl>> {
  @override
  Future<List<Bl>> build() => ref.watch(blRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final blListeProvider = AsyncNotifierProvider<BlListeNotifier, List<Bl>>(BlListeNotifier.new);

class FactureVenteListeNotifier extends AsyncNotifier<List<FactureVente>> {
  @override
  Future<List<FactureVente>> build() => ref.watch(factureVenteRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final factureVenteListeProvider =
    AsyncNotifierProvider<FactureVenteListeNotifier, List<FactureVente>>(FactureVenteListeNotifier.new);

class AvoirVenteListeNotifier extends AsyncNotifier<List<AvoirVente>> {
  @override
  Future<List<AvoirVente>> build() => ref.watch(avoirVenteRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final avoirVenteListeProvider =
    AsyncNotifierProvider<AvoirVenteListeNotifier, List<AvoirVente>>(AvoirVenteListeNotifier.new);
