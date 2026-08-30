import '../core/supabase_client.dart';
import '../models/tiers.dart';

class TiersRepository {
  Future<List<Tiers>> lister() async {
    final lignes = await supabase.from('tiers').select().order('raison_sociale');
    return lignes.map(Tiers.fromJson).toList();
  }

  Future<Tiers> creer(Tiers tiers) async {
    final donnees = tiers.toJson()..remove('id')..remove('solde');
    final ligne = await supabase.from('tiers').insert(donnees).select().single();
    return Tiers.fromJson(ligne);
  }

  Future<Tiers> modifier(Tiers tiers) async {
    final donnees = tiers.toJson()..remove('id')..remove('solde');
    final ligne = await supabase.from('tiers').update(donnees).eq('id', tiers.id!).select().single();
    return Tiers.fromJson(ligne);
  }

  Future<void> archiver(String id, {required bool actif}) async {
    await supabase.from('tiers').update({'actif': actif}).eq('id', id);
  }
}
