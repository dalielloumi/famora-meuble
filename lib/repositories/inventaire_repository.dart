import '../core/supabase_client.dart';
import '../models/inventaire.dart';

class InventaireRepository {
  Future<List<Inventaire>> lister() async {
    final lignes = await supabase.from('inventaire').select().order('date_inventaire', ascending: false);
    return lignes.map(Inventaire.fromJson).toList();
  }

  Future<List<InventaireLigne>> chargerLignes(String inventaireId) async {
    final lignes = await supabase
        .from('inventaire_ligne')
        .select()
        .eq('inventaire_id', inventaireId)
        .order('article_id');
    return lignes.map(InventaireLigne.fromJson).toList();
  }

  Future<Inventaire> creerBrouillon({
    required String exerciceId,
    required String depotId,
    required DateTime dateInventaire,
    String? notes,
  }) async {
    final ligne = await supabase
        .from('inventaire')
        .insert({
          'exercice_id': exerciceId,
          'depot_id': depotId,
          'date_inventaire': dateInventaire.toIso8601String().substring(0, 10),
          if (notes != null) 'notes': notes,
        })
        .select()
        .single();
    return Inventaire.fromJson(ligne);
  }

  /// Initialise les lignes de comptage à partir du stock théorique du dépôt.
  Future<void> initialiserLignesDepuisStock(String inventaireId, String depotId) async {
    final stock = await supabase.from('stock').select().eq('depot_id', depotId);
    if (stock.isEmpty) return;
    await supabase
        .from('inventaire_ligne')
        .insert([
          for (final s in stock)
            {
              'inventaire_id': inventaireId,
              'article_id': s['article_id'],
              if (s['variante_id'] != null) 'variante_id': s['variante_id'],
              'quantite_theorique': s['quantite'],
            },
        ]);
  }

  Future<void> saisirComptage(String ligneId, String quantiteComptee) async {
    await supabase.from('inventaire_ligne').update({'quantite_comptee': quantiteComptee}).eq('id', ligneId);
  }

  Future<Inventaire> rafraichir(String id) async {
    final ligne = await supabase.from('inventaire').select().eq('id', id).single();
    return Inventaire.fromJson(ligne);
  }

  Future<void> valider(String id) async {
    await supabase.from('inventaire').update({'statut': 'VALIDE'}).eq('id', id);
  }

  Future<void> annuler(String id) async {
    await supabase.from('inventaire').update({'statut': 'ANNULE'}).eq('id', id);
  }
}
