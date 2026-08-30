import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/livraison.dart';
import '../../../providers/livraison_sav_providers.dart';

class TourneeDetailPage extends ConsumerStatefulWidget {
  const TourneeDetailPage({super.key, required this.tourneeId});

  final String tourneeId;

  @override
  ConsumerState<TourneeDetailPage> createState() => _TourneeDetailPageState();
}

class _TourneeDetailPageState extends ConsumerState<TourneeDetailPage> {
  TourneeLivraison? _tournee;
  List<TourneeLivraisonLigne> _lignes = [];
  List<Map<String, dynamic>> _blDisponibles = [];
  bool _chargement = true;
  String? _erreur;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    setState(() => _chargement = true);
    final repo = ref.read(livraisonRepositoryProvider);
    final tournees = await repo.lister();
    final tournee = tournees.firstWhere((t) => t.id == widget.tourneeId);
    final lignes = await repo.chargerLignes(widget.tourneeId);
    final disponibles = await repo.blDisponibles();
    setState(() {
      _tournee = tournee;
      _lignes = lignes;
      _blDisponibles = disponibles;
      _chargement = false;
    });
  }

  Future<void> _ajouterBl(String blId) async {
    try {
      await ref.read(livraisonRepositoryProvider).ajouterBl(widget.tourneeId, blId, _lignes.length);
      await _charger();
      ref.read(tourneesProvider.notifier).rafraichir();
    } catch (e) {
      setState(() => _erreur = 'Ajout impossible : $e');
    }
  }

  Future<void> _marquerStatut(String ligneId, StatutLivraisonLigne statut) async {
    await ref.read(livraisonRepositoryProvider).marquerStatutLigne(ligneId, statut);
    await _charger();
  }

  @override
  Widget build(BuildContext context) {
    if (_chargement || _tournee == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final tournee = _tournee!;

    return Scaffold(
      appBar: AppBar(title: Text(tournee.numero ?? 'Tournée')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${tournee.statut.libelle} · ${Formatters.date.format(tournee.dateTournee)}'
                '${tournee.chauffeur != null ? ' · ${tournee.chauffeur}' : ''}',
                style: AppText.corps,
              ),
              const SizedBox(height: 20),
              Text('Bons de livraison', style: AppText.sousTitre),
              const SizedBox(height: 8),
              if (_lignes.isEmpty) Text('Aucun BL dans cette tournée.', style: AppText.corps),
              for (final l in _lignes)
                Card(
                  child: ListTile(
                    title: Text('BL — ${l.statut.libelle}'),
                    trailing: l.statut == StatutLivraisonLigne.prevue
                        ? Wrap(
                            spacing: 4,
                            children: [
                              TextButton(
                                onPressed: () => _marquerStatut(l.id!, StatutLivraisonLigne.livree),
                                child: const Text('Livrée'),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(foregroundColor: AppColors.alerte),
                                onPressed: () => _marquerStatut(l.id!, StatutLivraisonLigne.echec),
                                child: const Text('Échec'),
                              ),
                            ],
                          )
                        : null,
                  ),
                ),
              const SizedBox(height: 20),
              Text('Ajouter un BL validé', style: AppText.sousTitre),
              const SizedBox(height: 8),
              if (_blDisponibles.isEmpty) Text('Aucun BL disponible.', style: AppText.corps),
              for (final bl in _blDisponibles)
                Card(
                  child: ListTile(
                    title: Text(bl['numero'] as String? ?? 'BL'),
                    subtitle: Text(Formatters.date.format(DateTime.parse(bl['date_bl'] as String))),
                    trailing: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => _ajouterBl(bl['id'] as String),
                    ),
                  ),
                ),
              if (_erreur != null) ...[
                const SizedBox(height: 12),
                Text(_erreur!, style: const TextStyle(color: AppColors.alerte)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
