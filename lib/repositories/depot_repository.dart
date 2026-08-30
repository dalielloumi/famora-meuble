import '../core/supabase_client.dart';
import '../models/depot.dart';

class DepotRepository {
  Future<List<Depot>> lister() async {
    final lignes = await supabase.from('depot').select().order('code');
    return lignes.map(Depot.fromJson).toList();
  }

  Future<Depot> creer(Depot depot) async {
    final ligne = await supabase.from('depot').insert(depot.toJson()..remove('id')).select().single();
    return Depot.fromJson(ligne);
  }

  Future<Depot> modifier(Depot depot) async {
    final ligne = await supabase
        .from('depot')
        .update(depot.toJson()..remove('id'))
        .eq('id', depot.id!)
        .select()
        .single();
    return Depot.fromJson(ligne);
  }

  Future<void> archiver(String id, {required bool actif}) async {
    await supabase.from('depot').update({'actif': actif}).eq('id', id);
  }
}
