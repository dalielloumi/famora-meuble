import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/ligne_saisie.dart';
import '../../../models/reception.dart';
import '../../../providers/achats_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../widgets/lignes_document_editeur.dart';
import '../../../widgets/statut_bar.dart';
import '../factures/facture_achat_detail_page.dart';

class ReceptionDetailPage extends ConsumerStatefulWidget {
  const ReceptionDetailPage({super.key, required this.receptionId});

  final String receptionId;

  @override
  ConsumerState<ReceptionDetailPage> createState() => _ReceptionDetailPageState();
}

class _ReceptionDetailPageState extends ConsumerState<ReceptionDetailPage> {
  Reception? _reception;
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
    final repo = ref.read(receptionRepositoryProvider);
    final reception = await repo.rafraichir(widget.receptionId);
    final lignesDb = await repo.chargerLignes(widget.receptionId);

    setState(() {
      _reception = reception;
      _lignes = [
        for (final l in lignesDb)
          LigneSaisie(
            id: l.id,
            articleId: l.articleId,
            designation: '',
            varianteId: l.varianteId,
            quantite: l.quantite,
            prixUnitaire: l.prixUnitaire,
            tauxTvaId: '',
            tauxTvaPct: Decimal.zero,
          ),
      ];
      _chargement = false;
    });
  }

  bool get _modifiable => _reception?.statut == StatutDocument.brouillon;

  Future<void> _enregistrerLignes() async {
    setState(() => _enCours = true);
    try {
      await ref.read(receptionRepositoryProvider).remplacerLignes(widget.receptionId, _lignes);
      await _charger();
      ref.read(receptionListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Enregistrement impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _valider() async {
    if (_lignes.isEmpty) {
      setState(() => _erreur = 'La réception ne contient aucune ligne.');
      return;
    }
    setState(() => _enCours = true);
    try {
      await ref.read(receptionRepositoryProvider).remplacerLignes(widget.receptionId, _lignes);
      await ref.read(receptionRepositoryProvider).valider(widget.receptionId);
      await _charger();
      ref.read(receptionListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Validation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _annuler() async {
    setState(() => _enCours = true);
    try {
      await ref.read(receptionRepositoryProvider).annuler(widget.receptionId);
      await _charger();
      ref.read(receptionListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Annulation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _creerFactureAchat() async {
    final reception = _reception;
    if (reception == null) return;

    setState(() => _enCours = true);
    try {
      final facture = await ref
          .read(factureAchatRepositoryProvider)
          .creerBrouillon(
            exerciceId: reception.exerciceId,
            fournisseurId: reception.fournisseurId,
            receptionId: reception.id,
            dateFacture: DateTime.now(),
          );
      await ref.read(factureAchatRepositoryProvider).copierLignesDepuisReception(facture.id!, reception.id!);
      if (mounted) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => FactureAchatDetailPage(factureId: facture.id!)));
      }
    } catch (e) {
      setState(() => _erreur = 'Création de la facture impossible : $e');
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
    if (_chargement || _reception == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final reception = _reception!;
    final tiersAsync = ref.watch(tiersListProvider);
    final fournisseurNom =
        tiersAsync.value?.firstWhere((t) => t.id == reception.fournisseurId).raisonSociale ?? '…';

    return Scaffold(
      appBar: AppBar(title: Text(reception.numero ?? 'Réception brouillon')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  StatutBar(etat: _etatStatutBar(reception.statut), hauteur: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fournisseurNom, style: AppText.sousTitre),
                        Text(
                          '${reception.statut.libelle} · ${Formatters.date.format(reception.dateReception)}',
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
                avecRemise: false,
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
                    FilledButton(onPressed: _enCours ? null : _valider, child: const Text('Valider la réception')),
                  ],
                  if (reception.statut == StatutDocument.valide) ...[
                    FilledButton.icon(
                      onPressed: _enCours ? null : _creerFactureAchat,
                      icon: const Icon(Icons.receipt_long_outlined, size: 18),
                      label: const Text('Créer une facture d\'achat'),
                    ),
                    OutlinedButton(
                      onPressed: _enCours ? null : _annuler,
                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.alerte),
                      child: const Text('Annuler la réception'),
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
