import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/responsive/breakpoints.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text.dart';
import '../../core/utils/formatters.dart';
import '../../providers/auth_providers.dart';
import '../../providers/dashboard_providers.dart';
import '../../providers/ventes_providers.dart';
import '../../widgets/stat_tile.dart';
import '../ventes/bl/bl_detail_page.dart';
import '../ventes/bl/bl_entete_formulaire.dart';
import '../ventes/commandes/commande_client_detail_page.dart';
import '../ventes/commandes/commande_client_entete_formulaire.dart';
import '../ventes/devis/devis_detail_page.dart';
import '../ventes/devis/devis_entete_formulaire.dart';
import '../ventes/factures/facture_vente_detail_page.dart';
import '../ventes/factures/facture_vente_entete_formulaire.dart';

Future<void> _nouveauDevis(BuildContext context, WidgetRef ref) async {
  final devis = await ouvrirCreationDevis(context, ref);
  ref.read(devisListeProvider.notifier).rafraichir();
  if (devis != null && context.mounted) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DevisDetailPage(devisId: devis.id!)));
  }
}

Future<void> _nouvelleFacture(BuildContext context, WidgetRef ref) async {
  final facture = await ouvrirCreationFactureVente(context, ref);
  ref.read(factureVenteListeProvider.notifier).rafraichir();
  if (facture != null && context.mounted) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => FactureVenteDetailPage(factureId: facture.id!)));
  }
}

Future<void> _nouveauBl(BuildContext context, WidgetRef ref) async {
  final bl = await ouvrirCreationBl(context, ref);
  ref.read(blListeProvider.notifier).rafraichir();
  if (bl != null && context.mounted) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => BlDetailPage(blId: bl.id!)));
  }
}

Future<void> _nouvelleCommande(BuildContext context, WidgetRef ref) async {
  final commande = await ouvrirCreationCommandeClient(context, ref);
  ref.read(commandeClientListeProvider.notifier).rafraichir();
  if (commande != null && context.mounted) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => CommandeClientDetailPage(commandeId: commande.id!)));
  }
}

class TableauBordPage extends ConsumerWidget {
  const TableauBordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estDesktop = Breakpoints.estDesktop(context);
    final profil = ref.watch(profilCourantProvider).valueOrNull;
    final statsAsync = ref.watch(tableauBordProvider);

    return statsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Erreur : $e', style: const TextStyle(color: AppColors.alerte))),
      data: (stats) => estDesktop
          ? _TableauBordDesktop(prenom: profil?.prenom, stats: stats)
          : _TableauBordMobile(prenom: profil?.prenom, stats: stats),
    );
  }
}

// ============================================================================
// DESKTOP — grille de cartes, pas de chrome décoratif (la NavigationRail
// porte déjà l'identité de marque).
// ============================================================================

class _TableauBordDesktop extends ConsumerWidget {
  const _TableauBordDesktop({required this.prenom, required this.stats});

  final String? prenom;
  final TableauBordStats stats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(prenom == null ? 'Tableau de bord' : 'Bonjour $prenom', style: AppText.titre),
          const SizedBox(height: 4),
          Text("Vue d'ensemble de l'activité.", style: AppText.corps),
          const SizedBox(height: 20),
          Text('Actions rapides', style: AppText.sousTitre),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              FilledButton.icon(
                onPressed: () => _nouvelleFacture(context, ref),
                icon: const Text('🧾'),
                label: const Text('Nouvelle facture'),
              ),
              OutlinedButton.icon(
                onPressed: () => _nouveauDevis(context, ref),
                icon: const Text('📋'),
                label: const Text('Nouveau devis'),
              ),
              OutlinedButton.icon(
                onPressed: () => _nouveauBl(context, ref),
                icon: const Text('🚚'),
                label: const Text('Nouveau BL'),
              ),
              OutlinedButton.icon(
                onPressed: () => _nouvelleCommande(context, ref),
                icon: const Text('🛒'),
                label: const Text('Nouvelle commande'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              StatTile(libelle: 'CA du mois', valeur: Formatters.montant(stats.caMois), accent: AppColors.succes),
              StatTile(
                libelle: 'Impayés (${stats.nombreFacturesImpayees})',
                valeur: Formatters.montant(stats.montantImpaye),
                accent: AppColors.alerte,
              ),
              StatTile(libelle: 'Clients actifs', valeur: '${stats.nombreClients}', accent: AppColors.accent),
              StatTile(libelle: 'Devis en attente', valeur: '${stats.devisEnAttente}', accent: AppColors.attente),
              StatTile(libelle: 'Commandes en cours', valeur: '${stats.commandesEnCours}', accent: AppColors.accent),
              StatTile(libelle: 'OF en cours', valeur: '${stats.ofEnCours}', accent: AppColors.accent),
              StatTile(
                libelle: 'Articles en alerte stock',
                valeur: '${stats.articlesEnAlerte}',
                accent: stats.articlesEnAlerte > 0 ? AppColors.alerte : AppColors.succes,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text('Chiffre d\'affaires (6 derniers mois)', style: AppText.sousTitre),
          const SizedBox(height: 12),
          Container(
            constraints: const BoxConstraints(maxWidth: 520),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.bordure),
            ),
            child: _MiniChart(donnees: stats.activiteMensuelle),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// MOBILE — en-tête vert forêt avec pastilles, actions rapides, cartes
// d'alerte, mini graphique (identité FAMORA MEUBLE).
// ============================================================================

class _TableauBordMobile extends ConsumerWidget {
  const _TableauBordMobile({required this.prenom, required this.stats});

  final String? prenom;
  final TableauBordStats stats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _EnteteAccueil(prenom: prenom, stats: stats),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Actions rapides', style: AppText.sousTitre),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.85,
              children: [
                _ActionRapide(
                  emoji: '🧾',
                  couleurFond: AppColors.succesPale,
                  libelle: 'Facture',
                  onTap: () => _nouvelleFacture(context, ref),
                ),
                _ActionRapide(
                  emoji: '📋',
                  couleurFond: AppColors.infoPale,
                  libelle: 'Devis',
                  onTap: () => _nouveauDevis(context, ref),
                ),
                _ActionRapide(
                  emoji: '🚚',
                  couleurFond: AppColors.orPale,
                  libelle: 'Livraison',
                  onTap: () => _nouveauBl(context, ref),
                ),
                _ActionRapide(
                  emoji: '🛒',
                  couleurFond: AppColors.attentePale,
                  libelle: 'Commande',
                  onTap: () => _nouvelleCommande(context, ref),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('À surveiller', style: AppText.sousTitre),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.5,
              children: [
                _CarteAlerte(
                  libelle: 'Impayés',
                  valeur: '${stats.nombreFacturesImpayees}',
                  sousValeur: Formatters.montant(stats.montantImpaye),
                  couleur: AppColors.alerte,
                ),
                _CarteAlerte(
                  libelle: 'Devis en attente',
                  valeur: '${stats.devisEnAttente}',
                  couleur: AppColors.attente,
                ),
                _CarteAlerte(
                  libelle: 'Commandes en cours',
                  valeur: '${stats.commandesEnCours}',
                  couleur: AppColors.accent,
                ),
                _CarteAlerte(
                  libelle: 'Stock en alerte',
                  valeur: '${stats.articlesEnAlerte}',
                  couleur: stats.articlesEnAlerte > 0 ? AppColors.alerte : AppColors.succes,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Activité (6 mois)', style: AppText.sousTitre),
          ),
          const SizedBox(height: 12),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.bordure),
            ),
            child: _MiniChart(donnees: stats.activiteMensuelle),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _EnteteAccueil extends StatelessWidget {
  const _EnteteAccueil({required this.prenom, required this.stats});

  final String? prenom;
  final TableauBordStats stats;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
      child: Container(
        color: AppColors.accent,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: -30,
              top: -30,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.or.withValues(alpha: 0.12)),
              ),
            ),
            Positioned(
              right: 20,
              top: 10,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.or.withValues(alpha: 0.08)),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FAMORA',
                  style: AppText.affichage.copyWith(
                    color: AppColors.orClair,
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  'MEUBLE',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.4),
                    fontSize: 9,
                    letterSpacing: 3.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  prenom == null ? 'Tableau de bord' : 'Bonjour, $prenom',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _PastilleStat(valeur: Formatters.montant(stats.caMois, suffixe: ''), libelle: 'CA (TND)'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _PastilleStat(valeur: '${stats.nombreFacturesMois}', libelle: 'Factures'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _PastilleStat(valeur: '${stats.nombreClients}', libelle: 'Clients'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PastilleStat extends StatelessWidget {
  const _PastilleStat({required this.valeur, required this.libelle});

  final String valeur;
  final String libelle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            valeur,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppText.affichage.copyWith(color: AppColors.orClair, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 2),
          Text(
            libelle.toUpperCase(),
            style: TextStyle(color: Colors.white.withValues(alpha: 0.45), fontSize: 8.5, letterSpacing: 0.6),
          ),
        ],
      ),
    );
  }
}

class _ActionRapide extends StatelessWidget {
  const _ActionRapide({
    required this.emoji,
    required this.couleurFond,
    required this.libelle,
    required this.onTap,
  });

  final String emoji;
  final Color couleurFond;
  final String libelle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.bordure),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: couleurFond, borderRadius: BorderRadius.circular(12)),
              alignment: Alignment.center,
              child: Text(emoji, style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 6),
            Text(
              libelle,
              textAlign: TextAlign.center,
              style: AppText.corps.copyWith(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.texteMoyen),
            ),
          ],
        ),
      ),
    );
  }
}

class _CarteAlerte extends StatelessWidget {
  const _CarteAlerte({required this.libelle, required this.valeur, this.sousValeur, required this.couleur});

  final String libelle;
  final String valeur;
  final String? sousValeur;
  final Color couleur;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.bordure),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(valeur, style: AppText.montantVitrine.copyWith(color: couleur, fontSize: 20)),
          const SizedBox(height: 2),
          Text(libelle, style: AppText.corps.copyWith(fontSize: 11, color: AppColors.texteAttenue)),
          if (sousValeur != null) Text(sousValeur!, style: AppText.corps.copyWith(fontSize: 10, color: couleur)),
        ],
      ),
    );
  }
}

class _MiniChart extends StatelessWidget {
  const _MiniChart({required this.donnees});

  final List<MoisActivite> donnees;

  @override
  Widget build(BuildContext context) {
    final maxValeur = donnees.fold<Decimal>(
      Decimal.one,
      (m, d) => d.total > m ? d.total : m,
    );

    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final m in donnees)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: FractionallySizedBox(
                      heightFactor: (m.total / maxValeur).toDouble().clamp(0.02, 1.0),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: m.total > Decimal.zero ? AppColors.or : AppColors.bordure,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            for (final m in donnees)
              Expanded(
                child: Text(
                  m.libelle,
                  textAlign: TextAlign.center,
                  style: AppText.corps.copyWith(fontSize: 9, color: AppColors.texteAttenue),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
