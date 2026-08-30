import '../core/supabase_client.dart';
import '../models/facture_achat.dart';
import '../models/ligne_saisie.dart';

class FactureAchatRepository {
  Future<List<FactureAchat>> lister() async {
    final lignes = await supabase.from('facture_achat').select().order('date_facture', ascending: false);
    return lignes.map(FactureAchat.fromJson).toList();
  }

  Future<List<FactureAchatLigne>> chargerLignes(String factureId) async {
    final lignes = await supabase.from('facture_achat_ligne').select().eq('facture_id', factureId).order('ordre');
    return lignes.map(FactureAchatLigne.fromJson).toList();
  }

  Future<FactureAchat> creerBrouillon({
    required String exerciceId,
    required String fournisseurId,
    String? receptionId,
    String? numeroFactureFournisseur,
    required DateTime dateFacture,
    DateTime? dateEcheance,
    String timbreFiscal = '1',
    String? notes,
  }) async {
    final ligne = await supabase
        .from('facture_achat')
        .insert({
          'exercice_id': exerciceId,
          'fournisseur_id': fournisseurId,
          if (receptionId != null) 'reception_id': receptionId,
          if (numeroFactureFournisseur != null) 'numero_facture_fournisseur': numeroFactureFournisseur,
          'date_facture': dateFacture.toIso8601String().substring(0, 10),
          if (dateEcheance != null) 'date_echeance': dateEcheance.toIso8601String().substring(0, 10),
          'timbre_fiscal': timbreFiscal,
          if (notes != null) 'notes': notes,
        })
        .select()
        .single();
    return FactureAchat.fromJson(ligne);
  }

  Future<void> remplacerLignes(String factureId, List<LigneSaisie> lignes) async {
    await supabase.from('facture_achat_ligne').delete().eq('facture_id', factureId);
    if (lignes.isEmpty) return;
    await supabase
        .from('facture_achat_ligne')
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

  /// Copie les lignes d'une réception validée vers une facture d'achat brouillon.
  Future<void> copierLignesDepuisReception(String factureId, String receptionId) async {
    final lignesReception = await supabase
        .from('reception_ligne')
        .select()
        .eq('reception_id', receptionId)
        .order('ordre');
    if (lignesReception.isEmpty) return;

    final articles = await supabase.from('article').select('id, taux_tva_id');
    final tauxTvaParArticle = {for (final a in articles) a['id'] as String: a['taux_tva_id'] as String};

    await supabase
        .from('facture_achat_ligne')
        .insert([
          for (final l in lignesReception)
            {
              'facture_id': factureId,
              'reception_ligne_id': l['id'],
              'article_id': l['article_id'],
              if (l['variante_id'] != null) 'variante_id': l['variante_id'],
              'quantite': l['quantite'],
              'prix_unitaire': l['prix_unitaire'],
              'remise_pct': '0',
              'taux_tva_id': tauxTvaParArticle[l['article_id']],
              'ordre': l['ordre'],
            },
        ]);
  }

  Future<FactureAchat> rafraichir(String id) async {
    final ligne = await supabase.from('facture_achat').select().eq('id', id).single();
    return FactureAchat.fromJson(ligne);
  }

  Future<void> valider(String id) async {
    await supabase.from('facture_achat').update({'statut': 'VALIDE'}).eq('id', id);
  }

  Future<void> annuler(String id) async {
    await supabase.from('facture_achat').update({'statut': 'ANNULE'}).eq('id', id);
  }
}
