import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/supabase_client.dart';
import '../models/reference.dart';

final unitesMesureProvider = FutureProvider<List<UniteMesure>>((ref) async {
  final lignes = await supabase.from('unite_mesure').select().order('code');
  return lignes.map(UniteMesure.fromJson).toList();
});

final tauxTvaListProvider = FutureProvider<List<TauxTva>>((ref) async {
  final lignes = await supabase.from('taux_tva').select().eq('actif', true).order('taux', ascending: false);
  return lignes.map(TauxTva.fromJson).toList();
});
