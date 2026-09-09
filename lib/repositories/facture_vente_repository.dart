import '../core/supabase_client.dart';
import '../models/facture_vente.dart';
import '../models/ligne_saisie.dart';

class FactureVenteRepository {
  Future<List<FactureVente>> lister() async {
    final lignes = await supabase.from('facture_vente').select().order('date_facture', ascending: false);
    return lignes.map(FactureVente.fromJson).toList();
  }

  Future<List<FactureVenteLigne>> chargerLignes(String factureId) async {
    final lignes = await supabase.from('facture_vente_ligne').select().eq('facture_id', factureId).order('ordre');
    return lignes.map(FactureVenteLigne.fromJson).toList();
  }

  Future<FactureVente> creerBrouillon({
    required String exerciceId,
    required String clientId,
    String? blId,
    String? commandeClientId,
    required DateTime dateFacture,
    DateTime? dateEcheance,
    String fraisLivraison = '0',
    String? notes,
  }) async {
    final ligne = await supabase
        .from('facture_vente')
        .insert({
          'exercice_id': exerciceId,
          'client_id': clientId,
          if (blId != null) 'bl_id': blId,
          if (commandeClientId != null) 'commande_client_id': commandeClientId,
          'date_facture': dateFacture.toIso8601String().substring(0, 10),
          if (dateEcheance != null) 'date_echeance': dateEcheance.toIso8601String().substring(0, 10),
          'frais_livraison': fraisLivraison,
          if (notes != null) 'notes': notes,
        })
        .select()
        .single();
    return FactureVente.fromJson(ligne);
  }

  Future<void> remplacerLignes(String factureId, List<LigneSaisie> lignes) async {
    await supabase.from('facture_vente_ligne').delete().eq('facture_id', factureId);
    if (lignes.isEmpty) return;
    await supabase
        .from('facture_vente_ligne')
        .insert([
          for (var i = 0; i < lignes.length; i++)
            {
              'facture_id': factureId,
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

  /// Copie les lignes d'un BL validé vers une facture brouillon.
  Future<void> copierLignesDepuisBl(String factureId, String blId) async {
    final lignesBl = await supabase.from('bl_ligne').select().eq('bl_id', blId).order('ordre');
    if (lignesBl.isEmpty) return;
    await supabase
        .from('facture_vente_ligne')
        .insert([
          for (final l in lignesBl)
            {
              'facture_id': factureId,
              'bl_ligne_id': l['id'],
              'article_id': l['article_id'],
              if (l['variante_id'] != null) 'variante_id': l['variante_id'],
              'quantite': l['quantite'],
              'prix_unitaire': l['prix_unitaire'],
              'remise_pct': '0',
              'taux_tva_id': l['taux_tva_id'],
              'ordre': l['ordre'],
            },
        ]);
  }

  Future<void> modifierFraisLivraison(String id, String fraisLivraison) async {
    await supabase.from('facture_vente').update({'frais_livraison': fraisLivraison}).eq('id', id);
  }

  Future<FactureVente> rafraichir(String id) async {
    final ligne = await supabase.from('facture_vente').select().eq('id', id).single();
    return FactureVente.fromJson(ligne);
  }

  Future<void> valider(String id) async {
    await supabase.from('facture_vente').update({'statut': 'VALIDE'}).eq('id', id);
  }

  Future<void> annuler(String id) async {
    await supabase.from('facture_vente').update({'statut': 'ANNULE'}).eq('id', id);
  }

  /// Suppression définitive — uniquement pertinent pour un brouillon (jamais
  /// numéroté). Une facture validée doit être annulée, pas supprimée.
  Future<void> supprimer(String id) async {
    await supabase.from('facture_vente').delete().eq('id', id);
  }
}
