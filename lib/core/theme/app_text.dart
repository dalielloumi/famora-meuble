import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Styles de texte partagés. Cormorant Garamond (serif) pour les titres et
/// montants mis en avant — identité FAMORA MEUBLE ; Outfit (sans-serif) pour
/// le corps de texte et les formulaires. [montant] doit être utilisé pour
/// tout montant ou toute quantité dans un tableau dense (chiffres
/// tabulaires — fontFeatures tabularFigures, sinon une colonne de chiffres
/// devient illisible, voir PROJET.md section 5) ; [montantVitrine] pour un
/// montant mis en avant hors tableau (carte, en-tête, tableau de bord).
abstract final class AppText {
  static TextStyle get base => GoogleFonts.outfit(color: AppColors.texte);
  static TextStyle get affichage => GoogleFonts.cormorantGaramond(color: AppColors.texte);

  static TextStyle get titre => affichage.copyWith(fontSize: 22, fontWeight: FontWeight.w700);

  static TextStyle get sousTitre => affichage.copyWith(fontSize: 17, fontWeight: FontWeight.w600);

  static TextStyle get corps => base.copyWith(fontSize: 13);

  static TextStyle get libelleChamp => base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
    color: AppColors.texteAttenue,
  );

  static TextStyle get montant => base.copyWith(fontSize: 13, fontFeatures: const [FontFeature.tabularFigures()]);

  static TextStyle get montantAccent => montant.copyWith(fontWeight: FontWeight.w600, color: AppColors.accent);

  static TextStyle get montantVitrine => affichage.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    fontFeatures: const [FontFeature.tabularFigures()],
  );
}
