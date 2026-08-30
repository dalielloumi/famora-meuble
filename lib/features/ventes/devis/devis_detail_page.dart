import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

import '../../../core/pdf/document_pdf.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/devis.dart';
import '../../../models/ligne_saisie.dart';
import '../../../providers/reference_providers.dart';
import '../../../providers/societe_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../providers/ventes_providers.dart';
import '../../../widgets/lignes_document_editeur.dart';
import '../../../widgets/statut_bar.dart';
import '../commandes/commande_client_detail_page.dart';

class DevisDetailPage extends ConsumerStatefulWidget {
  const DevisDetailPage({super.key, required this.devisId});

  final String devisId;

  @override
  ConsumerState<DevisDetailPage> createState() => _DevisDetailPageState();
}

class _DevisDetailPageState extends ConsumerState<DevisDetailPage> {
  Devis? _devis;
  List<LigneSaisie> _lignes = [];
  bool _chargement = true;
  bool _enregistrement = false;
  String? _erreur;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    setState(() => _chargement = true);
    final repo = ref.read(devisRepositoryProvider);
    final devis = await repo.rafraichir(widget.devisId);
    final lignesDb = await repo.chargerLignes(widget.devisId);
    final tauxTva = await ref.read(tauxTvaListProvider.future);
    final societe = await ref.read(societeProvider.future);

    setState(() {
      _devis = devis;
      _lignes = [
        for (final l in lignesDb)
          LigneSaisie(
            id: l.id,
            articleId: l.articleId,
            designation: '',
            varianteId: l.varianteId,
            quantite: l.quantite,
            prixUnitaire: l.prixUnitaire,
            remisePct: l.remisePct,
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

  bool get _modifiable => _devis?.statut == StatutDocument.brouillon;

  Future<void> _enregistrerLignes() async {
    setState(() => _enregistrement = true);
    try {
      await ref.read(devisRepositoryProvider).remplacerLignes(widget.devisId, _lignes);
      await _charger();
      ref.read(devisListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Enregistrement impossible : $e');
    } finally {
      if (mounted) setState(() => _enregistrement = false);
    }
  }

  Future<void> _valider() async {
    if (_lignes.isEmpty) {
      setState(() => _erreur = 'Ajoutez au moins une ligne avant de valider.');
      return;
    }
    setState(() => _enregistrement = true);
    try {
      await ref.read(devisRepositoryProvider).remplacerLignes(widget.devisId, _lignes);
      await ref.read(devisRepositoryProvider).valider(widget.devisId);
      await _charger();
      ref.read(devisListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Validation impossible : $e');
    } finally {
      if (mounted) setState(() => _enregistrement = false);
    }
  }

  Future<void> _annuler() async {
    setState(() => _enregistrement = true);
    try {
      await ref.read(devisRepositoryProvider).annuler(widget.devisId);
      await _charger();
      ref.read(devisListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Annulation impossible : $e');
    } finally {
      if (mounted) setState(() => _enregistrement = false);
    }
  }

  Future<void> _creerCommande() async {
    final devis = _devis;
    if (devis == null) return;

    setState(() => _enregistrement = true);
    try {
      final commande = await ref
          .read(commandeClientRepositoryProvider)
          .creerBrouillon(
            exerciceId: devis.exerciceId,
            clientId: devis.clientId,
            devisId: devis.id,
            dateCommande: DateTime.now(),
          );
      await ref.read(commandeClientRepositoryProvider).copierLignesDepuisDevis(commande.id!, devis.id!);
      if (mounted) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => CommandeClientDetailPage(commandeId: commande.id!)));
      }
    } catch (e) {
      setState(() => _erreur = 'Création de la commande impossible : $e');
    } finally {
      if (mounted) setState(() => _enregistrement = false);
    }
  }

  Future<void> _imprimer() async {
    final devis = _devis;
    if (devis == null) return;
    final societe = await ref.read(societeProvider.future);
    final tiersListe = await ref.read(tiersListProvider.future);
    final client = tiersListe.firstWhere((t) => t.id == devis.clientId);
    final logoOctets = await ref.read(logoOctetsProvider.future);

    final doc = await genererPdfDocument(
      titre: 'Devis',
      numero: devis.numero,
      date: devis.dateDevis,
      societe: societe,
      clientNom: client.raisonSociale,
      clientAdresse: client.adresse,
      clientMatriculeFiscal: client.matriculeFiscal,
      lignes: _lignes,
      totalHt: devis.totalHt,
      fodec: devis.fodec,
      totalTva: devis.totalTva,
      totalTtc: devis.totalTtc,
      notes: devis.notes,
      afficherPiedDePage: true,
      logoOctets: logoOctets,
      libelleDocument: 'devis',
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
    if (_chargement || _devis == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final devis = _devis!;
    final tiersAsync = ref.watch(tiersListProvider);
    final clientNom = tiersAsync.value?.firstWhere((t) => t.id == devis.clientId).raisonSociale ?? '…';

    return Scaffold(
      appBar: AppBar(
        title: Text(devis.numero ?? 'Devis brouillon'),
        actions: [
          if (devis.statut != StatutDocument.annule)
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
                  StatutBar(etat: _etatStatutBar(devis.statut), hauteur: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(clientNom, style: AppText.sousTitre),
                        Text(
                          '${devis.statut.libelle} · ${Formatters.date.format(devis.dateDevis)}',
                          style: AppText.corps,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              LignesDocumentEditeur(
                lignes: _lignes,
                avecFodec: true,
                onChanged: (l) => setState(() => _lignes = l),
              ),
              if (_erreur != null) ...[
                const SizedBox(height: 12),
                Text(_erreur!, style: const TextStyle(color: AppColors.alerte)),
              ],
              const SizedBox(height: 20),
              if (_modifiable)
                Wrap(
                  spacing: 8,
                  children: [
                    OutlinedButton(
                      onPressed: _enregistrement ? null : _enregistrerLignes,
                      child: const Text('Enregistrer le brouillon'),
                    ),
                    FilledButton(
                      onPressed: _enregistrement ? null : _valider,
                      child: const Text('Valider le devis'),
                    ),
                  ],
                )
              else if (devis.statut == StatutDocument.valide)
                Wrap(
                  spacing: 8,
                  children: [
                    FilledButton.icon(
                      onPressed: _enregistrement ? null : _creerCommande,
                      icon: const Icon(Icons.shopping_cart_checkout, size: 18),
                      label: const Text('Créer une commande'),
                    ),
                    OutlinedButton(
                      onPressed: _enregistrement ? null : _annuler,
                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.alerte),
                      child: const Text('Annuler le devis'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
