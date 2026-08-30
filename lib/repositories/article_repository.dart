import '../core/supabase_client.dart';
import '../models/article.dart';

class ArticleRepository {
  Future<List<Article>> lister() async {
    final lignes = await supabase.from('article').select().order('reference');
    return lignes.map(Article.fromJson).toList();
  }

  /// Nombre d'articles déjà rattachés à cette famille — sert de base à la
  /// génération automatique de la référence (PREFIXE + compteur).
  Future<int> compterParFamille(String familleId) async {
    final lignes = await supabase.from('article').select('id').eq('famille_id', familleId);
    return lignes.length;
  }

  Future<Article> creer(Article article) async {
    final ligne = await supabase.from('article').insert(article.toJson()..remove('id')).select().single();
    return Article.fromJson(ligne);
  }

  Future<Article> modifier(Article article) async {
    final ligne = await supabase
        .from('article')
        .update(article.toJson()..remove('id'))
        .eq('id', article.id!)
        .select()
        .single();
    return Article.fromJson(ligne);
  }

  Future<void> archiver(String id, {required bool actif}) async {
    await supabase.from('article').update({'actif': actif}).eq('id', id);
  }
}
