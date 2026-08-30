import '../core/supabase_client.dart';
import '../models/nomenclature.dart';

class NomenclatureRepository {
  Future<List<Nomenclature>> lister() async {
    final lignes = await supabase.from('nomenclature').select().order('version', ascending: false);
    return lignes.map(Nomenclature.fromJson).toList();
  }

  Future<List<NomenclatureLigne>> chargerLignes(String nomenclatureId) async {
    final lignes = await supabase
        .from('nomenclature_ligne')
        .select()
        .eq('nomenclature_id', nomenclatureId)
        .order('ordre');
    return lignes.map(NomenclatureLigne.fromJson).toList();
  }

  Future<Nomenclature> creer({required String articleId, required int version, String? notes}) async {
    final ligne = await supabase
        .from('nomenclature')
        .insert({
          'article_id': articleId,
          'version': version,
          if (notes != null) 'notes': notes,
        })
        .select()
        .single();
    return Nomenclature.fromJson(ligne);
  }

  Future<void> remplacerLignes(
    String nomenclatureId,
    List<({String composantId, String quantite, String uniteId})> lignes,
  ) async {
    await supabase.from('nomenclature_ligne').delete().eq('nomenclature_id', nomenclatureId);
    if (lignes.isEmpty) return;
    await supabase
        .from('nomenclature_ligne')
        .insert([
          for (var i = 0; i < lignes.length; i++)
            {
              'nomenclature_id': nomenclatureId,
              'composant_id': lignes[i].composantId,
              'quantite': lignes[i].quantite,
              'unite_id': lignes[i].uniteId,
              'ordre': i,
            },
        ]);
  }
}
