// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avoir_vente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvoirVente _$AvoirVenteFromJson(Map<String, dynamic> json) => _AvoirVente(
  id: json['id'] as String?,
  numero: json['numero'] as String?,
  exerciceId: json['exercice_id'] as String,
  clientId: json['client_id'] as String,
  factureVenteId: json['facture_vente_id'] as String,
  motif: json['motif'] as String,
  dateAvoir: DateTime.parse(json['date_avoir'] as String),
  statut:
      $enumDecodeNullable(_$StatutDocumentEnumMap, json['statut']) ??
      StatutDocument.brouillon,
  totalHt: const DecimalConverter().fromJson(json['total_ht']),
  fodec: const DecimalConverter().fromJson(json['fodec']),
  totalTva: const DecimalConverter().fromJson(json['total_tva']),
  totalTtc: const DecimalConverter().fromJson(json['total_ttc']),
);

Map<String, dynamic> _$AvoirVenteToJson(_AvoirVente instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numero': instance.numero,
      'exercice_id': instance.exerciceId,
      'client_id': instance.clientId,
      'facture_vente_id': instance.factureVenteId,
      'motif': instance.motif,
      'date_avoir': instance.dateAvoir.toIso8601String(),
      'statut': _$StatutDocumentEnumMap[instance.statut]!,
      'total_ht': const DecimalConverter().toJson(instance.totalHt),
      'fodec': const DecimalConverter().toJson(instance.fodec),
      'total_tva': const DecimalConverter().toJson(instance.totalTva),
      'total_ttc': const DecimalConverter().toJson(instance.totalTtc),
    };

const _$StatutDocumentEnumMap = {
  StatutDocument.brouillon: 'BROUILLON',
  StatutDocument.valide: 'VALIDE',
  StatutDocument.annule: 'ANNULE',
};

_AvoirVenteLigne _$AvoirVenteLigneFromJson(Map<String, dynamic> json) =>
    _AvoirVenteLigne(
      id: json['id'] as String?,
      avoirId: json['avoir_id'] as String,
      factureLigneId: json['facture_ligne_id'] as String?,
      articleId: json['article_id'] as String,
      varianteId: json['variante_id'] as String?,
      quantite: const DecimalConverter().fromJson(json['quantite']),
      prixUnitaire: const DecimalConverter().fromJson(json['prix_unitaire']),
      tauxTvaId: json['taux_tva_id'] as String,
      ordre: (json['ordre'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AvoirVenteLigneToJson(_AvoirVenteLigne instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avoir_id': instance.avoirId,
      'facture_ligne_id': instance.factureLigneId,
      'article_id': instance.articleId,
      'variante_id': instance.varianteId,
      'quantite': const DecimalConverter().toJson(instance.quantite),
      'prix_unitaire': const DecimalConverter().toJson(instance.prixUnitaire),
      'taux_tva_id': instance.tauxTvaId,
      'ordre': instance.ordre,
    };
