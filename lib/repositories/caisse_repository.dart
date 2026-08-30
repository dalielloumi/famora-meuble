import '../core/supabase_client.dart';
import '../models/caisse.dart';

class CaisseRepository {
  Future<List<Caisse>> lister() async {
    final lignes = await supabase.from('caisse').select().order('libelle');
    return lignes.map(Caisse.fromJson).toList();
  }

  Future<Caisse> creer(String libelle) async {
    final ligne = await supabase.from('caisse').insert({'libelle': libelle}).select().single();
    return Caisse.fromJson(ligne);
  }

  Future<List<CaisseOperation>> listerOperations(String caisseId) async {
    final lignes = await supabase
        .from('caisse_operation')
        .select()
        .eq('caisse_id', caisseId)
        .order('date_operation', ascending: false);
    return lignes.map(CaisseOperation.fromJson).toList();
  }

  Future<void> ajouterOperation({
    required String caisseId,
    required SensReglement sens,
    required String montant,
    required String libelle,
  }) async {
    await supabase.from('caisse_operation').insert({
      'caisse_id': caisseId,
      'sens': sens == SensReglement.encaissement ? 'ENCAISSEMENT' : 'DECAISSEMENT',
      'montant': montant,
      'libelle': libelle,
      'date_operation': DateTime.now().toIso8601String().substring(0, 10),
    });
  }
}
