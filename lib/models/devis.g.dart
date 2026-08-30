// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Devis _$DevisFromJson(Map<String, dynamic> json) => _Devis(
  id: json['id'] as String?,
  numero: json['numero'] as String?,
  exerciceId: json['exercice_id'] as String,
  clientId: json['client_id'] as String,
  dateDevis: DateTime.parse(json['date_devis'] as String),
  dateValidite: json['date_validite'] == null
      ? null
      : DateTime.parse(json['date_validite'] as String),
  statut:
      $enumDecodeNullable(_$StatutDocumentEnumMap, json['statut']) ??
      StatutDocument.brouillon,
  totalHt: const DecimalConverter().fromJson(json['total_ht']),
  fodec: const DecimalConverter().fromJson(json['fodec']),
  totalTva: const DecimalConverter().fromJson(json['total_tva']),
  totalTtc: const DecimalConverter().fromJson(json['total_ttc']),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$DevisToJson(_Devis instance) => <String, dynamic>{
  'id': instance.id,
  'numero': instance.numero,
  'exercice_id': instance.exerciceId,
  'client_id': instance.clientId,
  'date_devis': instance.dateDevis.toIso8601String(),
  'date_validite': instance.dateValidite?.toIso8601String(),
  'statut': _$StatutDocumentEnumMap[instance.statut]!,
  'total_ht': const DecimalConverter().toJson(instance.totalHt),
  'fodec': const DecimalConverter().toJson(instance.fodec),
  'total_tva': const DecimalConverter().toJson(instance.totalTva),
  'total_ttc': const DecimalConverter().toJson(instance.totalTtc),
  'notes': instance.notes,
};

const _$StatutDocumentEnumMap = {
  StatutDocument.brouillon: 'BROUILLON',
  StatutDocument.valide: 'VALIDE',
  StatutDocument.annule: 'ANNULE',
};

_DevisLigne _$DevisLigneFromJson(Map<String, dynamic> json) => _DevisLigne(
  id: json['id'] as String?,
  devisId: json['devis_id'] as String,
  articleId: json['article_id'] as String,
  varianteId: json['variante_id'] as String?,
  quantite: const DecimalConverter().fromJson(json['quantite']),
  prixUnitaire: const DecimalConverter().fromJson(json['prix_unitaire']),
  remisePct: const DecimalConverter().fromJson(json['remise_pct']),
  tauxTvaId: json['taux_tva_id'] as String,
  ordre: (json['ordre'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$DevisLigneToJson(_DevisLigne instance) =>
    <String, dynamic>{
      'id': instance.id,
      'devis_id': instance.devisId,
      'article_id': instance.articleId,
      'variante_id': instance.varianteId,
      'quantite': const DecimalConverter().toJson(instance.quantite),
      'prix_unitaire': const DecimalConverter().toJson(instance.prixUnitaire),
      'remise_pct': const DecimalConverter().toJson(instance.remisePct),
      'taux_tva_id': instance.tauxTvaId,
      'ordre': instance.ordre,
    };
