import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/utils/formatters.dart';
import '../../../models/article.dart';
import '../../../models/famille_article.dart';
import '../../../models/stock.dart';
import '../../../providers/article_providers.dart';
import '../../../providers/famille_article_providers.dart';
import '../../../providers/stock_providers.dart';
import '../../parametres/articles/article_formulaire.dart';

/// Catalogue produits façon carte — écran principal du module (remplace la
/// consultation brute du stock comme vue par défaut). Reprend le motif de la
/// maquette FAMORA MEUBLE : recherche, filtres par catégorie (famille
/// d'article), cartes avec icône, prix et statut de stock coloré.
class ProduitsCataloguePage extends ConsumerStatefulWidget {
  const ProduitsCataloguePage({super.key});

  @override
  ConsumerState<ProduitsCataloguePage> createState() => _ProduitsCataloguePageState();
}

class _ProduitsCataloguePageState extends ConsumerState<ProduitsCataloguePage> {
  final _rechercheControleur = TextEditingController();
  String _recherche = '';
  String? _filtreFamilleId;

  @override
  void dispose() {
    _rechercheControleur.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final articlesAsync = ref.watch(articlesProvider);
    final stockAsync = ref.watch(stockListeProvider);
    final famillesAsync = ref.watch(famillesArticleProvider);

    return Scaffold(
      backgroundColor: AppColors.fond,
      body: articlesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e', style: const TextStyle(color: AppColors.alerte))),
        data: (articles) {
          final stockParArticle = <String, Decimal>{};
          for (final s in stockAsync.value ?? <StockLigne>[]) {
            stockParArticle[s.articleId] = (stockParArticle[s.articleId] ?? Decimal.zero) + s.quantite;
          }
          final famillesParId = {for (final f in famillesAsync.value ?? <FamilleArticle>[]) f.id!: f};

          final filtres = articles.where((a) {
            if (!a.actif) return false;
            if (_filtreFamilleId != null && a.familleId != _filtreFamilleId) return false;
            if (_recherche.isEmpty) return true;
            final r = _recherche.toLowerCase();
            return a.designation.toLowerCase().contains(r) || a.reference.toLowerCase().contains(r);
          }).toList()..sort((a, b) => a.designation.compareTo(b.designation));

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                child: TextField(
                  controller: _rechercheControleur,
                  style: AppText.corps,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 18),
                    hintText: 'Rechercher produit...',
                  ),
                  onChanged: (v) => setState(() => _recherche = v),
                ),
              ),
              SizedBox(
                height: 44,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    _puceFiltre('Tous', _filtreFamilleId == null, () => setState(() => _filtreFamilleId = null)),
                    const SizedBox(width: 8),
                    for (final f in famillesAsync.value ?? <FamilleArticle>[]) ...[
                      _puceFiltre(
                        f.libelle,
                        _filtreFamilleId == f.id,
                        () => setState(() => _filtreFamilleId = f.id),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: filtres.isEmpty
                    ? Center(child: Text('Aucun produit trouvé', style: AppText.corps))
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 90),
                        itemCount: filtres.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemBuilder: (context, index) => _CarteProduit(
                          article: filtres[index],
                          famille: famillesParId[filtres[index].familleId],
                          quantiteStock: stockParArticle[filtres[index].id] ?? Decimal.zero,
                          onTap: () => ouvrirFormulaireArticle(context, article: filtres[index]),
                        ),
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ouvrirFormulaireArticle(context),
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }

  Widget _puceFiltre(String libelle, bool actif, VoidCallback onTap) {
    return ChoiceChip(
      label: Text(libelle),
      selected: actif,
      onSelected: (_) => onTap(),
      selectedColor: AppColors.accent,
      labelStyle: AppText.corps.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: actif ? Colors.white : AppColors.texteMoyen,
      ),
      backgroundColor: AppColors.surface,
      side: BorderSide(color: actif ? AppColors.accent : AppColors.bordure, width: 1.5),
    );
  }
}

const _emojiParFamille = {
  'SALON': '🛋️',
  'CHAMBRE': '🛏️',
  'BUREAU': '🖥️',
  'CUISINE': '🍳',
  'SALLE_A_MANGER': '🍽️',
  'RANGEMENT': '📦',
  'ACCESSOIRE': '🧷',
};

String _emojiPourFamille(FamilleArticle? famille) => _emojiParFamille[famille?.code] ?? '🪑';

class _CarteProduit extends StatelessWidget {
  const _CarteProduit({
    required this.article,
    required this.famille,
    required this.quantiteStock,
    required this.onTap,
  });

  final Article article;
  final FamilleArticle? famille;
  final Decimal quantiteStock;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color couleurStatut;
    final String libelleStatut;
    if (!article.gereStock) {
      couleurStatut = AppColors.texteAttenue;
      libelleStatut = '—';
    } else if (quantiteStock <= Decimal.zero) {
      couleurStatut = AppColors.alerte;
      libelleStatut = '⚠ Rupture';
    } else if (quantiteStock <= article.seuilAlerte) {
      couleurStatut = AppColors.attente;
      libelleStatut = '⚠ Stock bas (${Formatters.quantite(quantiteStock)})';
    } else {
      couleurStatut = AppColors.succes;
      libelleStatut = '✓ Stock : ${Formatters.quantite(quantiteStock)}';
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.bordure),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: AppColors.fondFonce, borderRadius: BorderRadius.circular(12)),
              alignment: Alignment.center,
              child: Text(_emojiPourFamille(famille), style: const TextStyle(fontSize: 22)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.designation, style: AppText.corps.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(
                    '${famille?.libelle ?? article.typeArticle.libelle} · ${article.reference}',
                    style: AppText.corps.copyWith(fontSize: 12, color: AppColors.texteAttenue),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Formatters.montant(article.prixVenteHt),
                  style: AppText.montantVitrine.copyWith(fontSize: 15, color: AppColors.accent),
                ),
                const SizedBox(height: 2),
                Text(libelleStatut, style: AppText.corps.copyWith(fontSize: 10.5, color: couleurStatut)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
