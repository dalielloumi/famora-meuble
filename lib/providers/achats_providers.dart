import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/avoir_achat.dart';
import '../models/commande_fournisseur.dart';
import '../models/facture_achat.dart';
import '../models/reception.dart';
import '../repositories/avoir_achat_repository.dart';
import '../repositories/commande_fournisseur_repository.dart';
import '../repositories/facture_achat_repository.dart';
import '../repositories/reception_repository.dart';

final commandeFournisseurRepositoryProvider = Provider<CommandeFournisseurRepository>(
  (ref) => CommandeFournisseurRepository(),
);
final receptionRepositoryProvider = Provider<ReceptionRepository>((ref) => ReceptionRepository());
final factureAchatRepositoryProvider = Provider<FactureAchatRepository>((ref) => FactureAchatRepository());
final avoirAchatRepositoryProvider = Provider<AvoirAchatRepository>((ref) => AvoirAchatRepository());

class CommandeFournisseurListeNotifier extends AsyncNotifier<List<CommandeFournisseur>> {
  @override
  Future<List<CommandeFournisseur>> build() => ref.watch(commandeFournisseurRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final commandeFournisseurListeProvider =
    AsyncNotifierProvider<CommandeFournisseurListeNotifier, List<CommandeFournisseur>>(
      CommandeFournisseurListeNotifier.new,
    );

class ReceptionListeNotifier extends AsyncNotifier<List<Reception>> {
  @override
  Future<List<Reception>> build() => ref.watch(receptionRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final receptionListeProvider = AsyncNotifierProvider<ReceptionListeNotifier, List<Reception>>(
  ReceptionListeNotifier.new,
);

class FactureAchatListeNotifier extends AsyncNotifier<List<FactureAchat>> {
  @override
  Future<List<FactureAchat>> build() => ref.watch(factureAchatRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final factureAchatListeProvider = AsyncNotifierProvider<FactureAchatListeNotifier, List<FactureAchat>>(
  FactureAchatListeNotifier.new,
);

class AvoirAchatListeNotifier extends AsyncNotifier<List<AvoirAchat>> {
  @override
  Future<List<AvoirAchat>> build() => ref.watch(avoirAchatRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final avoirAchatListeProvider = AsyncNotifierProvider<AvoirAchatListeNotifier, List<AvoirAchat>>(
  AvoirAchatListeNotifier.new,
);
