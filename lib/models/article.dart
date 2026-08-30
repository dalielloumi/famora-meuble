import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

enum TypeArticle {
  @JsonValue('MATIERE_PREMIERE')
  matierePremiere,
  @JsonValue('COMPOSANT')
  composant,
  @JsonValue('PRODUIT_FINI')
  produitFini,
  @JsonValue('SERVICE')
  service,
}

extension TypeArticleLibelle on TypeArticle {
  String get libelle => switch (this) {
    TypeArticle.matierePremiere => 'Matière première',
    TypeArticle.composant => 'Composant',
    TypeArticle.produitFini => 'Produit fini',
    TypeArticle.service => 'Service',
  };
}

class DecimalConverter implements JsonConverter<Decimal, Object?> {
  const DecimalConverter();

  @override
  Decimal fromJson(Object? json) => Decimal.parse('$json');

  @override
  Object? toJson(Decimal object) => object.toString();
}

@freezed
abstract class Article with _$Article {
  const factory Article({
    String? id,
    required String reference,
    required String designation,
    @JsonKey(name: 'famille_id') String? familleId,
    @JsonKey(name: 'type_article') required TypeArticle typeArticle,
    @JsonKey(name: 'unite_id') required String uniteId,
    @JsonKey(name: 'gere_stock') @Default(true) bool gereStock,
    @DecimalConverter() @JsonKey(name: 'prix_achat_standard') required Decimal prixAchatStandard,
    @DecimalConverter() @JsonKey(name: 'prix_vente_ht') required Decimal prixVenteHt,
    @JsonKey(name: 'taux_tva_id') required String tauxTvaId,
    @DecimalConverter() @JsonKey(name: 'seuil_alerte') required Decimal seuilAlerte,
    @Default(true) bool actif,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}
