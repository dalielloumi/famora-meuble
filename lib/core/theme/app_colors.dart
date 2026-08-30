import 'package:flutter/material.dart';

/// Palette unique de l'application — identité FAMORA MEUBLE (vert forêt +
/// doré). Aucune couleur ne doit être écrite en dur ailleurs dans le code :
/// passer systématiquement par ces constantes ou par le [ThemeData].
abstract final class AppColors {
  // Vert forêt — couleur de marque principale (en-têtes, actions primaires).
  static const Color accent = Color(0xFF2C4A1E);
  static const Color accentFonce = Color(0xFF3D6429);
  static const Color accentClair = Color(0xFF5A8A3C);

  // Doré — mise en avant (FAB, liens, accents ponctuels).
  static const Color or = Color(0xFFC9952A);
  static const Color orClair = Color(0xFFE8B84B);
  static const Color orPale = Color(0xFFFDF3DC);

  // Fond crème et surfaces.
  static const Color fond = Color(0xFFFAF7F2);
  static const Color fondFonce = Color(0xFFF0EBE1);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color bordure = Color(0xFFDDD8CC);

  static const Color texte = Color(0xFF1A1A12);
  static const Color texteMoyen = Color(0xFF4A4A38);
  static const Color texteAttenue = Color(0xFF8A8A72);

  static const Color alerte = Color(0xFFB83232);
  static const Color alertePale = Color(0xFFFDE8E8);
  static const Color succes = Color(0xFF2E7D52);
  static const Color succesPale = Color(0xFFE3F5EC);
  static const Color attente = Color(0xFFC97A2A);
  static const Color attentePale = Color(0xFFFEF3E2);
  static const Color info = Color(0xFF2A5C8A);
  static const Color infoPale = Color(0xFFE3EEF8);

  /// Gris neutre utilisé pour l'état "brouillon" de la [StatutBar].
  static const Color brouillon = Color(0xFF8A8A72);
}
