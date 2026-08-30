import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/avoir_achat.dart';
import '../../../models/ligne_saisie.dart';
import '../../../providers/achats_providers.dart';
import '../../../providers/reference_providers.dart';
import '../../../providers/tiers_providers.dart';
import '../../../widgets/lignes_document_editeur.dart';
import '../../../widgets/statut_bar.dart';

class AvoirAchatDetailPage extends ConsumerStatefulWidget {
  const AvoirAchatDetailPage({super.key, required this.avoirId});

  final String avoirId;

  @override
  ConsumerState<AvoirAchatDetailPage> createState() => _AvoirAchatDetailPageState();
}

class _AvoirAchatDetailPageState extends ConsumerState<AvoirAchatDetailPage> {
  AvoirAchat? _avoir;
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
    final repo = ref.read(avoirAchatRepositoryProvider);
    final avoir = await repo.rafraichir(widget.avoirId);
    final lignesDb = await repo.chargerLignes(widget.avoirId);
    final tauxTva = await ref.read(tauxTvaListProvider.future);

    setState(() {
      _avoir = avoir;
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
          ),
      ];
      _chargement = false;
    });
  }

  bool get _modifiable => _avoir?.statut == StatutDocument.brouillon;

  Future<void> _enregistrer() async {
    setState(() => _enCours = true);
    try {
      await ref.read(avoirAchatRepositoryProvider).remplacerLignes(widget.avoirId, _lignes);
      await _charger();
      ref.read(avoirAchatListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Enregistrement impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _valider() async {
    if (_lignes.isEmpty) {
      setState(() => _erreur = "L'avoir ne contient aucune ligne.");
      return;
    }
    setState(() => _enCours = true);
    try {
      await ref.read(avoirAchatRepositoryProvider).remplacerLignes(widget.avoirId, _lignes);
      await ref.read(avoirAchatRepositoryProvider).valider(widget.avoirId);
      await _charger();
      ref.read(avoirAchatListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Validation impossible : $e');
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
    if (_chargement || _avoir == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final avoir = _avoir!;
    final tiersAsync = ref.watch(tiersListProvider);
    final fournisseurNom = tiersAsync.value?.firstWhere((t) => t.id == avoir.fournisseurId).raisonSociale ?? '…';

    return Scaffold(
      appBar: AppBar(title: Text(avoir.numero ?? 'Avoir brouillon')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  StatutBar(etat: _etatStatutBar(avoir.statut), hauteur: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fournisseurNom, style: AppText.sousTitre),
                        Text(
                          '${avoir.statut.libelle} · ${Formatters.date.format(avoir.dateAvoir)}',
                          style: AppText.corps,
                        ),
                        Text('Motif : ${avoir.motif}', style: AppText.corps),
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
              if (_modifiable)
                Wrap(
                  spacing: 8,
                  children: [
                    OutlinedButton(
                      onPressed: _enCours ? null : _enregistrer,
                      child: const Text('Enregistrer le brouillon'),
                    ),
                    FilledButton(onPressed: _enCours ? null : _valider, child: const Text("Valider l'avoir")),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
