import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/ordre_fabrication.dart';
import '../../../providers/article_providers.dart';
import '../../../providers/atelier_providers.dart';
import '../../../widgets/statut_bar.dart';

class OfDetailPage extends ConsumerStatefulWidget {
  const OfDetailPage({super.key, required this.ofId});

  final String ofId;

  @override
  ConsumerState<OfDetailPage> createState() => _OfDetailPageState();
}

class _OfDetailPageState extends ConsumerState<OfDetailPage> {
  OrdreFabrication? _of;
  bool _chargement = true;
  bool _enCours = false;
  String? _erreur;
  final _quantiteProduiteControleur = TextEditingController();

  @override
  void initState() {
    super.initState();
    _charger();
  }

  @override
  void dispose() {
    _quantiteProduiteControleur.dispose();
    super.dispose();
  }

  Future<void> _charger() async {
    setState(() => _chargement = true);
    final of = await ref.read(ordreFabricationRepositoryProvider).rafraichir(widget.ofId);
    setState(() {
      _of = of;
      _quantiteProduiteControleur.text = of.quantitePrevue.toString();
      _chargement = false;
    });
  }

  Future<void> _lancer() async {
    setState(() => _enCours = true);
    try {
      await ref.read(ordreFabricationRepositoryProvider).lancer(widget.ofId);
      await _charger();
      ref.read(ordresFabricationProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Lancement impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _cloturer() async {
    setState(() => _enCours = true);
    try {
      await ref
          .read(ordreFabricationRepositoryProvider)
          .cloturer(widget.ofId, quantiteProduite: _quantiteProduiteControleur.text.replaceAll(',', '.'));
      await _charger();
      ref.read(ordresFabricationProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Clôture impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  Future<void> _annuler() async {
    setState(() => _enCours = true);
    try {
      await ref.read(ordreFabricationRepositoryProvider).annuler(widget.ofId);
      await _charger();
      ref.read(ordresFabricationProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Annulation impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  EtatStatutBar _etatStatutBar(StatutOf s) => switch (s) {
    StatutOf.brouillon => EtatStatutBar.brouillon,
    StatutOf.lance => EtatStatutBar.partiel,
    StatutOf.cloture => EtatStatutBar.solde,
    StatutOf.annule => EtatStatutBar.annuleImpaye,
  };

  @override
  Widget build(BuildContext context) {
    if (_chargement || _of == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final of = _of!;
    final articlesAsync = ref.watch(articlesProvider);
    final nomArticle = articlesAsync.value?.firstWhere((a) => a.id == of.articleId).designation ?? '…';

    return Scaffold(
      appBar: AppBar(title: Text(of.numero ?? 'OF brouillon')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  StatutBar(etat: _etatStatutBar(of.statut), hauteur: 40),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nomArticle, style: AppText.sousTitre),
                        Text(
                          '${of.statut.libelle} · Prévu ${Formatters.quantite(of.quantitePrevue)}',
                          style: AppText.corps,
                        ),
                        if (of.statut == StatutOf.cloture)
                          Text('Produit : ${Formatters.quantite(of.quantiteProduite)}', style: AppText.corps),
                        if (of.coutMatiere.toDouble() > 0)
                          Text('Coût matière : ${Formatters.montant(of.coutMatiere)}', style: AppText.corps),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (of.statut == StatutOf.lance) ...[
                SizedBox(
                  width: 220,
                  child: TextField(
                    controller: _quantiteProduiteControleur,
                    decoration: const InputDecoration(labelText: 'Quantité produite'),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              if (_erreur != null) ...[
                Text(_erreur!, style: const TextStyle(color: AppColors.alerte)),
                const SizedBox(height: 12),
              ],
              Wrap(
                spacing: 8,
                children: [
                  if (of.statut == StatutOf.brouillon) ...[
                    FilledButton(onPressed: _enCours ? null : _lancer, child: const Text("Lancer l'OF")),
                    OutlinedButton(
                      onPressed: _enCours ? null : _annuler,
                      style: OutlinedButton.styleFrom(foregroundColor: AppColors.alerte),
                      child: const Text('Annuler'),
                    ),
                  ] else if (of.statut == StatutOf.lance)
                    FilledButton(onPressed: _enCours ? null : _cloturer, child: const Text("Clôturer l'OF")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
