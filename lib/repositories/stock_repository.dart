import '../core/supabase_client.dart';
import '../models/stock.dart';

class StockRepository {
  Future<List<StockLigne>> lister() async {
    final lignes = await supabase.from('stock').select().order('quantite', ascending: false);
    return lignes.map(StockLigne.fromJson).toList();
  }

  Future<List<MouvementStock>> listerMouvements({String? articleId, int limite = 200}) async {
    var requete = supabase.from('mouvement_stock').select();
    if (articleId != null) {
      requete = requete.eq('article_id', articleId);
    }
    final lignes = await requete.order('date_mouvement', ascending: false).limit(limite);
    return lignes.map(MouvementStock.fromJson).toList();
  }

  /// Transfert entre dépôts : une sortie et une entrée insérées ensemble
  /// (une seule requête PostgREST = une seule instruction SQL atomique).
  Future<void> transferer({
    required String articleId,
    String? varianteId,
    required String depotSourceId,
    required String depotDestinationId,
    required String quantite,
    required String prixUnitaire,
  }) async {
    await supabase.from('mouvement_stock').insert([
      {
        'article_id': articleId,
        if (varianteId != null) 'variante_id': varianteId,
        'depot_id': depotSourceId,
        'type_mouvement': 'TRANSFERT_SORTIE',
        'sens': 'SORTIE',
        'quantite': quantite,
        'prix_unitaire': prixUnitaire,
      },
      {
        'article_id': articleId,
        if (varianteId != null) 'variante_id': varianteId,
        'depot_id': depotDestinationId,
        'type_mouvement': 'TRANSFERT_ENTREE',
        'sens': 'ENTREE',
        'quantite': quantite,
        'prix_unitaire': prixUnitaire,
      },
    ]);
  }
}
