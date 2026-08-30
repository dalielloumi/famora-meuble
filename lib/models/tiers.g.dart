// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tiers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tiers _$TiersFromJson(Map<String, dynamic> json) => _Tiers(
  id: json['id'] as String?,
  type: $enumDecode(_$TypeTiersEnumMap, json['type']),
  code: json['code'] as String,
  raisonSociale: json['raison_sociale'] as String,
  matriculeFiscal: json['matricule_fiscal'] as String?,
  adresse: json['adresse'] as String?,
  ville: json['ville'] as String?,
  telephone: json['telephone'] as String?,
  email: json['email'] as String?,
  tauxRetenueSource: const DecimalConverter().fromJson(
    json['taux_retenue_source'],
  ),
  plafondCredit: const DecimalConverter().fromJson(json['plafond_credit']),
  solde: const DecimalConverter().fromJson(json['solde']),
  actif: json['actif'] as bool? ?? true,
);

Map<String, dynamic> _$TiersToJson(_Tiers instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$TypeTiersEnumMap[instance.type]!,
  'code': instance.code,
  'raison_sociale': instance.raisonSociale,
  'matricule_fiscal': instance.matriculeFiscal,
  'adresse': instance.adresse,
  'ville': instance.ville,
  'telephone': instance.telephone,
  'email': instance.email,
  'taux_retenue_source': const DecimalConverter().toJson(
    instance.tauxRetenueSource,
  ),
  'plafond_credit': const DecimalConverter().toJson(instance.plafondCredit),
  'solde': const DecimalConverter().toJson(instance.solde),
  'actif': instance.actif,
};

const _$TypeTiersEnumMap = {
  TypeTiers.client: 'CLIENT',
  TypeTiers.fournisseur: 'FOURNISSEUR',
  TypeTiers.lesDeux: 'LES_DEUX',
};
