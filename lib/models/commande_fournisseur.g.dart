// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commande_fournisseur.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommandeFournisseur _$CommandeFournisseurFromJson(Map<String, dynamic> json) =>
    _CommandeFournisseur(
      id: json['id'] as String?,
      numero: json['numero'] as String?,
      exerciceId: json['exercice_id'] as String,
      fournisseurId: json['fournisseur_id'] as String,
      depotId: json['depot_id'] as String,
      dateCommande: DateTime.parse(json['date_commande'] as String),
      dateLivraisonPrevue: json['date_livraison_prevue'] == null
          ? null
          : DateTime.parse(json['date_livraison_prevue'] as String),
      statut:
          $enumDecodeNullable(_$StatutDocumentEnumMap, json['statut']) ??
          StatutDocument.brouillon,
      totalHt: const DecimalConverter().fromJson(json['total_ht']),
      totalTva: const DecimalConverter().fromJson(json['total_tva']),
      totalTtc: const DecimalConverter().fromJson(json['total_ttc']),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CommandeFournisseurToJson(
  _CommandeFournisseur instance,
) => <String, dynamic>{
  'id': instance.id,
  'numero': instance.numero,
  'exercice_id': instance.exerciceId,
  'fournisseur_id': instance.fournisseurId,
  'depot_id': instance.depotId,
  'date_commande': instance.dateCommande.toIso8601String(),
  'date_livraison_prevue': instance.dateLivraisonPrevue?.toIso8601String(),
  'statut': _$StatutDocumentEnumMap[instance.statut]!,
  'total_ht': const DecimalConverter().toJson(instance.totalHt),
  'total_tva': const DecimalConverter().toJson(instance.totalTva),
  'total_ttc': const DecimalConverter().toJson(instance.totalTtc),
  'notes': instance.notes,
};

const _$StatutDocumentEnumMap = {
  StatutDocument.brouillon: 'BROUILLON',
  StatutDocument.valide: 'VALIDE',
  StatutDocument.annule: 'ANNULE',
};

_CommandeFournisseurLigne _$CommandeFournisseurLigneFromJson(
  Map<String, dynamic> json,
) => _CommandeFournisseurLigne(
  id: json['id'] as String?,
  commandeId: json['commande_id'] as String,
  articleId: json['article_id'] as String,
  varianteId: json['variante_id'] as String?,
  quantite: const DecimalConverter().fromJson(json['quantite']),
  prixUnitaire: const DecimalConverter().fromJson(json['prix_unitaire']),
  remisePct: const DecimalConverter().fromJson(json['remise_pct']),
  tauxTvaId: json['taux_tva_id'] as String,
  quantiteRecue: const DecimalConverter().fromJson(json['quantite_recue']),
  ordre: (json['ordre'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CommandeFournisseurLigneToJson(
  _CommandeFournisseurLigne instance,
) => <String, dynamic>{
  'id': instance.id,
  'commande_id': instance.commandeId,
  'article_id': instance.articleId,
  'variante_id': instance.varianteId,
  'quantite': const DecimalConverter().toJson(instance.quantite),
  'prix_unitaire': const DecimalConverter().toJson(instance.prixUnitaire),
  'remise_pct': const DecimalConverter().toJson(instance.remisePct),
  'taux_tva_id': instance.tauxTvaId,
  'quantite_recue': const DecimalConverter().toJson(instance.quantiteRecue),
  'ordre': instance.ordre,
};
