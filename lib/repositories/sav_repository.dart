import 'package:decimal/decimal.dart';

import '../core/supabase_client.dart';
import '../models/sav.dart';

class SavRepository {
  Future<List<Sav>> lister() async {
    final lignes = await supabase.from('sav').select().order('date_ouverture', ascending: false);
    return lignes.map(Sav.fromJson).toList();
  }

  Future<List<SavIntervention>> chargerInterventions(String savId) async {
    final lignes = await supabase
        .from('sav_intervention')
        .select()
        .eq('sav_id', savId)
        .order('date_intervention', ascending: false);
    return lignes.map(SavIntervention.fromJson).toList();
  }

  Future<Sav> creer({
    required String clientId,
    String? articleId,
    required String descriptionProbleme,
    TypeInterventionSav? typeIntervention,
  }) async {
    final ligne = await supabase
        .from('sav')
        .insert({
          'client_id': clientId,
          if (articleId != null) 'article_id': articleId,
          'description_probleme': descriptionProbleme,
          if (typeIntervention != null) 'type_intervention': _typeVersDb(typeIntervention),
          'date_ouverture': DateTime.now().toIso8601String().substring(0, 10),
        })
        .select()
        .single();
    return Sav.fromJson(ligne);
  }

  String _typeVersDb(TypeInterventionSav t) => switch (t) {
    TypeInterventionSav.reparation => 'REPARATION',
    TypeInterventionSav.echange => 'ECHANGE',
    TypeInterventionSav.remboursement => 'REMBOURSEMENT',
  };

  Future<void> changerStatut(String savId, StatutSav statut) async {
    final valeur = switch (statut) {
      StatutSav.ouvert => 'OUVERT',
      StatutSav.enCours => 'EN_COURS',
      StatutSav.resolu => 'RESOLU',
      StatutSav.ferme => 'FERME',
    };
    await supabase
        .from('sav')
        .update({
          'statut': valeur,
          if (statut == StatutSav.ferme) 'date_cloture': DateTime.now().toIso8601String().substring(0, 10),
        })
        .eq('id', savId);
  }

  Future<void> ajouterIntervention(String savId, String description, String cout) async {
    await supabase.from('sav_intervention').insert({
      'sav_id': savId,
      'description': description,
      'cout': cout,
      'date_intervention': DateTime.now().toIso8601String().substring(0, 10),
    });
    // Le coût total du SAV est la somme des interventions.
    final interventions = await supabase.from('sav_intervention').select('cout').eq('sav_id', savId);
    final total = interventions.fold<Decimal>(
      Decimal.zero,
      (s, i) => s + Decimal.parse('${i['cout']}'),
    );
    await supabase.from('sav').update({'cout': total.toString()}).eq('id', savId);
  }
}
