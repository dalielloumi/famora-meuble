// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Inventaire _$InventaireFromJson(Map<String, dynamic> json) => _Inventaire(
  id: json['id'] as String?,
  numero: json['numero'] as String?,
  exerciceId: json['exercice_id'] as String,
  depotId: json['depot_id'] as String,
  dateInventaire: DateTime.parse(json['date_inventaire'] as String),
  statut:
      $enumDecodeNullable(_$StatutDocumentEnumMap, json['statut']) ??
      StatutDocument.brouillon,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$InventaireToJson(_Inventaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numero': instance.numero,
      'exercice_id': instance.exerciceId,
      'depot_id': instance.depotId,
      'date_inventaire': instance.dateInventaire.toIso8601String(),
      'statut': _$StatutDocumentEnumMap[instance.statut]!,
      'notes': instance.notes,
    };

const _$StatutDocumentEnumMap = {
  StatutDocument.brouillon: 'BROUILLON',
  StatutDocument.valide: 'VALIDE',
  StatutDocument.annule: 'ANNULE',
};

_InventaireLigne _$InventaireLigneFromJson(Map<String, dynamic> json) =>
    _InventaireLigne(
      id: json['id'] as String?,
      inventaireId: json['inventaire_id'] as String,
      articleId: json['article_id'] as String,
      varianteId: json['variante_id'] as String?,
      quantiteTheorique: const DecimalConverter().fromJson(
        json['quantite_theorique'],
      ),
      quantiteComptee: const DecimalConverter().fromJson(
        json['quantite_comptee'],
      ),
      ecart: const DecimalConverter().fromJson(json['ecart']),
    );

Map<String, dynamic> _$InventaireLigneToJson(_InventaireLigne instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inventaire_id': instance.inventaireId,
      'article_id': instance.articleId,
      'variante_id': instance.varianteId,
      'quantite_theorique': const DecimalConverter().toJson(
        instance.quantiteTheorique,
      ),
      'quantite_comptee': _$JsonConverterToJson<Object?, Decimal>(
        instance.quantiteComptee,
        const DecimalConverter().toJson,
      ),
      'ecart': const DecimalConverter().toJson(instance.ecart),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
