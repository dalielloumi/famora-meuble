import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/utilisateur_profil.dart';
import '../repositories/auth_repository.dart';
import '../repositories/utilisateur_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository());

final utilisateurRepositoryProvider = Provider<UtilisateurRepository>((ref) => UtilisateurRepository());

/// Flux des changements d'authentification (connexion, déconnexion, session
/// restaurée au démarrage). Le routeur (core/router/app_router.dart) l'écoute
/// pour rediriger vers /connexion ou vers l'accueil.
final etatAuthProvider = StreamProvider<AuthState>((ref) {
  return ref.watch(authRepositoryProvider).changementsEtat;
});

/// Profil applicatif (nom, rôle) de l'utilisateur connecté. `null` si connecté
/// mais pas encore provisionné (voir CompleterProfilPage).
final profilCourantProvider = FutureProvider<UtilisateurProfil?>((ref) async {
  final etat = ref.watch(etatAuthProvider).valueOrNull;
  final userId = etat?.session?.user.id ?? ref.read(authRepositoryProvider).utilisateurCourant?.id;
  if (userId == null) return null;
  return ref.watch(utilisateurRepositoryProvider).chargerProfil(userId);
});
