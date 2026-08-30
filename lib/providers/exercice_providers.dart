import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/supabase_client.dart';

/// Exercice comptable ouvert courant. Tous les documents y sont rattachés.
final exerciceOuvertProvider = FutureProvider<String>((ref) async {
  final id = await supabase.rpc('exercice_ouvert');
  if (id == null) {
    throw Exception('Aucun exercice ouvert. Vérifiez la table exercice.');
  }
  return id as String;
});
