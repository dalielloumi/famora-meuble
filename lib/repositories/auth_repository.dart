import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/supabase_client.dart';

/// Authentification Supabase (email + mot de passe, compte créé par l'admin —
/// pas d'auto-inscription, voir PROJET.md section 3).
class AuthRepository {
  Stream<AuthState> get changementsEtat => supabase.auth.onAuthStateChange;

  User? get utilisateurCourant => supabase.auth.currentUser;

  Future<void> connecter({required String email, required String motDePasse}) async {
    await supabase.auth.signInWithPassword(email: email, password: motDePasse);
  }

  Future<void> deconnecter() async {
    await supabase.auth.signOut();
  }
}
