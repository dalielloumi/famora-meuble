import 'package:flutter/widgets.dart';

/// Seuil unique desktop / mobile (PROJET.md section 5) : au-delà de 900 px de
/// large, l'app bascule en mise en page desktop (NavigationRail, PlutoGrid).
/// En-dessous, mise en page mobile (BottomNavigationBar, listes de cartes).
abstract final class Breakpoints {
  static const double desktop = 900;

  static bool estDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktop;
}
