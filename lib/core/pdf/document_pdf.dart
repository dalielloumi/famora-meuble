import 'dart:typed_data';

import 'package:decimal/decimal.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../models/ligne_saisie.dart';
import '../../models/societe.dart';
import '../utils/formatters.dart';
import '../utils/nombre_en_lettres.dart';

/// Génération de PDF pour les documents de vente (devis, factures…). Jamais
/// stocké côté serveur : régénéré à la demande depuis les données (PROJET.md
/// section 2, contraintes Supabase). Maquette alignée sur les documents
/// réels de l'atelier (logo, palette vert/orangé, encadré FODEC + montant en
/// lettres).
const _vert = PdfColor.fromInt(0xFF1B5E3F);
const _orange = PdfColor.fromInt(0xFFB8752E);
const _grisFond = PdfColor.fromInt(0xFFE7E7E5);
const _grisLogo = PdfColor.fromInt(0xFFD9D9D9);
const _noir = PdfColor.fromInt(0xFF1C1917);

Future<pw.Document> genererPdfDocument({
  required String titre,
  required String? numero,
  required DateTime date,
  required Societe societe,
  required String clientNom,
  String? clientAdresse,
  String? clientMatriculeFiscal,
  required List<LigneSaisie> lignes,
  required Decimal totalHt,
  required Decimal fodec,
  required Decimal totalTva,
  required Decimal totalTtc,
  Decimal? timbreFiscal,
  Decimal? fraisLivraison,
  Decimal? retenueSource,
  String? notes,
  bool afficherPiedDePage = false,
  Uint8List? logoOctets,
  String libelleDocument = 'facture',
}) async {
  final doc = pw.Document();
  final totalHtApresFodec = totalHt + fodec;
  final logoImage = logoOctets != null ? pw.MemoryImage(logoOctets) : null;

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(32),
      build: (context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            _entete(titre: titre, numero: numero, date: date, societe: societe, logoImage: logoImage),
            pw.SizedBox(height: 8),
            _blocClient(
              clientNom: clientNom,
              clientAdresse: clientAdresse,
              clientMatriculeFiscal: clientMatriculeFiscal,
            ),
            pw.SizedBox(height: 20),
            pw.Container(
              padding: const pw.EdgeInsets.all(12),
              decoration: const pw.BoxDecoration(color: _grisFond),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  _tableauLignes(lignes),
                  pw.SizedBox(height: 16),
                  pw.Divider(color: _vert, thickness: 0.5),
                  pw.SizedBox(height: 12),
                  _blocRecapitulatif(
                    totalHt: totalHt,
                    fodec: fodec,
                    totalHtApresFodec: totalHtApresFodec,
                    totalTva: totalTva,
                    totalTtc: totalTtc,
                    timbreFiscal: timbreFiscal,
                    fraisLivraison: fraisLivraison,
                    retenueSource: retenueSource,
                    libelleDocument: libelleDocument,
                  ),
                ],
              ),
            ),
            if (notes != null && notes.isNotEmpty) ...[
              pw.SizedBox(height: 16),
              pw.Text('Notes', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9, color: _orange)),
              pw.Text(notes, style: const pw.TextStyle(fontSize: 9)),
            ],
            if (afficherPiedDePage) ...[
              pw.Spacer(),
              _piedDePage(societe),
            ],
          ],
        );
      },
    ),
  );

  return doc;
}

pw.Widget _entete({
  required String titre,
  required String? numero,
  required DateTime date,
  required Societe societe,
  pw.MemoryImage? logoImage,
}) {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Container(
        width: 130,
        height: 90,
        color: logoImage == null ? _grisLogo : null,
        alignment: pw.Alignment.center,
        child: logoImage != null
            ? pw.Image(logoImage, fit: pw.BoxFit.contain)
            : pw.Text(
                societe.raisonSociale,
                textAlign: pw.TextAlign.center,
                style: const pw.TextStyle(fontSize: 8),
              ),
      ),
      pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.Text(
            numero != null ? '$titre  N° $numero' : titre,
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold, color: _vert),
          ),
          pw.SizedBox(height: 6),
          pw.Text(Formatters.date.format(date), style: pw.TextStyle(fontSize: 9, color: _vert)),
        ],
      ),
    ],
  );
}

pw.Widget _blocClient({required String clientNom, String? clientAdresse, String? clientMatriculeFiscal}) {
  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.RichText(
        text: pw.TextSpan(
          children: [
            pw.TextSpan(text: 'Nom de client : ', style: pw.TextStyle(color: _vert, fontWeight: pw.FontWeight.bold)),
            pw.TextSpan(text: clientNom, style: const pw.TextStyle(color: _noir)),
          ],
          style: const pw.TextStyle(fontSize: 10),
        ),
      ),
      if (clientAdresse != null && clientAdresse.isNotEmpty) ...[
        pw.SizedBox(height: 4),
        pw.RichText(
          text: pw.TextSpan(
            children: [
              pw.TextSpan(text: 'Adresse : ', style: pw.TextStyle(color: _vert, fontWeight: pw.FontWeight.bold)),
              pw.TextSpan(text: clientAdresse, style: const pw.TextStyle(color: _noir)),
            ],
            style: const pw.TextStyle(fontSize: 10),
          ),
        ),
      ],
      if (clientMatriculeFiscal != null && clientMatriculeFiscal.isNotEmpty) ...[
        pw.SizedBox(height: 4),
        pw.Text('MF : $clientMatriculeFiscal', style: pw.TextStyle(fontSize: 9, color: _vert)),
      ],
    ],
  );
}

pw.Widget _tableauLignes(List<LigneSaisie> lignes) {
  return pw.TableHelper.fromTextArray(
    border: pw.TableBorder.all(color: _vert, width: 0.5),
    headerDecoration: const pw.BoxDecoration(color: PdfColors.white),
    headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9, color: _orange),
    cellStyle: const pw.TextStyle(fontSize: 9, color: _noir),
    cellPadding: const pw.EdgeInsets.symmetric(vertical: 6, horizontal: 4),
    cellAlignments: const {
      0: pw.Alignment.centerLeft,
      1: pw.Alignment.center,
      2: pw.Alignment.centerRight,
      3: pw.Alignment.centerRight,
    },
    headers: ['Description', 'Quantité', 'Prix unitaire HT', 'Prix total HT'],
    data: [
      for (final l in lignes)
        [
          l.designation,
          l.quantite.toString(),
          Formatters.montant(l.prixUnitaire, suffixe: ''),
          Formatters.montant(l.montantHt, suffixe: ''),
        ],
    ],
  );
}

pw.Widget _blocRecapitulatif({
  required Decimal totalHt,
  required Decimal fodec,
  required Decimal totalHtApresFodec,
  required Decimal totalTva,
  required Decimal totalTtc,
  Decimal? timbreFiscal,
  Decimal? fraisLivraison,
  Decimal? retenueSource,
  String libelleDocument = 'facture',
}) {
  return pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Expanded(
        child: pw.Container(
          padding: const pw.EdgeInsets.all(8),
          decoration: pw.BoxDecoration(border: pw.Border.all(color: _vert, width: 0.5)),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'Arrêtée la présente $libelleDocument à la somme de :',
                style: pw.TextStyle(fontSize: 9, color: _orange, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 6),
              pw.Text(
                NombreEnLettres.montant(totalTtc),
                style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold, color: _noir),
              ),
            ],
          ),
        ),
      ),
      pw.SizedBox(width: 12),
      pw.Expanded(
        child: pw.Container(
          decoration: pw.BoxDecoration(border: pw.Border.all(color: _vert, width: 0.5)),
          child: pw.Table(
            border: pw.TableBorder.symmetric(inside: const pw.BorderSide(color: _vert, width: 0.3)),
            columnWidths: const {0: pw.FlexColumnWidth(1.3), 1: pw.FlexColumnWidth(1)},
            children: [
              _ligneRecap('Total :', totalHt),
              _ligneRecap('Fodec :', fodec),
              _ligneRecap('Total HT :', totalHtApresFodec, gras: true),
              _ligneRecap('Taux de TVA :', totalTva),
              if (timbreFiscal != null && timbreFiscal > Decimal.zero) _ligneRecap('Droit de timbre :', timbreFiscal),
              if (fraisLivraison != null && fraisLivraison > Decimal.zero)
                _ligneRecap('Frais de livraison :', fraisLivraison),
              if (retenueSource != null && retenueSource > Decimal.zero)
                _ligneRecap('Retenue à la source :', -retenueSource),
              _ligneRecap('Mt TTC:', totalTtc, gras: true),
            ],
          ),
        ),
      ),
    ],
  );
}

pw.TableRow _ligneRecap(String libelle, Decimal montant, {bool gras = false}) {
  final styleLibelle = pw.TextStyle(
    fontSize: 9,
    color: _orange,
    fontWeight: gras ? pw.FontWeight.bold : pw.FontWeight.normal,
  );
  final styleValeur = pw.TextStyle(
    fontSize: 9,
    color: _noir,
    fontWeight: gras ? pw.FontWeight.bold : pw.FontWeight.normal,
  );
  return pw.TableRow(
    children: [
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        child: pw.Text(libelle, style: styleLibelle),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        child: pw.Text(Formatters.montant(montant, suffixe: ''), style: styleValeur, textAlign: pw.TextAlign.right),
      ),
    ],
  );
}

pw.Widget _piedDePage(Societe societe) {
  return pw.Container(
    padding: const pw.EdgeInsets.symmetric(vertical: 8),
    decoration: const pw.BoxDecoration(border: pw.Border(top: pw.BorderSide(color: _vert, width: 0.5))),
    child: pw.Center(
      child: pw.Text(
        [
          'MF : ${societe.matriculeFiscal}',
          'Adresse : ${societe.adresse}',
          if (societe.telephone != null && societe.telephone!.isNotEmpty) 'Tel : ${societe.telephone}',
        ].join('   /   '),
        style: const pw.TextStyle(fontSize: 8, color: _orange),
      ),
    ),
  );
}
