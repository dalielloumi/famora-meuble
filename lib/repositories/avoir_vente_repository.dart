import '../core/supabase_client.dart';
import '../models/avoir_vente.dart';
import '../models/ligne_saisie.dart';

class AvoirVenteRepository {
  Future<List<AvoirVente>> lister() async {
    final lignes = await supabase.from('avoir_vente').select().order('date_avoir', ascending: false);
    return lignes.map(AvoirVente.fromJson).toList();
  }

  Future<List<AvoirVenteLigne>> chargerLignes(String avoirId) async {
    final lignes = await supabase.from('avoir_vente_ligne').select().eq('avoir_id', avoirId).order('ordre');
    return lignes.map(AvoirVenteLigne.fromJson).toList();
  }

  Future<AvoirVente> creerBrouillon({
    required String exerciceId,
    required String clientId,
    required String factureVenteId,
    required String motif,
    required DateTime dateAvoir,
  }) async {
    final ligne = await supabase
        .from('avoir_vente')
        .insert({
          'exercice_id': exerciceId,
          'client_id': clientId,
          'facture_vente_id': factureVenteId,
          'motif': motif,
          'date_avoir': dateAvoir.toIso8601String().substring(0, 10),
        })
        .select()
        .single();
    return AvoirVente.fromJson(ligne);
  }

  Future<void> remplacerLignes(String avoirId, List<LigneSaisie> lignes) async {
    await supabase.from('avoir_vente_ligne').delete().eq('avoir_id', avoirId);
    if (lignes.isEmpty) return;
    await supabase
        .from('avoir_vente_ligne')
        .insert([
          for (var i = 0; i < lignes.length; i++)
            {
              'avoir_id': avoirId,
              'article_id': lignes[i].articleId,
              if (lignes[i].varianteId != null) 'variante_id': lignes[i].varianteId,
              'quantite': lignes[i].quantite.toString(),
              'prix_unitaire': lignes[i].prixUnitaire.toString(),
              'taux_tva_id': lignes[i].tauxTvaId,
              'ordre': i,
            },
        ]);
  }

  Future<AvoirVente> rafraichir(String id) async {
    final ligne = await supabase.from('avoir_vente').select().eq('id', id).single();
    return AvoirVente.fromJson(ligne);
  }

  Future<void> valider(String id) async {
    await supabase.from('avoir_vente').update({'statut': 'VALIDE'}).eq('id', id);
  }
}
