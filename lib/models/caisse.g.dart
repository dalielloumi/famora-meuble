// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caisse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Caisse _$CaisseFromJson(Map<String, dynamic> json) => _Caisse(
  id: json['id'] as String?,
  libelle: json['libelle'] as String,
  solde: const DecimalConverter().fromJson(json['solde']),
  actif: json['actif'] as bool? ?? true,
);

Map<String, dynamic> _$CaisseToJson(_Caisse instance) => <String, dynamic>{
  'id': instance.id,
  'libelle': instance.libelle,
  'solde': const DecimalConverter().toJson(instance.solde),
  'actif': instance.actif,
};

_CaisseOperation _$CaisseOperationFromJson(Map<String, dynamic> json) =>
    _CaisseOperation(
      id: json['id'] as String?,
      caisseId: json['caisse_id'] as String,
      sens: $enumDecode(_$SensReglementEnumMap, json['sens']),
      montant: const DecimalConverter().fromJson(json['montant']),
      dateOperation: DateTime.parse(json['date_operation'] as String),
      reglementId: json['reglement_id'] as String?,
      libelle: json['libelle'] as String,
    );

Map<String, dynamic> _$CaisseOperationToJson(_CaisseOperation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'caisse_id': instance.caisseId,
      'sens': _$SensReglementEnumMap[instance.sens]!,
      'montant': const DecimalConverter().toJson(instance.montant),
      'date_operation': instance.dateOperation.toIso8601String(),
      'reglement_id': instance.reglementId,
      'libelle': instance.libelle,
    };

const _$SensReglementEnumMap = {
  SensReglement.encaissement: 'ENCAISSEMENT',
  SensReglement.decaissement: 'DECAISSEMENT',
};
