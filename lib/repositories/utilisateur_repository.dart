import '../core/supabase_client.dart';
import '../models/utilisateur_profil.dart';

/// Seul point d'accès à la table utilisateur_profil et à son provisioning.
class UtilisateurRepository {
  Future<UtilisateurProfil?> chargerProfil(String userId) async {
    final ligne = await supabase.from('utilisateur_profil').select().eq('id', userId).maybeSingle();

    if (ligne == null) return null;
    return UtilisateurProfil.fromJson(ligne);
  }

  /// À appeler une seule fois, à la première connexion d'un utilisateur dont
  /// le compte a été créé manuellement dans Supabase Auth. Crée sa société
  /// (espace isolé) et son profil ADMIN qui la dirige, avec des valeurs de
  /// référence de base (TVA, unités, dépôt, exercice, catégories). Voir la
  /// fonction provisionner_nouvelle_entreprise (migration
  /// 024_provisionnement_entreprise.sql).
  Future<void> provisionnerNouvelleEntreprise({
    required String userId,
    required String nom,
    required String prenom,
    required String raisonSociale,
    required String matriculeFiscal,
    required String adresse,
  }) async {
    await supabase.rpc(
      'provisionner_nouvelle_entreprise',
      params: {
        'p_user_id': userId,
        'p_nom': nom,
        'p_prenom': prenom,
        'p_raison_sociale': raisonSociale,
        'p_matricule_fiscal': matriculeFiscal,
        'p_adresse': adresse,
      },
    );
  }
}
