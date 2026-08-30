// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockLigne _$StockLigneFromJson(Map<String, dynamic> json) => _StockLigne(
  id: json['id'] as String,
  articleId: json['article_id'] as String,
  varianteId: json['variante_id'] as String?,
  depotId: json['depot_id'] as String,
  quantite: const DecimalConverter().fromJson(json['quantite']),
  cmp: const DecimalConverter().fromJson(json['cmp']),
);

Map<String, dynamic> _$StockLigneToJson(_StockLigne instance) =>
    <String, dynamic>{
      'id': instance.id,
      'article_id': instance.articleId,
      'variante_id': instance.varianteId,
      'depot_id': instance.depotId,
      'quantite': const DecimalConverter().toJson(instance.quantite),
      'cmp': const DecimalConverter().toJson(instance.cmp),
    };

_MouvementStock _$MouvementStockFromJson(Map<String, dynamic> json) =>
    _MouvementStock(
      id: json['id'] as String?,
      articleId: json['article_id'] as String,
      varianteId: json['variante_id'] as String?,
      depotId: json['depot_id'] as String,
      typeMouvement: $enumDecode(
        _$TypeMouvementStockEnumMap,
        json['type_mouvement'],
      ),
      sens: $enumDecode(_$SensMouvementEnumMap, json['sens']),
      quantite: const DecimalConverter().fromJson(json['quantite']),
      prixUnitaire: const DecimalConverter().fromJson(json['prix_unitaire']),
      dateMouvement: DateTime.parse(json['date_mouvement'] as String),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$MouvementStockToJson(_MouvementStock instance) =>
    <String, dynamic>{
      'id': instance.id,
      'article_id': instance.articleId,
      'variante_id': instance.varianteId,
      'depot_id': instance.depotId,
      'type_mouvement': _$TypeMouvementStockEnumMap[instance.typeMouvement]!,
      'sens': _$SensMouvementEnumMap[instance.sens]!,
      'quantite': const DecimalConverter().toJson(instance.quantite),
      'prix_unitaire': const DecimalConverter().toJson(instance.prixUnitaire),
      'date_mouvement': instance.dateMouvement.toIso8601String(),
      'notes': instance.notes,
    };

const _$TypeMouvementStockEnumMap = {
  TypeMouvementStock.entreeAchat: 'ENTREE_ACHAT',
  TypeMouvementStock.sortieVente: 'SORTIE_VENTE',
  TypeMouvementStock.entreeProduction: 'ENTREE_PRODUCTION',
  TypeMouvementStock.sortieProduction: 'SORTIE_PRODUCTION',
  TypeMouvementStock.transfertEntree: 'TRANSFERT_ENTREE',
  TypeMouvementStock.transfertSortie: 'TRANSFERT_SORTIE',
  TypeMouvementStock.inventaireAjust: 'INVENTAIRE_AJUST',
  TypeMouvementStock.retourClient: 'RETOUR_CLIENT',
  TypeMouvementStock.retourFournisseur: 'RETOUR_FOURNISSEUR',
};

const _$SensMouvementEnumMap = {
  SensMouvement.entree: 'ENTREE',
  SensMouvement.sortie: 'SORTIE',
};
