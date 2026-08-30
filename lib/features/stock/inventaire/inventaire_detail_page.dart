import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/article.dart';
import '../../../models/inventaire.dart';
import '../../../providers/article_providers.dart';
import '../../../providers/depot_providers.dart';
import '../../../providers/stock_providers.dart';
import '../../../widgets/statut_bar.dart';

class InventaireDetailPage extends ConsumerStatefulWidget {
  const InventaireDetailPage({super.key, required this.inventaireId});

  final String inventaireId;

  @override
  ConsumerState<InventaireDetailPage> createState() => _InventaireDetailPageState();
}

class _InventaireDetailPageState extends ConsumerState<InventaireDetailPage> {
  Inventaire? _inventaire;
  List<InventaireLigne> _lignes = [];
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
    final repo = ref.read(inventaireRepositoryProvider);
    final inventaire = await repo.rafraichir(widget.inventaireId);
    final lignes = await repo.chargerLignes(widget.inventaireId);
    setState(() {
      _inventaire = inventaire;
      _lignes = lignes;
      _chargement = false;
    });
  }

  bool get _modifiable => _inventaire?.statut == StatutDocument.brouillon;

  Future<void> _saisirComptage(String ligneId, String texte) async {
    final valeur = Decimal.tryParse(texte.replaceAll(',', '.'));
    if (valeur == null) return;
    await ref.read(inventaireRepositoryProvider).saisirComptage(ligneId, valeur.toString());
  }

  Future<void> _valider() async {
    setState(() => _enCours = true);
    try {
      await ref.read(inventaireRepositoryProvider).valider(widget.inventaireId);
      await _charger();
      ref.read(inventaireListeProvider.notifier).rafraichir();
      ref.read(stockListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Validation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _annuler() async {
    setState(() => _enCours = true);
    try {
      await ref.read(inventaireRepositoryProvider).annuler(widget.inventaireId);
      await _charger();
      ref.read(inventaireListeProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Annulation impossible : $e');
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
    if (_chargement || _inventaire == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final inventaire = _inventaire!;
    final articlesAsync = ref.watch(articlesProvider);
    final depotsAsync = ref.watch(depotsProvider);
    final articlesParId = {for (final a in articlesAsync.value ?? <Article>[]) a.id!: a};
    final depotNom = depotsAsync.value?.firstWhere((d) => d.id == inventaire.depotId).libelle ?? '…';

    return Scaffold(
      appBar: AppBar(title: Text(inventaire.numero ?? 'Inventaire brouillon')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                StatutBar(etat: _etatStatutBar(inventaire.statut), hauteur: 40),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(depotNom, style: AppText.sousTitre),
                      Text(
                        '${inventaire.statut.libelle} · ${Formatters.date.format(inventaire.dateInventaire)}',
                        style: AppText.corps,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (_erreur != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(_erreur!, style: const TextStyle(color: AppColors.alerte)),
            ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _lignes.length,
              separatorBuilder: (context, index) => const Divider(height: 1, color: AppColors.bordure),
              itemBuilder: (context, index) {
                final l = _lignes[index];
                final nom = articlesParId[l.articleId]?.designation ?? l.articleId;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: Text(nom, style: AppText.corps)),
                      Expanded(
                        child: Text('Théo. ${Formatters.quantite(l.quantiteTheorique)}', style: AppText.corps),
                      ),
                      Expanded(
                        child: _modifiable
                            ? TextFormField(
                                key: ValueKey(l.id),
                                initialValue: l.quantiteComptee?.toString() ?? '',
                                decoration: const InputDecoration(labelText: 'Comptée', isDense: true),
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                onFieldSubmitted: (texte) => _saisirComptage(l.id!, texte),
                              )
                            : Text(l.quantiteComptee?.toString() ?? '—', style: AppText.corps),
                      ),
                      Expanded(
                        child: Text(
                          'Écart ${Formatters.quantite(l.ecart)}',
                          style: AppText.corps.copyWith(
                            color: l.ecart == Decimal.zero ? AppColors.texte : AppColors.attente,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              spacing: 8,
              children: [
                if (_modifiable) ...[
                  OutlinedButton(onPressed: _chargement ? null : _charger, child: const Text('Rafraîchir')),
                  FilledButton(onPressed: _enCours ? null : _valider, child: const Text("Valider l'inventaire")),
                  OutlinedButton(
                    onPressed: _enCours ? null : _annuler,
                    style: OutlinedButton.styleFrom(foregroundColor: AppColors.alerte),
                    child: const Text('Annuler'),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
