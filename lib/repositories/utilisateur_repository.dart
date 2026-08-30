import '../core/supabase_client.dart';
import '../models/utilisateur_profil.dart';

/// Seul point d'accès à la table utilisateur_profil et à son provisioning.
class UtilisateurRepository {
  Future<UtilisateurProfil?> chargerProfil(String userId) async {
    final ligne = await supabase.from('utilisateur_profil').select().eq('id', userId).maybeSingle();

    if (ligne == null) return null;
    return UtilisateurProfil.fromJson(ligne);
  }

  /// À appeler une seule fois, juste après la création du compte dans
  /// Supabase Auth, pour créer le profil applicatif correspondant (rôle
  /// ADMIN). Voir la fonction app.provisionner_utilisateur_admin (migration
  /// 013_seed.sql).
  Future<void> provisionnerAdmin({required String userId, required String nom, required String prenom}) async {
    await supabase.rpc(
      'provisionner_utilisateur_admin',
      params: {'p_user_id': userId, 'p_nom': nom, 'p_prenom': prenom},
    );
  }
}
