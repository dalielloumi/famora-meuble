// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reception _$ReceptionFromJson(Map<String, dynamic> json) => _Reception(
  id: json['id'] as String?,
  numero: json['numero'] as String?,
  exerciceId: json['exercice_id'] as String,
  commandeFournisseurId: json['commande_fournisseur_id'] as String?,
  fournisseurId: json['fournisseur_id'] as String,
  depotId: json['depot_id'] as String,
  dateReception: DateTime.parse(json['date_reception'] as String),
  statut:
      $enumDecodeNullable(_$StatutDocumentEnumMap, json['statut']) ??
      StatutDocument.brouillon,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$ReceptionToJson(_Reception instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numero': instance.numero,
      'exercice_id': instance.exerciceId,
      'commande_fournisseur_id': instance.commandeFournisseurId,
      'fournisseur_id': instance.fournisseurId,
      'depot_id': instance.depotId,
      'date_reception': instance.dateReception.toIso8601String(),
      'statut': _$StatutDocumentEnumMap[instance.statut]!,
      'notes': instance.notes,
    };

const _$StatutDocumentEnumMap = {
  StatutDocument.brouillon: 'BROUILLON',
  StatutDocument.valide: 'VALIDE',
  StatutDocument.annule: 'ANNULE',
};

_ReceptionLigne _$ReceptionLigneFromJson(Map<String, dynamic> json) =>
    _ReceptionLigne(
      id: json['id'] as String?,
      receptionId: json['reception_id'] as String,
      commandeLigneId: json['commande_ligne_id'] as String?,
      articleId: json['article_id'] as String,
      varianteId: json['variante_id'] as String?,
      quantite: const DecimalConverter().fromJson(json['quantite']),
      prixUnitaire: const DecimalConverter().fromJson(json['prix_unitaire']),
      ordre: (json['ordre'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ReceptionLigneToJson(_ReceptionLigne instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reception_id': instance.receptionId,
      'commande_ligne_id': instance.commandeLigneId,
      'article_id': instance.articleId,
      'variante_id': instance.varianteId,
      'quantite': const DecimalConverter().toJson(instance.quantite),
      'prix_unitaire': const DecimalConverter().toJson(instance.prixUnitaire),
      'ordre': instance.ordre,
    };
