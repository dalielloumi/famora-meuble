import '../core/supabase_client.dart';
import '../models/avoir_achat.dart';
import '../models/ligne_saisie.dart';

class AvoirAchatRepository {
  Future<List<AvoirAchat>> lister() async {
    final lignes = await supabase.from('avoir_achat').select().order('date_avoir', ascending: false);
    return lignes.map(AvoirAchat.fromJson).toList();
  }

  Future<List<AvoirAchatLigne>> chargerLignes(String avoirId) async {
    final lignes = await supabase.from('avoir_achat_ligne').select().eq('avoir_id', avoirId).order('ordre');
    return lignes.map(AvoirAchatLigne.fromJson).toList();
  }

  Future<AvoirAchat> creerBrouillon({
    required String exerciceId,
    required String fournisseurId,
    required String factureAchatId,
    required String motif,
    required DateTime dateAvoir,
  }) async {
    final ligne = await supabase
        .from('avoir_achat')
        .insert({
          'exercice_id': exerciceId,
          'fournisseur_id': fournisseurId,
          'facture_achat_id': factureAchatId,
          'motif': motif,
          'date_avoir': dateAvoir.toIso8601String().substring(0, 10),
        })
        .select()
        .single();
    return AvoirAchat.fromJson(ligne);
  }

  Future<void> remplacerLignes(String avoirId, List<LigneSaisie> lignes) async {
    await supabase.from('avoir_achat_ligne').delete().eq('avoir_id', avoirId);
    if (lignes.isEmpty) return;
    await supabase
        .from('avoir_achat_ligne')
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

  Future<AvoirAchat> rafraichir(String id) async {
    final ligne = await supabase.from('avoir_achat').select().eq('id', id).single();
    return AvoirAchat.fromJson(ligne);
  }

  Future<void> valider(String id) async {
    await supabase.from('avoir_achat').update({'statut': 'VALIDE'}).eq('id', id);
  }
}
