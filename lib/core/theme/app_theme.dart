import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text.dart';

/// Thème unique de l'application — identité visuelle FAMORA MEUBLE (vert
/// forêt + doré, cartes arrondies, coins doux). Le web/desktop garde sa
/// densité (grilles PlutoGrid 36 px, NavigationRail) : seule la palette et
/// la typographie changent, jamais la structure des écrans desktop.
abstract final class AppTheme {
  static const double dureeTransition = 150;
  static const double hauteurLigneGrille = 36;
  static const double rayon = 16;
  static const double rayonPetit = 10;

  static ThemeData get clair {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.accent,
      brightness: Brightness.light,
      primary: AppColors.accent,
      secondary: AppColors.or,
      error: AppColors.alerte,
      surface: AppColors.surface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.fond,
      visualDensity: VisualDensity.compact,
      splashFactory: NoSplash.splashFactory,
      textTheme: TextTheme(
        titleLarge: AppText.titre,
        titleMedium: AppText.sousTitre,
        bodyMedium: AppText.corps,
        labelMedium: AppText.libelleChamp,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.texte,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppText.titre,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 1,
        shadowColor: AppColors.accent.withValues(alpha: 0.12),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(rayon),
          side: const BorderSide(color: AppColors.bordure),
        ),
      ),
      dividerTheme: const DividerThemeData(color: AppColors.bordure, space: 1),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        filled: true,
        fillColor: AppColors.fond,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(rayonPetit),
          borderSide: const BorderSide(color: AppColors.bordure, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(rayonPetit),
          borderSide: const BorderSide(color: AppColors.bordure, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(rayonPetit),
          borderSide: const BorderSide(color: AppColors.accentClair, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(rayonPetit),
          borderSide: const BorderSide(color: AppColors.alerte),
        ),
        labelStyle: AppText.libelleChamp,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          elevation: 0,
          visualDensity: VisualDensity.compact,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: AppText.corps.copyWith(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rayonPetit)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: AppText.corps.copyWith(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rayonPetit)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.accent,
          side: const BorderSide(color: AppColors.accent, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: AppText.corps.copyWith(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rayonPetit)),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColors.surface,
        selectedIconTheme: const IconThemeData(color: AppColors.accent),
        selectedLabelTextStyle: AppText.corps.copyWith(color: AppColors.accent, fontWeight: FontWeight.w600),
        unselectedLabelTextStyle: AppText.corps,
        useIndicator: true,
        indicatorColor: AppColors.accent.withValues(alpha: 0.1),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.accent.withValues(alpha: 0.12),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => AppText.corps.copyWith(
            fontSize: 10.5,
            fontWeight: states.contains(WidgetState.selected) ? FontWeight.w600 : FontWeight.w500,
            color: states.contains(WidgetState.selected) ? AppColors.accent : AppColors.texteAttenue,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected) ? AppColors.accent : AppColors.texteAttenue,
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.accent,
        contentTextStyle: AppText.corps.copyWith(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rayonPetit)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.accent,
        side: const BorderSide(color: AppColors.bordure, width: 1.5),
        labelStyle: AppText.corps.copyWith(fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.or,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
