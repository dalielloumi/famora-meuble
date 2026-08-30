import 'package:decimal/decimal.dart';

/// Conversion d'un nombre entier ou d'un montant (Decimal, dinars.millimes)
/// en toutes lettres françaises, pour la mention « Arrêtée la présente
/// facture/devis à la somme de… » sur les PDF (section 2 de PROJET.md :
/// aucun calcul monétaire en double, jamais utilisé ici pour un calcul —
/// seulement pour un affichage textuel dérivé d'un Decimal déjà validé).
abstract final class NombreEnLettres {
  static const _unites = [
    'zéro', 'un', 'deux', 'trois', 'quatre', 'cinq', 'six', 'sept', 'huit', 'neuf',
    'dix', 'onze', 'douze', 'treize', 'quatorze', 'quinze', 'seize',
    'dix-sept', 'dix-huit', 'dix-neuf',
  ];

  static const _dizaines = {2: 'vingt', 3: 'trente', 4: 'quarante', 5: 'cinquante', 6: 'soixante'};

  static String _moinsDeCent(int n) {
    if (n < 20) return _unites[n];
    final dizaine = n ~/ 10;
    final unite = n % 10;

    if (dizaine == 7 || dizaine == 9) {
      final base = dizaine == 7 ? 'soixante' : 'quatre-vingt';
      if (dizaine == 7 && unite == 1) return 'soixante et onze';
      return '$base-${_unites[10 + unite]}';
    }
    if (dizaine == 8) {
      if (unite == 0) return 'quatre-vingts';
      return 'quatre-vingt-${_unites[unite]}';
    }

    final base = _dizaines[dizaine]!;
    if (unite == 0) return base;
    if (unite == 1) return '$base et un';
    return '$base-${_unites[unite]}';
  }

  static String _moinsDeMille(int n) {
    if (n < 100) return _moinsDeCent(n);
    final centaine = n ~/ 100;
    final reste = n % 100;
    final centaineMot = centaine == 1 ? 'cent' : '${_unites[centaine]} cent${reste == 0 ? 's' : ''}';
    if (reste == 0) return centaineMot;
    return '$centaineMot ${_moinsDeCent(reste)}';
  }

  /// Nombre entier positif en toutes lettres (0 à 999 999 999).
  static String depuisEntier(int n) {
    if (n == 0) return 'zéro';
    final millions = n ~/ 1000000;
    final milliers = (n ~/ 1000) % 1000;
    final unites = n % 1000;

    final parties = <String>[];
    if (millions > 0) {
      final mot = _moinsDeMille(millions);
      parties.add(millions == 1 ? '$mot million' : '$mot millions');
    }
    if (milliers > 0) {
      parties.add(milliers == 1 ? 'mille' : '${_moinsDeMille(milliers)} mille');
    }
    if (unites > 0 || parties.isEmpty) {
      parties.add(_moinsDeMille(unites));
    }
    return parties.join(' ');
  }

  static String _premiereMajuscule(String s) => s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';

  /// Montant (dinars.millimes, 3 décimales) en toutes lettres, pour la
  /// mention légale « Arrêtée la présente facture à la somme de… ».
  static String montant(Decimal valeur) {
    final abs = valeur.abs();
    final dinars = abs.truncate().toBigInt().toInt();
    final millimes = ((abs - abs.truncate()) * Decimal.fromInt(1000)).round(scale: 0).toBigInt().toInt();

    final texteDinars = '${_premiereMajuscule(depuisEntier(dinars))} dinar${dinars > 1 ? 's' : ''}';
    if (millimes == 0) return '$texteDinars.';

    final texteMillimes = '${depuisEntier(millimes)} millime${millimes > 1 ? 's' : ''}';
    return '$texteDinars $texteMillimes.';
  }
}
