import '../core/supabase_client.dart';
import '../models/famille_article.dart';

class FamilleArticleRepository {
  Future<List<FamilleArticle>> lister() async {
    final lignes = await supabase.from('famille_article').select().order('libelle');
    return lignes.map(FamilleArticle.fromJson).toList();
  }

  Future<FamilleArticle> creer({required String code, required String libelle}) async {
    final ligne = await supabase.from('famille_article').insert({'code': code, 'libelle': libelle}).select().single();
    return FamilleArticle.fromJson(ligne);
  }
}
