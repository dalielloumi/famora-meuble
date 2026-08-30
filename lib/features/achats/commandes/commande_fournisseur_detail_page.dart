import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/commande_fournisseur.dart';
import '../../../models/ligne_saisie.dart';
import '../../../providers/achats_providers.dart';
import '../../../providers/reference_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../widgets/lignes_document_editeur.dart';
import '../../../widgets/statut_bar.dart';
import '../receptions/reception_detail_page.dart';

class CommandeFournisseurDetailPage extends ConsumerStatefulWidget {
  const CommandeFournisseurDetailPage({super.key, required this.commandeId});

  final String commandeId;

  @override
  ConsumerState<CommandeFournisseurDetailPage> createState() => _CommandeFournisseurDetailPageState();
}

class _CommandeFournisseurDetailPageState extends ConsumerState<CommandeFournisseurDetailPage> {
  CommandeFournisseur? _commande;
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
    final repo = ref.read(commandeFournisseurRepositoryProvider);
    final commande = await repo.rafraichir(widget.commandeId);
    final lignesDb = await repo.chargerLignes(widget.commandeId);
    final tauxTva = await ref.read(tauxTvaListProvider.future);

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
          ),
      ];
      _chargement = false;
    });
  }

  bool get _modifiable => _commande?.statut == StatutDocument.brouillon;

  Future<void> _enregistrerLignes() async {
    setState(() => _enCours = true);
    try {
      await ref.read(commandeFournisseurRepositoryProvider).remplacerLignes(widget.commandeId, _lignes);
      await _charger();
      ref.read(commandeFournisseurListeProvider.notifier).rafraichir();
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
      await ref.read(commandeFournisseurRepositoryProvider).remplacerLignes(widget.commandeId, _lignes);
      await ref.read(commandeFournisseurRepositoryProvider).valider(widget.commandeId);
      await _charger();
      ref.read(commandeFournisseurListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Validation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _annuler() async {
    setState(() => _enCours = true);
    try {
      await ref.read(commandeFournisseurRepositoryProvider).annuler(widget.commandeId);
      await _charger();
      ref.read(commandeFournisseurListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Annulation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _creerReception() async {
    final commande = _commande;
    if (commande == null) return;

    setState(() => _enCours = true);
    try {
      final reception = await ref
          .read(receptionRepositoryProvider)
          .creerBrouillon(
            exerciceId: commande.exerciceId,
            commandeFournisseurId: commande.id,
            fournisseurId: commande.fournisseurId,
            depotId: commande.depotId,
            dateReception: DateTime.now(),
          );
      await ref.read(receptionRepositoryProvider).copierLignesDepuisCommande(reception.id!, commande.id!);
      if (mounted) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => ReceptionDetailPage(receptionId: reception.id!)));
      }
    } catch (e) {
      setState(() => _erreur = 'Création de la réception impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
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
    final fournisseurNom = tiersAsync.value?.firstWhere((t) => t.id == commande.fournisseurId).raisonSociale ?? '…';

    return Scaffold(
      appBar: AppBar(title: Text(commande.numero ?? 'Commande brouillon')),
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
                        Text(fournisseurNom, style: AppText.sousTitre),
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
              LignesDocumentEditeur(lignes: _lignes, onChanged: (l) => setState(() => _lignes = l)),
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
                      onPressed: _enCours ? null : _creerReception,
                      icon: const Icon(Icons.inventory_2_outlined, size: 18),
                      label: const Text('Créer une réception'),
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
