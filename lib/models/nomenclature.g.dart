// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nomenclature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Nomenclature _$NomenclatureFromJson(Map<String, dynamic> json) =>
    _Nomenclature(
      id: json['id'] as String?,
      articleId: json['article_id'] as String,
      version: (json['version'] as num?)?.toInt() ?? 1,
      actif: json['actif'] as bool? ?? true,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$NomenclatureToJson(_Nomenclature instance) =>
    <String, dynamic>{
      'id': instance.id,
      'article_id': instance.articleId,
      'version': instance.version,
      'actif': instance.actif,
      'notes': instance.notes,
    };

_NomenclatureLigne _$NomenclatureLigneFromJson(Map<String, dynamic> json) =>
    _NomenclatureLigne(
      id: json['id'] as String?,
      nomenclatureId: json['nomenclature_id'] as String,
      composantId: json['composant_id'] as String,
      quantite: const DecimalConverter().fromJson(json['quantite']),
      uniteId: json['unite_id'] as String,
      ordre: (json['ordre'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NomenclatureLigneToJson(_NomenclatureLigne instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nomenclature_id': instance.nomenclatureId,
      'composant_id': instance.composantId,
      'quantite': const DecimalConverter().toJson(instance.quantite),
      'unite_id': instance.uniteId,
      'ordre': instance.ordre,
    };
