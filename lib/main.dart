import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/router/app_router.dart';
import 'core/supabase_client.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_TN');
  await initialiserSupabase();
  runApp(const ProviderScope(child: GestionMeubleApp()));
}

class GestionMeubleApp extends ConsumerWidget {
  const GestionMeubleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeur = ref.watch(routeurProvider);

    return MaterialApp.router(
      title: 'Gestion Meuble',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.clair,
      locale: const Locale('fr'),
      supportedLocales: const [Locale('fr')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: routeur,
    );
  }
}
