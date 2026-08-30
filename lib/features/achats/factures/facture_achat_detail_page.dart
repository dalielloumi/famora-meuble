import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/facture_achat.dart';
import '../../../models/ligne_saisie.dart';
import '../../../providers/achats_providers.dart';
import '../../../providers/reference_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../widgets/lignes_document_editeur.dart';
import '../../../widgets/statut_bar.dart';
import '../avoirs/avoir_achat_entete_formulaire.dart';

class FactureAchatDetailPage extends ConsumerStatefulWidget {
  const FactureAchatDetailPage({super.key, required this.factureId});

  final String factureId;

  @override
  ConsumerState<FactureAchatDetailPage> createState() => _FactureAchatDetailPageState();
}

class _FactureAchatDetailPageState extends ConsumerState<FactureAchatDetailPage> {
  FactureAchat? _facture;
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
    final repo = ref.read(factureAchatRepositoryProvider);
    final facture = await repo.rafraichir(widget.factureId);
    final lignesDb = await repo.chargerLignes(widget.factureId);
    final tauxTva = await ref.read(tauxTvaListProvider.future);

    setState(() {
      _facture = facture;
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

  bool get _modifiable => _facture?.statut == StatutDocument.brouillon;

  Future<void> _enregistrer() async {
    setState(() => _enCours = true);
    try {
      await ref.read(factureAchatRepositoryProvider).remplacerLignes(widget.factureId, _lignes);
      await _charger();
      ref.read(factureAchatListeProvider.notifier).rafraichir();
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
      await ref.read(factureAchatRepositoryProvider).remplacerLignes(widget.factureId, _lignes);
      await ref.read(factureAchatRepositoryProvider).valider(widget.factureId);
      await _charger();
      ref.read(factureAchatListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Validation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _annuler() async {
    setState(() => _enCours = true);
    try {
      await ref.read(factureAchatRepositoryProvider).annuler(widget.factureId);
      await _charger();
      ref.read(factureAchatListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Annulation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _creerAvoir() async {
    final facture = _facture;
    if (facture == null) return;
    await ouvrirCreationAvoirAchat(context, ref, facture: facture, lignesFacture: _lignes);
  }

  EtatStatutBar _etatStatutBar(FactureAchat f) {
    if (f.statut == StatutDocument.annule) return EtatStatutBar.annuleImpaye;
    if (f.statut == StatutDocument.brouillon) return EtatStatutBar.brouillon;
    return switch (f.statutPaiement) {
      StatutPaiement.impaye => EtatStatutBar.annuleImpaye,
      StatutPaiement.partiel => EtatStatutBar.partiel,
      StatutPaiement.solde => EtatStatutBar.solde,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_chargement || _facture == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final facture = _facture!;
    final tiersAsync = ref.watch(tiersListProvider);
    final fournisseurNom =
        tiersAsync.value?.firstWhere((t) => t.id == facture.fournisseurId).raisonSociale ?? '…';

    return Scaffold(
      appBar: AppBar(title: Text(facture.numero ?? 'Facture brouillon')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  StatutBar(etat: _etatStatutBar(facture), hauteur: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fournisseurNom, style: AppText.sousTitre),
                        Text(
                          '${facture.statut.libelle} · ${facture.statutPaiement.libelle} · ${Formatters.date.format(facture.dateFacture)}',
                          style: AppText.corps,
                        ),
                        Text('Réglé : ${Formatters.montant(facture.montantRegle)}', style: AppText.corps),
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
                      onPressed: _enCours ? null : _enregistrer,
                      child: const Text('Enregistrer le brouillon'),
                    ),
                    FilledButton(onPressed: _enCours ? null : _valider, child: const Text('Valider la facture')),
                  ] else if (facture.statut == StatutDocument.valide) ...[
                    FilledButton.icon(
                      onPressed: _enCours ? null : _creerAvoir,
                      icon: const Icon(Icons.undo, size: 18),
                      label: const Text('Créer un avoir'),
                    ),
                    OutlinedButton(
                      onPressed: _enCours ? null : _annuler,
                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.alerte),
                      child: const Text('Annuler la facture'),
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
