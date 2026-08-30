import '../core/supabase_client.dart';
import '../models/reglement.dart';

class ReglementRepository {
  Future<List<Reglement>> lister() async {
    final lignes = await supabase.from('reglement').select().order('date_reglement', ascending: false);
    return lignes.map(Reglement.fromJson).toList();
  }

  Future<List<Effet>> listerEffets() async {
    final lignes = await supabase.from('effet').select().order('date_echeance');
    return lignes.map(Effet.fromJson).toList();
  }

  /// Factures de vente encore dues pour un client (IMPAYE ou PARTIEL), pour
  /// affecter un encaissement.
  Future<List<Map<String, dynamic>>> facturesVenteDues(String clientId) async {
    return supabase
        .from('facture_vente')
        .select('id, numero, total_ttc, montant_regle, date_facture')
        .eq('client_id', clientId)
        .eq('statut', 'VALIDE')
        .neq('statut_paiement', 'SOLDE')
        .order('date_facture');
  }

  /// Factures d'achat encore dues pour un fournisseur, pour affecter un décaissement.
  Future<List<Map<String, dynamic>>> facturesAchatDues(String fournisseurId) async {
    return supabase
        .from('facture_achat')
        .select('id, numero, total_ttc, montant_regle, date_facture')
        .eq('fournisseur_id', fournisseurId)
        .eq('statut', 'VALIDE')
        .neq('statut_paiement', 'SOLDE')
        .order('date_facture');
  }

  Future<Reglement> creer({
    required String exerciceId,
    required String tiersId,
    required SensReglement sens,
    required ModeReglement mode,
    required String montant,
    required DateTime dateReglement,
    String? commandeClientId,
    String? reference,
    String? banque,
  }) async {
    final ligne = await supabase
        .from('reglement')
        .insert({
          'exercice_id': exerciceId,
          'tiers_id': tiersId,
          'sens': sens == SensReglement.encaissement ? 'ENCAISSEMENT' : 'DECAISSEMENT',
          'mode': _modeVersDb(mode),
          'montant': montant,
          'date_reglement': dateReglement.toIso8601String().substring(0, 10),
          if (commandeClientId != null) 'commande_client_id': commandeClientId,
          if (reference != null) 'reference': reference,
          if (banque != null) 'banque': banque,
        })
        .select()
        .single();
    return Reglement.fromJson(ligne);
  }

  String _modeVersDb(ModeReglement mode) => switch (mode) {
    ModeReglement.especes => 'ESPECES',
    ModeReglement.cheque => 'CHEQUE',
    ModeReglement.traite => 'TRAITE',
    ModeReglement.virement => 'VIREMENT',
    ModeReglement.carte => 'CARTE',
  };

  Future<void> affecter({
    required String reglementId,
    String? factureVenteId,
    String? factureAchatId,
    required String montant,
  }) async {
    await supabase.from('reglement_affectation').insert({
      'reglement_id': reglementId,
      if (factureVenteId != null) 'facture_vente_id': factureVenteId,
      if (factureAchatId != null) 'facture_achat_id': factureAchatId,
      'montant_affecte': montant,
    });
  }

  Future<void> creerEffet({
    required String reglementId,
    required String numeroEffet,
    required DateTime dateEcheance,
    required String montant,
    String? banque,
  }) async {
    await supabase.from('effet').insert({
      'reglement_id': reglementId,
      'numero_effet': numeroEffet,
      'date_echeance': dateEcheance.toIso8601String().substring(0, 10),
      'montant': montant,
      if (banque != null) 'banque': banque,
    });
  }

  Future<void> marquerEffetImpaye(String effetId) async {
    await supabase
        .from('effet')
        .update({'statut': 'IMPAYE', 'date_statut': DateTime.now().toIso8601String().substring(0, 10)})
        .eq('id', effetId);
  }

  Future<void> marquerEffetEncaisse(String effetId) async {
    await supabase
        .from('effet')
        .update({'statut': 'ENCAISSE', 'date_statut': DateTime.now().toIso8601String().substring(0, 10)})
        .eq('id', effetId);
  }
}
