import '../core/supabase_client.dart';
import '../models/ordre_fabrication.dart';

class OrdreFabricationRepository {
  Future<List<OrdreFabrication>> lister() async {
    final lignes = await supabase.from('ordre_fabrication').select().order('cree_le', ascending: false);
    return lignes.map(OrdreFabrication.fromJson).toList();
  }

  Future<OrdreFabrication> creerBrouillon({
    required String exerciceId,
    required String articleId,
    required String nomenclatureId,
    String? commandeClientLigneId,
    required String quantitePrevue,
    required String depotSourceId,
    required String depotDestinationId,
    String? notes,
  }) async {
    final ligne = await supabase
        .from('ordre_fabrication')
        .insert({
          'exercice_id': exerciceId,
          'article_id': articleId,
          'nomenclature_id': nomenclatureId,
          if (commandeClientLigneId != null) 'commande_client_ligne_id': commandeClientLigneId,
          'quantite_prevue': quantitePrevue,
          'depot_source_id': depotSourceId,
          'depot_destination_id': depotDestinationId,
          if (notes != null) 'notes': notes,
        })
        .select()
        .single();
    return OrdreFabrication.fromJson(ligne);
  }

  Future<OrdreFabrication> rafraichir(String id) async {
    final ligne = await supabase.from('ordre_fabrication').select().eq('id', id).single();
    return OrdreFabrication.fromJson(ligne);
  }

  /// Lance l'OF : le trigger app.lancer_of() consomme les composants et
  /// calcule cout_matiere (migration 011).
  Future<void> lancer(String id) async {
    await supabase
        .from('ordre_fabrication')
        .update({'statut': 'LANCE', 'date_lancement': DateTime.now().toIso8601String().substring(0, 10)})
        .eq('id', id);
  }

  /// Clôture l'OF : le trigger app.cloturer_of() produit le fini au CMP
  /// (cout_matiere / quantite_produite).
  Future<void> cloturer(String id, {required String quantiteProduite}) async {
    await supabase
        .from('ordre_fabrication')
        .update({
          'statut': 'CLOTURE',
          'quantite_produite': quantiteProduite,
          'date_cloture': DateTime.now().toIso8601String().substring(0, 10),
        })
        .eq('id', id);
  }

  Future<void> annuler(String id) async {
    await supabase.from('ordre_fabrication').update({'statut': 'ANNULE'}).eq('id', id);
  }
}
