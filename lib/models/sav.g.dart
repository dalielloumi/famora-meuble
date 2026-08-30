// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sav.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sav _$SavFromJson(Map<String, dynamic> json) => _Sav(
  id: json['id'] as String?,
  numero: json['numero'] as String?,
  clientId: json['client_id'] as String,
  articleId: json['article_id'] as String?,
  factureVenteId: json['facture_vente_id'] as String?,
  blId: json['bl_id'] as String?,
  dateOuverture: DateTime.parse(json['date_ouverture'] as String),
  descriptionProbleme: json['description_probleme'] as String,
  typeIntervention: $enumDecodeNullable(
    _$TypeInterventionSavEnumMap,
    json['type_intervention'],
  ),
  statut:
      $enumDecodeNullable(_$StatutSavEnumMap, json['statut']) ??
      StatutSav.ouvert,
  dateCloture: json['date_cloture'] == null
      ? null
      : DateTime.parse(json['date_cloture'] as String),
  cout: const DecimalConverter().fromJson(json['cout']),
);

Map<String, dynamic> _$SavToJson(_Sav instance) => <String, dynamic>{
  'id': instance.id,
  'numero': instance.numero,
  'client_id': instance.clientId,
  'article_id': instance.articleId,
  'facture_vente_id': instance.factureVenteId,
  'bl_id': instance.blId,
  'date_ouverture': instance.dateOuverture.toIso8601String(),
  'description_probleme': instance.descriptionProbleme,
  'type_intervention': _$TypeInterventionSavEnumMap[instance.typeIntervention],
  'statut': _$StatutSavEnumMap[instance.statut]!,
  'date_cloture': instance.dateCloture?.toIso8601String(),
  'cout': const DecimalConverter().toJson(instance.cout),
};

const _$TypeInterventionSavEnumMap = {
  TypeInterventionSav.reparation: 'REPARATION',
  TypeInterventionSav.echange: 'ECHANGE',
  TypeInterventionSav.remboursement: 'REMBOURSEMENT',
};

const _$StatutSavEnumMap = {
  StatutSav.ouvert: 'OUVERT',
  StatutSav.enCours: 'EN_COURS',
  StatutSav.resolu: 'RESOLU',
  StatutSav.ferme: 'FERME',
};

_SavIntervention _$SavInterventionFromJson(Map<String, dynamic> json) =>
    _SavIntervention(
      id: json['id'] as String?,
      savId: json['sav_id'] as String,
      dateIntervention: DateTime.parse(json['date_intervention'] as String),
      description: json['description'] as String,
      cout: const DecimalConverter().fromJson(json['cout']),
    );

Map<String, dynamic> _$SavInterventionToJson(_SavIntervention instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sav_id': instance.savId,
      'date_intervention': instance.dateIntervention.toIso8601String(),
      'description': instance.description,
      'cout': const DecimalConverter().toJson(instance.cout),
    };
