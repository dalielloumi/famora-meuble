import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/completer_profil_page.dart';
import '../../features/auth/connexion_page.dart';
import '../../features/achats/achats_page.dart';
import '../../features/atelier/atelier_page.dart';
import '../../features/finance/finance_page.dart';
import '../../features/parametres/parametres_page.dart';
import '../../features/parametres/tableau_bord_page.dart';
import '../../features/stock/stock_page.dart';
import '../../features/ventes/ventes_page.dart';
import '../../providers/auth_providers.dart';
import '../responsive/adaptive_scaffold.dart';
import '../supabase_client.dart';

// Atelier désactivé de la navigation (non utilisé pour l'instant côté
// métier) : le module et sa route restent en place, prêts à être réactivés
// en ajoutant une ligne ici — aucun code supprimé.
const _destinations = [
  DestinationNav(emoji: '🏠', label: 'Accueil'),
  DestinationNav(emoji: '🧾', label: 'Ventes'),
  DestinationNav(emoji: '📦', label: 'Achats'),
  DestinationNav(emoji: '🪑', label: 'Produits'),
  DestinationNav(emoji: '💰', label: 'Finance'),
  DestinationNav(emoji: '⚙️', label: 'Réglages'),
];

const _chemins = ['/', '/ventes', '/achats', '/stock', '/finance', '/parametres'];

/// Convertit un Stream en Listenable pour piloter les redirections de
/// go_router à chaque changement d'état d'authentification.
class _FluxRafraichissementRouteur extends ChangeNotifier {
  _FluxRafraichissementRouteur(Stream<dynamic> flux) {
    _abonnement = flux.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _abonnement;

  @override
  void dispose() {
    _abonnement.cancel();
    super.dispose();
  }
}

final routeurProvider = Provider<GoRouter>((ref) {
  final rafraichissement = _FluxRafraichissementRouteur(ref.watch(authRepositoryProvider).changementsEtat);
  ref.onDispose(rafraichissement.dispose);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: rafraichissement,
    redirect: (context, state) {
      final connecte = supabase.auth.currentSession != null;
      final surConnexion = state.matchedLocation == '/connexion';

      if (!connecte) return surConnexion ? null : '/connexion';
      if (surConnexion) return '/';
      return null;
    },
    routes: [
      GoRoute(path: '/connexion', builder: (context, state) => const ConnexionPage()),
      ShellRoute(
        builder: (context, state, enfant) => _CoquilleApp(enfant: enfant),
        routes: [
          GoRoute(path: '/', builder: (context, state) => const TableauBordPage()),
          GoRoute(path: '/ventes', builder: (context, state) => const VentesPage()),
          GoRoute(path: '/achats', builder: (context, state) => const AchatsPage()),
          GoRoute(path: '/stock', builder: (context, state) => const StockPage()),
          GoRoute(path: '/atelier', builder: (context, state) => const AtelierPage()),
          GoRoute(path: '/finance', builder: (context, state) => const FinancePage()),
          GoRoute(path: '/parametres', builder: (context, state) => const ParametresPage()),
        ],
      ),
    ],
  );
});

/// Enveloppe commune aux pages authentifiées : force le provisioning du
/// profil avant d'afficher la navigation (voir CompleterProfilPage).
class _CoquilleApp extends ConsumerWidget {
  const _CoquilleApp({required this.enfant});

  final Widget enfant;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profil = ref.watch(profilCourantProvider);

    return profil.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Erreur de chargement du profil : $e'))),
      data: (p) {
        if (p == null) return const CompleterProfilPage();

        final index = _chemins.indexWhere((c) => GoRouterState.of(context).matchedLocation == c);

        return AdaptiveScaffold(
          destinations: _destinations,
          indexSelectionne: index < 0 ? 0 : index,
          surSelection: (i) => context.go(_chemins[i]),
          enfant: enfant,
        );
      },
    );
  }
}
