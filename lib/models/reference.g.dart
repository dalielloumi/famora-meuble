// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UniteMesure _$UniteMesureFromJson(Map<String, dynamic> json) => _UniteMesure(
  id: json['id'] as String,
  code: json['code'] as String,
  libelle: json['libelle'] as String,
);

Map<String, dynamic> _$UniteMesureToJson(_UniteMesure instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'libelle': instance.libelle,
    };

_TauxTva _$TauxTvaFromJson(Map<String, dynamic> json) => _TauxTva(
  id: json['id'] as String,
  code: json['code'] as String,
  taux: json['taux'] as num,
  libelle: json['libelle'] as String,
);

Map<String, dynamic> _$TauxTvaToJson(_TauxTva instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'taux': instance.taux,
  'libelle': instance.libelle,
};
