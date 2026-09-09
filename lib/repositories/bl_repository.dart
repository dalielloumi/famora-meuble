import '../core/supabase_client.dart';
import '../models/bl.dart';
import '../models/ligne_saisie.dart';

class BlRepository {
  Future<List<Bl>> lister() async {
    final lignes = await supabase.from('bl').select().order('date_bl', ascending: false);
    return lignes.map(Bl.fromJson).toList();
  }

  Future<List<BlLigne>> chargerLignes(String blId) async {
    final lignes = await supabase.from('bl_ligne').select().eq('bl_id', blId).order('ordre');
    return lignes.map(BlLigne.fromJson).toList();
  }

  Future<Bl> creerBrouillon({
    required String exerciceId,
    required String clientId,
    String? commandeClientId,
    required String depotId,
    required DateTime dateBl,
    String? adresseLivraison,
    String? notes,
  }) async {
    final ligne = await supabase
        .from('bl')
        .insert({
          'exercice_id': exerciceId,
          'client_id': clientId,
          if (commandeClientId != null) 'commande_client_id': commandeClientId,
          'depot_id': depotId,
          'date_bl': dateBl.toIso8601String().substring(0, 10),
          if (adresseLivraison != null) 'adresse_livraison': adresseLivraison,
          if (notes != null) 'notes': notes,
        })
        .select()
        .single();
    return Bl.fromJson(ligne);
  }

  /// Copie les lignes non encore livrées d'une commande client vers un BL brouillon.
  Future<void> copierLignesDepuisCommande(String blId, String commandeId) async {
    final lignesCommande = await supabase
        .from('commande_client_ligne')
        .select()
        .eq('commande_id', commandeId)
        .order('ordre');

    final aLivrer = lignesCommande.where((l) {
      final quantite = num.parse('${l['quantite']}');
      final livree = num.parse('${l['quantite_livree']}');
      return quantite > livree;
    }).toList();

    if (aLivrer.isEmpty) return;

    await supabase
        .from('bl_ligne')
        .insert([
          for (final l in aLivrer)
            {
              'bl_id': blId,
              'commande_ligne_id': l['id'],
              'article_id': l['article_id'],
              if (l['variante_id'] != null) 'variante_id': l['variante_id'],
              'quantite': (num.parse('${l['quantite']}') - num.parse('${l['quantite_livree']}')).toString(),
              'prix_unitaire': l['prix_unitaire'],
              'taux_tva_id': l['taux_tva_id'],
              'ordre': l['ordre'],
            },
        ]);
  }

  /// Synchronise les lignes (BL encore BROUILLON) : met à jour les lignes
  /// existantes (préserve leur lien commande_ligne_id), insère les
  /// nouvelles, supprime celles retirées.
  Future<void> remplacerLignes(String blId, List<LigneSaisie> lignes) async {
    final existantes = await supabase.from('bl_ligne').select('id').eq('bl_id', blId);
    final idsExistants = existantes.map((l) => l['id'] as String).toSet();
    final idsConserves = lignes.where((l) => l.id != null).map((l) => l.id!).toSet();

    final idsASupprimer = idsExistants.difference(idsConserves);
    if (idsASupprimer.isNotEmpty) {
      await supabase.from('bl_ligne').delete().inFilter('id', idsASupprimer.toList());
    }

    for (var i = 0; i < lignes.length; i++) {
      final l = lignes[i];
      final donnees = {
        'article_id': l.articleId,
        if (l.varianteId != null) 'variante_id': l.varianteId,
        'quantite': l.quantite.toString(),
        'prix_unitaire': l.prixUnitaire.toString(),
        'taux_tva_id': l.tauxTvaId,
        'ordre': i,
      };

      if (l.id != null) {
        await supabase.from('bl_ligne').update(donnees).eq('id', l.id!);
      } else {
        await supabase.from('bl_ligne').insert({'bl_id': blId, ...donnees});
      }
    }
  }

  Future<Bl> rafraichir(String id) async {
    final ligne = await supabase.from('bl').select().eq('id', id).single();
    return Bl.fromJson(ligne);
  }

  Future<void> valider(String id) async {
    await supabase.from('bl').update({'statut': 'VALIDE'}).eq('id', id);
  }

  Future<void> annuler(String id) async {
    await supabase.from('bl').update({'statut': 'ANNULE'}).eq('id', id);
  }

  /// Suppression définitive — uniquement pertinent pour un brouillon (jamais
  /// numéroté). Un BL validé doit être annulé, pas supprimé.
  Future<void> supprimer(String id) async {
    await supabase.from('bl').delete().eq('id', id);
  }
}
