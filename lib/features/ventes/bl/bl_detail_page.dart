import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

import '../../../core/pdf/document_pdf.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/calculs.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/bl.dart';
import '../../../models/ligne_saisie.dart';
import '../../../providers/reference_providers.dart';
import '../../../providers/societe_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../providers/ventes_providers.dart';
import '../../../widgets/lignes_document_editeur.dart';
import '../../../widgets/statut_bar.dart';
import '../factures/facture_vente_detail_page.dart';

class BlDetailPage extends ConsumerStatefulWidget {
  const BlDetailPage({super.key, required this.blId});

  final String blId;

  @override
  ConsumerState<BlDetailPage> createState() => _BlDetailPageState();
}

class _BlDetailPageState extends ConsumerState<BlDetailPage> {
  Bl? _bl;
  List<LigneSaisie> _lignes = [];
  bool _chargement = true;
  bool _enCours = false;
  String? _erreur;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    setState(() => _chargement = true);
    final repo = ref.read(blRepositoryProvider);
    final bl = await repo.rafraichir(widget.blId);
    final lignesDb = await repo.chargerLignes(widget.blId);
    final tauxTva = await ref.read(tauxTvaListProvider.future);
    final societe = await ref.read(societeProvider.future);

    setState(() {
      _bl = bl;
      _lignes = [
        for (final l in lignesDb)
          LigneSaisie(
            id: l.id,
            articleId: l.articleId,
            designation: '',
            varianteId: l.varianteId,
            quantite: l.quantite,
            prixUnitaire: l.prixUnitaire,
            tauxTvaId: l.tauxTvaId,
            tauxTvaPct: Decimal.parse(
              '${tauxTva.firstWhere((t) => t.id == l.tauxTvaId, orElse: () => tauxTva.first).taux}',
            ),
            tauxFodecPct: societe.tauxFodec,
          ),
      ];
      _chargement = false;
    });
  }

  bool get _modifiable => _bl?.statut == StatutDocument.brouillon;

  Future<void> _enregistrerLignes() async {
    setState(() => _enCours = true);
    try {
      await ref.read(blRepositoryProvider).remplacerLignes(widget.blId, _lignes);
      await _charger();
      ref.read(blListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Enregistrement impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _valider() async {
    if (_lignes.isEmpty) {
      setState(() => _erreur = 'Le BL ne contient aucune ligne.');
      return;
    }
    setState(() => _enCours = true);
    try {
      await ref.read(blRepositoryProvider).remplacerLignes(widget.blId, _lignes);
      await ref.read(blRepositoryProvider).valider(widget.blId);
      await _charger();
      ref.read(blListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Validation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _annuler() async {
    setState(() => _enCours = true);
    try {
      await ref.read(blRepositoryProvider).annuler(widget.blId);
      await _charger();
      ref.read(blListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Annulation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _creerFacture() async {
    final bl = _bl;
    if (bl == null) return;

    setState(() => _enCours = true);
    try {
      final facture = await ref
          .read(factureVenteRepositoryProvider)
          .creerBrouillon(
            exerciceId: bl.exerciceId,
            clientId: bl.clientId,
            blId: bl.id,
            commandeClientId: bl.commandeClientId,
            dateFacture: DateTime.now(),
          );
      await ref.read(factureVenteRepositoryProvider).copierLignesDepuisBl(facture.id!, bl.id!);
      if (mounted) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => FactureVenteDetailPage(factureId: facture.id!)));
      }
    } catch (e) {
      setState(() => _erreur = 'Création de la facture impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _imprimer() async {
    final bl = _bl;
    if (bl == null) return;
    final societe = await ref.read(societeProvider.future);
    final logoOctets = await ref.read(logoOctetsProvider.future);
    final tiersListe = await ref.read(tiersListProvider.future);
    final client = tiersListe.firstWhere((t) => t.id == bl.clientId);

    // Le BL n'a pas de totaux stockés côté serveur (ce n'est pas un document
    // fiscal en base) : aperçu calculé côté client, avec les mêmes règles que
    // les autres documents (Calculs, section 4 de PROJET.md), uniquement pour
    // l'impression — le calcul qui fait foi reste celui de la facture liée.
    final totalHt = _lignes.fold(Decimal.zero, (s, l) => s + l.montantHt);
    final fodec = _lignes.fold(Decimal.zero, (s, l) => s + l.montantFodec);
    final totalTva = _lignes.fold(Decimal.zero, (s, l) => s + l.montantTva);
    final retenueSource = Calculs.retenueSource(totalHt: totalHt, tauxRetenueSource: client.tauxRetenueSource);
    final totalTtc = Calculs.totalTtc(
      totalHt: totalHt,
      fodec: fodec,
      totalTva: totalTva,
      timbreFiscal: societe.timbreFiscal,
      fraisLivraison: Decimal.zero,
      retenueSource: retenueSource,
    );

    final doc = await genererPdfDocument(
      titre: 'BON DE LIVRAISON',
      numero: bl.numero,
      date: bl.dateBl,
      societe: societe,
      clientNom: client.raisonSociale,
      clientAdresse: bl.adresseLivraison ?? client.adresse,
      clientMatriculeFiscal: client.matriculeFiscal,
      lignes: _lignes,
      totalHt: totalHt,
      fodec: fodec,
      totalTva: totalTva,
      totalTtc: totalTtc,
      timbreFiscal: societe.timbreFiscal,
      retenueSource: retenueSource,
      notes: bl.notes,
      libelleDocument: 'bon de livraison',
      logoOctets: logoOctets,
    );

    await Printing.layoutPdf(onLayout: (_) => doc.save());
  }

  EtatStatutBar _etatStatutBar(StatutDocument s) => switch (s) {
    StatutDocument.brouillon => EtatStatutBar.brouillon,
    StatutDocument.valide => EtatStatutBar.valide,
    StatutDocument.annule => EtatStatutBar.annuleImpaye,
  };

  @override
  Widget build(BuildContext context) {
    if (_chargement || _bl == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final bl = _bl!;
    final tiersAsync = ref.watch(tiersListProvider);
    final clientNom = tiersAsync.value?.firstWhere((t) => t.id == bl.clientId).raisonSociale ?? '…';

    return Scaffold(
      appBar: AppBar(
        title: Text(bl.numero ?? 'BL brouillon'),
        actions: [
          IconButton(icon: const Icon(Icons.picture_as_pdf_outlined), onPressed: _imprimer, tooltip: 'PDF'),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  StatutBar(etat: _etatStatutBar(bl.statut), hauteur: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(clientNom, style: AppText.sousTitre),
                        Text('${bl.statut.libelle} · ${Formatters.date.format(bl.dateBl)}', style: AppText.corps),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              LignesDocumentEditeur(
                lignes: _lignes,
                avecRemise: false,
                avecFodec: true,
                onChanged: (l) => setState(() => _lignes = l),
              ),
              if (_erreur != null) ...[
                const SizedBox(height: 12),
                Text(_erreur!, style: const TextStyle(color: AppColors.alerte)),
              ],
              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                children: [
                  if (_modifiable) ...[
                    OutlinedButton(
                      onPressed: _enCours ? null : _enregistrerLignes,
                      child: const Text('Enregistrer le brouillon'),
                    ),
                    FilledButton(onPressed: _enCours ? null : _valider, child: const Text('Valider le BL')),
                  ],
                  if (bl.statut == StatutDocument.valide) ...[
                    FilledButton.icon(
                      onPressed: _enCours ? null : _creerFacture,
                      icon: const Icon(Icons.receipt_long_outlined, size: 18),
                      label: const Text('Créer une facture'),
                    ),
                    OutlinedButton(
                      onPressed: _enCours ? null : _annuler,
                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.alerte),
                      child: const Text('Annuler le BL'),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
