import 'package:decimal/decimal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/supabase_client.dart';

class MoisActivite {
  const MoisActivite({required this.libelle, required this.total});

  final String libelle;
  final Decimal total;
}

class TableauBordStats {
  const TableauBordStats({
    required this.caMois,
    required this.montantImpaye,
    required this.nombreFacturesImpayees,
    required this.nombreFacturesMois,
    required this.nombreClients,
    required this.devisEnAttente,
    required this.commandesEnCours,
    required this.ofEnCours,
    required this.articlesEnAlerte,
    required this.activiteMensuelle,
  });

  final Decimal caMois;
  final Decimal montantImpaye;
  final int nombreFacturesImpayees;
  final int nombreFacturesMois;
  final int nombreClients;
  final int devisEnAttente;
  final int commandesEnCours;
  final int ofEnCours;
  final int articlesEnAlerte;
  final List<MoisActivite> activiteMensuelle;
}

const _moisFr = [
  'Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Jun', 'Jul', 'Aoû', 'Sep', 'Oct', 'Nov', 'Déc',
];

final tableauBordProvider = FutureProvider<TableauBordStats>((ref) async {
  final maintenant = DateTime.now();
  final debutMois = DateTime(maintenant.year, maintenant.month, 1).toIso8601String().substring(0, 10);
  final debutHistorique = DateTime(maintenant.year, maintenant.month - 5, 1).toIso8601String().substring(0, 10);

  final resultats = await Future.wait([
    supabase.from('facture_vente').select('total_ttc').eq('statut', 'VALIDE').gte('date_facture', debutMois),
    supabase
        .from('facture_vente')
        .select('total_ttc, montant_regle')
        .eq('statut', 'VALIDE')
        .neq('statut_paiement', 'SOLDE'),
    supabase.from('devis').select('id').eq('statut', 'BROUILLON'),
    supabase.from('commande_client').select('id').eq('statut', 'VALIDE'),
    supabase.from('ordre_fabrication').select('id').eq('statut', 'LANCE'),
    supabase.from('article').select('id, seuil_alerte, stock(quantite)').eq('actif', true).eq('gere_stock', true),
    supabase.from('tiers').select('id').eq('actif', true),
    supabase.from('facture_vente').select('total_ttc, date_facture').eq('statut', 'VALIDE').gte('date_facture', debutHistorique),
  ]);

  final facturesMois = resultats[0] as List;
  final caMois = facturesMois.fold<Decimal>(Decimal.zero, (s, f) => s + Decimal.parse('${f['total_ttc']}'));

  final facturesImpayees = resultats[1] as List;
  final montantImpaye = facturesImpayees.fold<Decimal>(
    Decimal.zero,
    (s, f) => s + (Decimal.parse('${f['total_ttc']}') - Decimal.parse('${f['montant_regle']}')),
  );

  final articles = resultats[5] as List;
  var articlesEnAlerte = 0;
  for (final a in articles) {
    final seuil = Decimal.parse('${a['seuil_alerte']}');
    final stockLignes = a['stock'] as List? ?? [];
    final quantiteTotale = stockLignes.fold<Decimal>(Decimal.zero, (s, l) => s + Decimal.parse('${l['quantite']}'));
    if (quantiteTotale <= seuil) articlesEnAlerte++;
  }

  final moisIndex = List.generate(6, (i) {
    final d = DateTime(maintenant.year, maintenant.month - 5 + i, 1);
    return (annee: d.year, mois: d.month);
  });
  final totauxParMois = {for (final m in moisIndex) m: Decimal.zero};
  for (final f in resultats[7] as List) {
    final date = DateTime.parse(f['date_facture'] as String);
    final cle = (annee: date.year, mois: date.month);
    if (totauxParMois.containsKey(cle)) {
      totauxParMois[cle] = totauxParMois[cle]! + Decimal.parse('${f['total_ttc']}');
    }
  }
  final activiteMensuelle = [
    for (final m in moisIndex) MoisActivite(libelle: _moisFr[m.mois - 1], total: totauxParMois[m]!),
  ];

  return TableauBordStats(
    caMois: caMois,
    montantImpaye: montantImpaye,
    nombreFacturesImpayees: facturesImpayees.length,
    nombreFacturesMois: facturesMois.length,
    nombreClients: (resultats[6] as List).length,
    devisEnAttente: (resultats[2] as List).length,
    commandesEnCours: (resultats[3] as List).length,
    ofEnCours: (resultats[4] as List).length,
    articlesEnAlerte: articlesEnAlerte,
    activiteMensuelle: activiteMensuelle,
  );
});
