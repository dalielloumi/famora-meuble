import 'dart:typed_data';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/supabase_client.dart';
import '../models/societe.dart';

class SocieteRepository {
  static const _bucket = 'logos';

  Future<Societe> charger() async {
    final ligne = await supabase.from('societe').select().single();
    return Societe.fromJson(ligne);
  }

  /// Téléverse (ou remplace) le logo de la société dans Supabase Storage
  /// (bucket privé, un dossier par entreprise — voir migrations 019 et
  /// 023_multi_tenant_stockage_logo.sql) et enregistre son chemin.
  Future<void> televerserLogo(Uint8List octets, {required String typeContenu}) async {
    final societeId = (await charger()).id;
    final chemin = '$societeId/logo';
    await supabase.storage
        .from(_bucket)
        .uploadBinary(chemin, octets, fileOptions: FileOptions(contentType: typeContenu, upsert: true));
    await supabase.from('societe').update({'logo_url': chemin}).eq('id', societeId);
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
