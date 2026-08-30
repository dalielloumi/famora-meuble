// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bl _$BlFromJson(Map<String, dynamic> json) => _Bl(
  id: json['id'] as String?,
  numero: json['numero'] as String?,
  exerciceId: json['exercice_id'] as String,
  clientId: json['client_id'] as String,
  commandeClientId: json['commande_client_id'] as String?,
  depotId: json['depot_id'] as String,
  dateBl: DateTime.parse(json['date_bl'] as String),
  adresseLivraison: json['adresse_livraison'] as String?,
  statut:
      $enumDecodeNullable(_$StatutDocumentEnumMap, json['statut']) ??
      StatutDocument.brouillon,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$BlToJson(_Bl instance) => <String, dynamic>{
  'id': instance.id,
  'numero': instance.numero,
  'exercice_id': instance.exerciceId,
  'client_id': instance.clientId,
  'commande_client_id': instance.commandeClientId,
  'depot_id': instance.depotId,
  'date_bl': instance.dateBl.toIso8601String(),
  'adresse_livraison': instance.adresseLivraison,
  'statut': _$StatutDocumentEnumMap[instance.statut]!,
  'notes': instance.notes,
};

const _$StatutDocumentEnumMap = {
  StatutDocument.brouillon: 'BROUILLON',
  StatutDocument.valide: 'VALIDE',
  StatutDocument.annule: 'ANNULE',
};

_BlLigne _$BlLigneFromJson(Map<String, dynamic> json) => _BlLigne(
  id: json['id'] as String?,
  blId: json['bl_id'] as String,
  commandeLigneId: json['commande_ligne_id'] as String?,
  articleId: json['article_id'] as String,
  varianteId: json['variante_id'] as String?,
  quantite: const DecimalConverter().fromJson(json['quantite']),
  prixUnitaire: const DecimalConverter().fromJson(json['prix_unitaire']),
  tauxTvaId: json['taux_tva_id'] as String,
  ordre: (json['ordre'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$BlLigneToJson(_BlLigne instance) => <String, dynamic>{
  'id': instance.id,
  'bl_id': instance.blId,
  'commande_ligne_id': instance.commandeLigneId,
  'article_id': instance.articleId,
  'variante_id': instance.varianteId,
  'quantite': const DecimalConverter().toJson(instance.quantite),
  'prix_unitaire': const DecimalConverter().toJson(instance.prixUnitaire),
  'taux_tva_id': instance.tauxTvaId,
  'ordre': instance.ordre,
};
