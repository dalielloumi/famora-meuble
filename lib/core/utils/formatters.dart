import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

/// Formatage des montants et quantités. Locale fr_TN, 3 décimales (dinar
/// tunisien = millimes), jamais de double (PROJET.md section 2 et 4).
abstract final class Formatters {
  static final NumberFormat _montant = NumberFormat.decimalPatternDigits(
    locale: 'fr_TN',
    decimalDigits: 3,
  );

  static String montant(Decimal valeur, {String suffixe = ' TND'}) {
    return '${_montant.format(valeur.toDouble())}$suffixe';
  }

  static String quantite(Decimal valeur) => _montant.format(valeur.toDouble());

  static final DateFormat date = DateFormat('dd/MM/yyyy', 'fr_TN');
  static final DateFormat dateHeure = DateFormat('dd/MM/yyyy HH:mm', 'fr_TN');
}
