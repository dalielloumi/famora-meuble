import '../core/supabase_client.dart';
import '../models/devis.dart';
import '../models/ligne_saisie.dart';

class DevisRepository {
  Future<List<Devis>> lister() async {
    final lignes = await supabase.from('devis').select().order('date_devis', ascending: false);
    return lignes.map(Devis.fromJson).toList();
  }

  Future<List<DevisLigne>> chargerLignes(String devisId) async {
    final lignes = await supabase.from('devis_ligne').select().eq('devis_id', devisId).order('ordre');
    return lignes.map(DevisLigne.fromJson).toList();
  }

  Future<Devis> creerBrouillon({
    required String exerciceId,
    required String clientId,
    required DateTime dateDevis,
    DateTime? dateValidite,
    String? notes,
  }) async {
    final ligne = await supabase
        .from('devis')
        .insert({
          'exercice_id': exerciceId,
          'client_id': clientId,
          'date_devis': dateDevis.toIso8601String().substring(0, 10),
          if (dateValidite != null) 'date_validite': dateValidite.toIso8601String().substring(0, 10),
          if (notes != null) 'notes': notes,
        })
        .select()
        .single();
    return Devis.fromJson(ligne);
  }

  Future<void> modifierEntete({
    required String id,
    required String clientId,
    required DateTime dateDevis,
    DateTime? dateValidite,
    String? notes,
  }) async {
    await supabase
        .from('devis')
        .update({
          'client_id': clientId,
          'date_devis': dateDevis.toIso8601String().substring(0, 10),
          'date_validite': dateValidite?.toIso8601String().substring(0, 10),
          'notes': notes,
        })
        .eq('id', id);
  }

  /// Remplace intégralement les lignes (le document est encore BROUILLON,
  /// donc librement modifiable — voir la règle d'immuabilité, section 4).
  Future<void> remplacerLignes(String devisId, List<LigneSaisie> lignes) async {
    await supabase.from('devis_ligne').delete().eq('devis_id', devisId);
    if (lignes.isEmpty) return;
    await supabase
        .from('devis_ligne')
        .insert([
          for (var i = 0; i < lignes.length; i++)
            {
              'devis_id': devisId,
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

  Future<Devis> rafraichir(String id) async {
    final ligne = await supabase.from('devis').select().eq('id', id).single();
    return Devis.fromJson(ligne);
  }

  Future<void> valider(String id) async {
    await supabase.from('devis').update({'statut': 'VALIDE'}).eq('id', id);
  }

  Future<void> annuler(String id) async {
    await supabase.from('devis').update({'statut': 'ANNULE'}).eq('id', id);
  }
}
