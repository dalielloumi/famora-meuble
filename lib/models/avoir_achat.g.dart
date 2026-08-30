// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avoir_achat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AvoirAchat _$AvoirAchatFromJson(Map<String, dynamic> json) => _AvoirAchat(
  id: json['id'] as String?,
  numero: json['numero'] as String?,
  exerciceId: json['exercice_id'] as String,
  fournisseurId: json['fournisseur_id'] as String,
  factureAchatId: json['facture_achat_id'] as String,
  motif: json['motif'] as String,
  dateAvoir: DateTime.parse(json['date_avoir'] as String),
  statut:
      $enumDecodeNullable(_$StatutDocumentEnumMap, json['statut']) ??
      StatutDocument.brouillon,
  totalHt: const DecimalConverter().fromJson(json['total_ht']),
  totalTva: const DecimalConverter().fromJson(json['total_tva']),
  totalTtc: const DecimalConverter().fromJson(json['total_ttc']),
);

Map<String, dynamic> _$AvoirAchatToJson(_AvoirAchat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numero': instance.numero,
      'exercice_id': instance.exerciceId,
      'fournisseur_id': instance.fournisseurId,
      'facture_achat_id': instance.factureAchatId,
      'motif': instance.motif,
      'date_avoir': instance.dateAvoir.toIso8601String(),
      'statut': _$StatutDocumentEnumMap[instance.statut]!,
      'total_ht': const DecimalConverter().toJson(instance.totalHt),
      'total_tva': const DecimalConverter().toJson(instance.totalTva),
      'total_ttc': const DecimalConverter().toJson(instance.totalTtc),
    };

const _$StatutDocumentEnumMap = {
  StatutDocument.brouillon: 'BROUILLON',
  StatutDocument.valide: 'VALIDE',
  StatutDocument.annule: 'ANNULE',
};

_AvoirAchatLigne _$AvoirAchatLigneFromJson(Map<String, dynamic> json) =>
    _AvoirAchatLigne(
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

Map<String, dynamic> _$AvoirAchatLigneToJson(_AvoirAchatLigne instance) =>
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
