// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Article _$ArticleFromJson(Map<String, dynamic> json) => _Article(
  id: json['id'] as String?,
  reference: json['reference'] as String,
  designation: json['designation'] as String,
  familleId: json['famille_id'] as String?,
  typeArticle: $enumDecode(_$TypeArticleEnumMap, json['type_article']),
  uniteId: json['unite_id'] as String,
  gereStock: json['gere_stock'] as bool? ?? true,
  prixAchatStandard: const DecimalConverter().fromJson(
    json['prix_achat_standard'],
  ),
  prixVenteHt: const DecimalConverter().fromJson(json['prix_vente_ht']),
  tauxTvaId: json['taux_tva_id'] as String,
  seuilAlerte: const DecimalConverter().fromJson(json['seuil_alerte']),
  actif: json['actif'] as bool? ?? true,
);

Map<String, dynamic> _$ArticleToJson(_Article instance) => <String, dynamic>{
  'id': instance.id,
  'reference': instance.reference,
  'designation': instance.designation,
  'famille_id': instance.familleId,
  'type_article': _$TypeArticleEnumMap[instance.typeArticle]!,
  'unite_id': instance.uniteId,
  'gere_stock': instance.gereStock,
  'prix_achat_standard': const DecimalConverter().toJson(
    instance.prixAchatStandard,
  ),
  'prix_vente_ht': const DecimalConverter().toJson(instance.prixVenteHt),
  'taux_tva_id': instance.tauxTvaId,
  'seuil_alerte': const DecimalConverter().toJson(instance.seuilAlerte),
  'actif': instance.actif,
};

const _$TypeArticleEnumMap = {
  TypeArticle.matierePremiere: 'MATIERE_PREMIERE',
  TypeArticle.composant: 'COMPOSANT',
  TypeArticle.produitFini: 'PRODUIT_FINI',
  TypeArticle.service: 'SERVICE',
};
