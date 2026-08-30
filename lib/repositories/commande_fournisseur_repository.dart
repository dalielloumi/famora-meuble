import '../core/supabase_client.dart';
import '../models/commande_fournisseur.dart';
import '../models/ligne_saisie.dart';

class CommandeFournisseurRepository {
  Future<List<CommandeFournisseur>> lister() async {
    final lignes = await supabase.from('commande_fournisseur').select().order('date_commande', ascending: false);
    return lignes.map(CommandeFournisseur.fromJson).toList();
  }

  Future<List<CommandeFournisseurLigne>> chargerLignes(String commandeId) async {
    final lignes = await supabase
        .from('commande_fournisseur_ligne')
        .select()
        .eq('commande_id', commandeId)
        .order('ordre');
    return lignes.map(CommandeFournisseurLigne.fromJson).toList();
  }

  Future<CommandeFournisseur> creerBrouillon({
    required String exerciceId,
    required String fournisseurId,
    required String depotId,
    required DateTime dateCommande,
    DateTime? dateLivraisonPrevue,
    String? notes,
  }) async {
    final ligne = await supabase
        .from('commande_fournisseur')
        .insert({
          'exercice_id': exerciceId,
          'fournisseur_id': fournisseurId,
          'depot_id': depotId,
          'date_commande': dateCommande.toIso8601String().substring(0, 10),
          if (dateLivraisonPrevue != null)
            'date_livraison_prevue': dateLivraisonPrevue.toIso8601String().substring(0, 10),
          if (notes != null) 'notes': notes,
        })
        .select()
        .single();
    return CommandeFournisseur.fromJson(ligne);
  }

  Future<void> remplacerLignes(String commandeId, List<LigneSaisie> lignes) async {
    await supabase.from('commande_fournisseur_ligne').delete().eq('commande_id', commandeId);
    if (lignes.isEmpty) return;
    await supabase
        .from('commande_fournisseur_ligne')
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

  Future<CommandeFournisseur> rafraichir(String id) async {
    final ligne = await supabase.from('commande_fournisseur').select().eq('id', id).single();
    return CommandeFournisseur.fromJson(ligne);
  }

  Future<void> valider(String id) async {
    await supabase.from('commande_fournisseur').update({'statut': 'VALIDE'}).eq('id', id);
  }

  Future<void> annuler(String id) async {
    await supabase.from('commande_fournisseur').update({'statut': 'ANNULE'}).eq('id', id);
  }
}
