import 'dart:typed_data';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/supabase_client.dart';
import '../models/societe.dart';

class SocieteRepository {
  static const _bucket = 'logos';
  static const _chemin = 'logo';

  Future<Societe> charger() async {
    final ligne = await supabase.from('societe').select().single();
    return Societe.fromJson(ligne);
  }

  /// Téléverse (ou remplace) le logo de la société dans Supabase Storage
  /// (bucket privé, voir migration 019) et enregistre son chemin.
  Future<void> televerserLogo(Uint8List octets, {required String typeContenu}) async {
    await supabase.storage
        .from(_bucket)
        .uploadBinary(_chemin, octets, fileOptions: FileOptions(contentType: typeContenu, upsert: true));
    await supabase.from('societe').update({'logo_url': _chemin}).eq('id', true);
  }

  /// Télécharge les octets du logo pour l'aperçu ou l'inclusion dans un PDF.
  /// `null` si aucun logo n'a encore été téléversé.
  Future<Uint8List?> telechargerLogo(String? cheminLogo) async {
    if (cheminLogo == null) return null;
    try {
      return await supabase.storage.from(_bucket).download(cheminLogo);
    } catch (_) {
      return null;
    }
  }
}
