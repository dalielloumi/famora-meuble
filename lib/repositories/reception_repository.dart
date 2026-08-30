import '../core/supabase_client.dart';
import '../models/ligne_saisie.dart';
import '../models/reception.dart';

class ReceptionRepository {
  Future<List<Reception>> lister() async {
    final lignes = await supabase.from('reception').select().order('date_reception', ascending: false);
    return lignes.map(Reception.fromJson).toList();
  }

  Future<List<ReceptionLigne>> chargerLignes(String receptionId) async {
    final lignes = await supabase.from('reception_ligne').select().eq('reception_id', receptionId).order('ordre');
    return lignes.map(ReceptionLigne.fromJson).toList();
  }

  Future<Reception> creerBrouillon({
    required String exerciceId,
    String? commandeFournisseurId,
    required String fournisseurId,
    required String depotId,
    required DateTime dateReception,
    String? notes,
  }) async {
    final ligne = await supabase
        .from('reception')
        .insert({
          'exercice_id': exerciceId,
          if (commandeFournisseurId != null) 'commande_fournisseur_id': commandeFournisseurId,
          'fournisseur_id': fournisseurId,
          'depot_id': depotId,
          'date_reception': dateReception.toIso8601String().substring(0, 10),
          if (notes != null) 'notes': notes,
        })
        .select()
        .single();
    return Reception.fromJson(ligne);
  }

  /// Copie les lignes non encore reçues d'une commande fournisseur vers une réception brouillon.
  Future<void> copierLignesDepuisCommande(String receptionId, String commandeId) async {
    final lignesCommande = await supabase
        .from('commande_fournisseur_ligne')
        .select()
        .eq('commande_id', commandeId)
        .order('ordre');

    final aRecevoir = lignesCommande.where((l) {
      final quantite = num.parse('${l['quantite']}');
      final recue = num.parse('${l['quantite_recue']}');
      return quantite > recue;
    }).toList();

    if (aRecevoir.isEmpty) return;

    await supabase
        .from('reception_ligne')
        .insert([
          for (final l in aRecevoir)
            {
              'reception_id': receptionId,
              'commande_ligne_id': l['id'],
              'article_id': l['article_id'],
              if (l['variante_id'] != null) 'variante_id': l['variante_id'],
              'quantite': (num.parse('${l['quantite']}') - num.parse('${l['quantite_recue']}')).toString(),
              'prix_unitaire': l['prix_unitaire'],
              'ordre': l['ordre'],
            },
        ]);
  }

  /// Synchronise les lignes (réception encore BROUILLON) : met à jour les
  /// lignes existantes (préserve leur lien commande_ligne_id), insère les
  /// nouvelles, supprime celles retirées. Ne fait jamais un delete-all suivi
  /// d'un insert, ce qui casserait le lien vers la ligne de commande d'origine.
  Future<void> remplacerLignes(String receptionId, List<LigneSaisie> lignes) async {
    final existantes = await supabase.from('reception_ligne').select('id').eq('reception_id', receptionId);
    final idsExistants = existantes.map((l) => l['id'] as String).toSet();
    final idsConserves = lignes.where((l) => l.id != null).map((l) => l.id!).toSet();

    final idsASupprimer = idsExistants.difference(idsConserves);
    if (idsASupprimer.isNotEmpty) {
      await supabase.from('reception_ligne').delete().inFilter('id', idsASupprimer.toList());
    }

    for (var i = 0; i < lignes.length; i++) {
      final l = lignes[i];
      final donnees = {
        'article_id': l.articleId,
        if (l.varianteId != null) 'variante_id': l.varianteId,
        'quantite': l.quantite.toString(),
        'prix_unitaire': l.prixUnitaire.toString(),
        'ordre': i,
      };

      if (l.id != null) {
        await supabase.from('reception_ligne').update(donnees).eq('id', l.id!);
      } else {
        await supabase.from('reception_ligne').insert({'reception_id': receptionId, ...donnees});
      }
    }
  }

  Future<Reception> rafraichir(String id) async {
    final ligne = await supabase.from('reception').select().eq('id', id).single();
    return Reception.fromJson(ligne);
  }

  Future<void> valider(String id) async {
    await supabase.from('reception').update({'statut': 'VALIDE'}).eq('id', id);
  }

  Future<void> annuler(String id) async {
    await supabase.from('reception').update({'statut': 'ANNULE'}).eq('id', id);
  }
}
