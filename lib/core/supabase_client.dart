import 'package:supabase_flutter/supabase_flutter.dart';

/// Identifiants du projet Supabase, injectés à la compilation via
/// `--dart-define-from-file=env.json` (voir env.json.example à la racine).
/// Jamais codés en dur : ce fichier ne contient aucun secret.
abstract final class SupabaseConfig {
  static const String url = String.fromEnvironment('SUPABASE_URL');
  static const String publishableKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static bool get estConfigure => url.isNotEmpty && publishableKey.isNotEmpty;
}

Future<void> initialiserSupabase() async {
  await Supabase.initialize(url: SupabaseConfig.url, publishableKey: SupabaseConfig.publishableKey);
}

/// Accès au client Supabase depuis les repositories (seul endroit autorisé à
/// appeler Supabase, voir PROJET.md section 6).
SupabaseClient get supabase => Supabase.instance.client;
