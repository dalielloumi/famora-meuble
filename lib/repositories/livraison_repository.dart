import '../core/supabase_client.dart';
import '../models/livraison.dart';

class LivraisonRepository {
  Future<List<TourneeLivraison>> lister() async {
    final lignes = await supabase.from('tournee_livraison').select().order('date_tournee', ascending: false);
    return lignes.map(TourneeLivraison.fromJson).toList();
  }

  Future<List<TourneeLivraisonLigne>> chargerLignes(String tourneeId) async {
    final lignes = await supabase
        .from('tournee_livraison_ligne')
        .select()
        .eq('tournee_id', tourneeId)
        .order('ordre');
    return lignes.map(TourneeLivraisonLigne.fromJson).toList();
  }

  Future<TourneeLivraison> creer({
    required DateTime dateTournee,
    String? chauffeur,
    String? vehicule,
  }) async {
    final ligne = await supabase
        .from('tournee_livraison')
        .insert({
          'date_tournee': dateTournee.toIso8601String().substring(0, 10),
          if (chauffeur != null) 'chauffeur': chauffeur,
          if (vehicule != null) 'vehicule': vehicule,
        })
        .select()
        .single();
    return TourneeLivraison.fromJson(ligne);
  }

  /// BL validés pas encore intégrés à une tournée.
  Future<List<Map<String, dynamic>>> blDisponibles() async {
    final tousLesBlEnTournee = await supabase.from('tournee_livraison_ligne').select('bl_id');
    final idsExclus = tousLesBlEnTournee.map((l) => l['bl_id'] as String).toList();

    var requete = supabase.from('bl').select('id, numero, client_id, date_bl').eq('statut', 'VALIDE');
    if (idsExclus.isNotEmpty) {
      requete = requete.not('id', 'in', '(${idsExclus.join(',')})');
    }
    return requete.order('date_bl');
  }

  Future<void> ajouterBl(String tourneeId, String blId, int ordre) async {
    await supabase.from('tournee_livraison_ligne').insert({
      'tournee_id': tourneeId,
      'bl_id': blId,
      'ordre': ordre,
    });
  }

  Future<void> marquerStatutLigne(String ligneId, StatutLivraisonLigne statut) async {
    await supabase
        .from('tournee_livraison_ligne')
        .update({'statut': statut == StatutLivraisonLigne.livree ? 'LIVREE' : 'ECHEC'})
        .eq('id', ligneId);
  }

  Future<void> changerStatutTournee(String tourneeId, StatutTournee statut) async {
    final valeur = switch (statut) {
      StatutTournee.prevue => 'PREVUE',
      StatutTournee.enCours => 'EN_COURS',
      StatutTournee.terminee => 'TERMINEE',
      StatutTournee.annulee => 'ANNULEE',
    };
    await supabase.from('tournee_livraison').update({'statut': valeur}).eq('id', tourneeId);
  }
}
