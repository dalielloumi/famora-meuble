import '../core/supabase_client.dart';
import '../models/commande_client.dart';
import '../models/ligne_saisie.dart';

class CommandeClientRepository {
  Future<List<CommandeClient>> lister() async {
    final lignes = await supabase.from('commande_client').select().order('date_commande', ascending: false);
    return lignes.map(CommandeClient.fromJson).toList();
  }

  Future<List<CommandeClientLigne>> chargerLignes(String commandeId) async {
    final lignes = await supabase.from('commande_client_ligne').select().eq('commande_id', commandeId).order('ordre');
    return lignes.map(CommandeClientLigne.fromJson).toList();
  }

  Future<CommandeClient> creerBrouillon({
    required String exerciceId,
    required String clientId,
    String? devisId,
    required DateTime dateCommande,
    DateTime? dateLivraisonPrevue,
    String? notes,
  }) async {
    final ligne = await supabase
        .from('commande_client')
        .insert({
          'exercice_id': exerciceId,
          'client_id': clientId,
          if (devisId != null) 'devis_id': devisId,
          'date_commande': dateCommande.toIso8601String().substring(0, 10),
          if (dateLivraisonPrevue != null)
            'date_livraison_prevue': dateLivraisonPrevue.toIso8601String().substring(0, 10),
          if (notes != null) 'notes': notes,
        })
        .select()
        .single();
    return CommandeClient.fromJson(ligne);
  }

  Future<void> remplacerLignes(String commandeId, List<LigneSaisie> lignes) async {
    await supabase.from('commande_client_ligne').delete().eq('commande_id', commandeId);
    if (lignes.isEmpty) return;
    await supabase
        .from('commande_client_ligne')
        .insert([
          for (var i = 0; i < lignes.length; i++)
            {
              'commande_id': commandeId,
              'article_id': lignes[i].articleId,
              if (lignes[i].varianteId != null) 'variante_id': lignes[i].varianteId,
              'quantite': lignes[i].quantite.toString(),
              'prix_unitaire': lignes[i].prixUnitaire.toString(),
              'remise_pct': lignes[i].remisePct.toString(),
              'taux_tva_id': lignes[i].tauxTvaId,
              'ordre': i,
            },
        ]);
  }

  /// Copie les lignes d'un devis validé vers une commande brouillon.
  Future<void> copierLignesDepuisDevis(String commandeId, String devisId) async {
    final lignesDevis = await supabase.from('devis_ligne').select().eq('devis_id', devisId).order('ordre');
    if (lignesDevis.isEmpty) return;
    await supabase
        .from('commande_client_ligne')
        .insert([
          for (final l in lignesDevis)
            {
              'commande_id': commandeId,
              'article_id': l['article_id'],
              if (l['variante_id'] != null) 'variante_id': l['variante_id'],
              'quantite': l['quantite'],
              'prix_unitaire': l['prix_unitaire'],
              'remise_pct': l['remise_pct'],
              'taux_tva_id': l['taux_tva_id'],
              'ordre': l['ordre'],
            },
        ]);
  }

  Future<CommandeClient> rafraichir(String id) async {
    final ligne = await supabase.from('commande_client').select().eq('id', id).single();
    return CommandeClient.fromJson(ligne);
  }

  Future<void> valider(String id) async {
    await supabase.from('commande_client').update({'statut': 'VALIDE'}).eq('id', id);
  }

  Future<void> annuler(String id) async {
    await supabase.from('commande_client').update({'statut': 'ANNULE'}).eq('id', id);
  }

  /// Suppression définitive — uniquement pertinent pour un brouillon (jamais
  /// numéroté). Une commande validée doit être annulée, pas supprimée.
  Future<void> supprimer(String id) async {
    await supabase.from('commande_client').delete().eq('id', id);
  }
}
