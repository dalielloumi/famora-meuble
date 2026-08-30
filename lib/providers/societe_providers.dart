import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/societe.dart';
import '../repositories/societe_repository.dart';

final societeRepositoryProvider = Provider<SocieteRepository>((ref) => SocieteRepository());

final societeProvider = FutureProvider<Societe>((ref) => ref.watch(societeRepositoryProvider).charger());

/// Octets du logo, `null` si aucun logo n'a été téléversé. Recalculé dès que
/// `societeProvider` change (nouveau logo enregistré).
final logoOctetsProvider = FutureProvider((ref) async {
  final societe = await ref.watch(societeProvider.future);
  return ref.watch(societeRepositoryProvider).telechargerLogo(societe.logoUrl);
});
