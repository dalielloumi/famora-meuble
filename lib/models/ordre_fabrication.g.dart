// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordre_fabrication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdreFabrication _$OrdreFabricationFromJson(Map<String, dynamic> json) =>
    _OrdreFabrication(
      id: json['id'] as String?,
      numero: json['numero'] as String?,
      exerciceId: json['exercice_id'] as String,
      articleId: json['article_id'] as String,
      nomenclatureId: json['nomenclature_id'] as String,
      commandeClientLigneId: json['commande_client_ligne_id'] as String?,
      quantitePrevue: const DecimalConverter().fromJson(
        json['quantite_prevue'],
      ),
      quantiteProduite: const DecimalConverter().fromJson(
        json['quantite_produite'],
      ),
      depotSourceId: json['depot_source_id'] as String,
      depotDestinationId: json['depot_destination_id'] as String,
      statut:
          $enumDecodeNullable(_$StatutOfEnumMap, json['statut']) ??
          StatutOf.brouillon,
      dateLancement: json['date_lancement'] == null
          ? null
          : DateTime.parse(json['date_lancement'] as String),
      dateCloture: json['date_cloture'] == null
          ? null
          : DateTime.parse(json['date_cloture'] as String),
      coutMatiere: const DecimalConverter().fromJson(json['cout_matiere']),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$OrdreFabricationToJson(
  _OrdreFabrication instance,
) => <String, dynamic>{
  'id': instance.id,
  'numero': instance.numero,
  'exercice_id': instance.exerciceId,
  'article_id': instance.articleId,
  'nomenclature_id': instance.nomenclatureId,
  'commande_client_ligne_id': instance.commandeClientLigneId,
  'quantite_prevue': const DecimalConverter().toJson(instance.quantitePrevue),
  'quantite_produite': const DecimalConverter().toJson(
    instance.quantiteProduite,
  ),
  'depot_source_id': instance.depotSourceId,
  'depot_destination_id': instance.depotDestinationId,
  'statut': _$StatutOfEnumMap[instance.statut]!,
  'date_lancement': instance.dateLancement?.toIso8601String(),
  'date_cloture': instance.dateCloture?.toIso8601String(),
  'cout_matiere': const DecimalConverter().toJson(instance.coutMatiere),
  'notes': instance.notes,
};

const _$StatutOfEnumMap = {
  StatutOf.brouillon: 'BROUILLON',
  StatutOf.lance: 'LANCE',
  StatutOf.cloture: 'CLOTURE',
  StatutOf.annule: 'ANNULE',
};
