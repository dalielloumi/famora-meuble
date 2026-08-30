// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'societe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Societe _$SocieteFromJson(Map<String, dynamic> json) => _Societe(
  raisonSociale: json['raison_sociale'] as String,
  matriculeFiscal: json['matricule_fiscal'] as String,
  adresse: json['adresse'] as String,
  timbreFiscal: const DecimalConverter().fromJson(json['timbre_fiscal']),
  tauxFodec: const DecimalConverter().fromJson(json['taux_fodec']),
  telephone: json['telephone'] as String?,
  logoUrl: json['logo_url'] as String?,
);

Map<String, dynamic> _$SocieteToJson(_Societe instance) => <String, dynamic>{
  'raison_sociale': instance.raisonSociale,
  'matricule_fiscal': instance.matriculeFiscal,
  'adresse': instance.adresse,
  'timbre_fiscal': const DecimalConverter().toJson(instance.timbreFiscal),
  'taux_fodec': const DecimalConverter().toJson(instance.tauxFodec),
  'telephone': instance.telephone,
  'logo_url': instance.logoUrl,
};
