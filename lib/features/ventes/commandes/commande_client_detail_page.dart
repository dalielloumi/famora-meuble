import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

import '../../../core/pdf/document_pdf.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/commande_client.dart';
import '../../../models/ligne_saisie.dart';
import '../../../providers/depot_providers.dart';
import '../../../providers/reference_providers.dart';
import '../../../providers/societe_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../providers/ventes_providers.dart';
import '../../../widgets/lignes_document_editeur.dart';
import '../../../widgets/statut_bar.dart';
import '../bl/bl_detail_page.dart';

class CommandeClientDetailPage extends ConsumerStatefulWidget {
  const CommandeClientDetailPage({super.key, required this.commandeId});

  final String commandeId;

  @override
  ConsumerState<CommandeClientDetailPage> createState() => _CommandeClientDetailPageState();
}

class _CommandeClientDetailPageState extends ConsumerState<CommandeClientDetailPage> {
  CommandeClient? _commande;
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
    final repo = ref.read(commandeClientRepositoryProvider);
    final commande = await repo.rafraichir(widget.commandeId);
    final lignesDb = await repo.chargerLignes(widget.commandeId);
    final tauxTva = await ref.read(tauxTvaListProvider.future);
    final societe = await ref.read(societeProvider.future);

    setState(() {
      _commande = commande;
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

  bool get _modifiable => _commande?.statut == StatutDocument.brouillon;

  Future<void> _enregistrerLignes() async {
    setState(() => _enCours = true);
    try {
      await ref.read(commandeClientRepositoryProvider).remplacerLignes(widget.commandeId, _lignes);
      await _charger();
      ref.read(commandeClientListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Enregistrement impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _valider() async {
    if (_lignes.isEmpty) {
      setState(() => _erreur = 'Ajoutez au moins une ligne avant de valider.');
      return;
    }
    setState(() => _enCours = true);
    try {
      await ref.read(commandeClientRepositoryProvider).remplacerLignes(widget.commandeId, _lignes);
      await ref.read(commandeClientRepositoryProvider).valider(widget.commandeId);
      await _charger();
      ref.read(commandeClientListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Validation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _annuler() async {
    setState(() => _enCours = true);
    try {
      await ref.read(commandeClientRepositoryProvider).annuler(widget.commandeId);
      await _charger();
      ref.read(commandeClientListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Annulation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _creerBl() async {
    final commande = _commande;
    if (commande == null) return;

    final depots = await ref.read(depotsProvider.future);
    if (depots.isEmpty) {
      setState(() => _erreur = 'Créez un dépôt avant de générer un bon de livraison.');
      return;
    }

    setState(() => _enCours = true);
    try {
      final bl = await ref
          .read(blRepositoryProvider)
          .creerBrouillon(
            exerciceId: commande.exerciceId,
            clientId: commande.clientId,
            commandeClientId: commande.id,
            depotId: depots.first.id!,
            dateBl: DateTime.now(),
          );
      await ref.read(blRepositoryProvider).copierLignesDepuisCommande(bl.id!, commande.id!);
      if (mounted) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => BlDetailPage(blId: bl.id!)));
      }
    } catch (e) {
      setState(() => _erreur = 'Création du BL impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _imprimer() async {
    final commande = _commande;
    if (commande == null) return;
    final societe = await ref.read(societeProvider.future);
    final logoOctets = await ref.read(logoOctetsProvider.future);
    final tiersListe = await ref.read(tiersListProvider.future);
    final client = tiersListe.firstWhere((t) => t.id == commande.clientId);

    final doc = await genererPdfDocument(
      titre: 'Commande',
      numero: commande.numero,
      date: commande.dateCommande,
      societe: societe,
      clientNom: client.raisonSociale,
      clientAdresse: client.adresse,
      clientMatriculeFiscal: client.matriculeFiscal,
      lignes: _lignes,
      totalHt: commande.totalHt,
      fodec: commande.fodec,
      totalTva: commande.totalTva,
      totalTtc: commande.totalTtc,
      notes: commande.notes,
      libelleDocument: 'commande',
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
    if (_chargement || _commande == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final commande = _commande!;
    final tiersAsync = ref.watch(tiersListProvider);
    final clientNom = tiersAsync.value?.firstWhere((t) => t.id == commande.clientId).raisonSociale ?? '…';

    return Scaffold(
      appBar: AppBar(
        title: Text(commande.numero ?? 'Commande brouillon'),
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
                  StatutBar(etat: _etatStatutBar(commande.statut), hauteur: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(clientNom, style: AppText.sousTitre),
                        Text(
                          '${commande.statut.libelle} · ${Formatters.date.format(commande.dateCommande)}',
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
              Wrap(
                spacing: 8,
                children: [
                  if (_modifiable) ...[
                    OutlinedButton(
                      onPressed: _enCours ? null : _enregistrerLignes,
                      child: const Text('Enregistrer le brouillon'),
                    ),
                    FilledButton(onPressed: _enCours ? null : _valider, child: const Text('Valider la commande')),
                  ] else if (commande.statut == StatutDocument.valide) ...[
                    FilledButton.icon(
                      onPressed: _enCours ? null : _creerBl,
                      icon: const Icon(Icons.local_shipping_outlined, size: 18),
                      label: const Text('Créer un BL'),
                    ),
                    OutlinedButton(
                      onPressed: _enCours ? null : _annuler,
                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.alerte),
                      child: const Text('Annuler la commande'),
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
