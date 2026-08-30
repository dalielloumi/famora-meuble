// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'famille_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FamilleArticle _$FamilleArticleFromJson(Map<String, dynamic> json) =>
    _FamilleArticle(
      id: json['id'] as String?,
      code: json['code'] as String,
      libelle: json['libelle'] as String,
      parentId: json['parent_id'] as String?,
    );

Map<String, dynamic> _$FamilleArticleToJson(_FamilleArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'libelle': instance.libelle,
      'parent_id': instance.parentId,
    };
