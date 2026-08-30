// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Depot _$DepotFromJson(Map<String, dynamic> json) => _Depot(
  id: json['id'] as String?,
  code: json['code'] as String,
  libelle: json['libelle'] as String,
  type: $enumDecode(_$TypeDepotEnumMap, json['type']),
  adresse: json['adresse'] as String?,
  actif: json['actif'] as bool? ?? true,
);

Map<String, dynamic> _$DepotToJson(_Depot instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'libelle': instance.libelle,
  'type': _$TypeDepotEnumMap[instance.type]!,
  'adresse': instance.adresse,
  'actif': instance.actif,
};

const _$TypeDepotEnumMap = {
  TypeDepot.magasin: 'MAGASIN',
  TypeDepot.atelier: 'ATELIER',
  TypeDepot.autre: 'AUTRE',
};
