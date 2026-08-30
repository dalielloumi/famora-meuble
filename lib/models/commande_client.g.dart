// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commande_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommandeClient _$CommandeClientFromJson(Map<String, dynamic> json) =>
    _CommandeClient(
      id: json['id'] as String?,
      numero: json['numero'] as String?,
      exerciceId: json['exercice_id'] as String,
      clientId: json['client_id'] as String,
      devisId: json['devis_id'] as String?,
      dateCommande: DateTime.parse(json['date_commande'] as String),
      dateLivraisonPrevue: json['date_livraison_prevue'] == null
          ? null
          : DateTime.parse(json['date_livraison_prevue'] as String),
      statut:
          $enumDecodeNullable(_$StatutDocumentEnumMap, json['statut']) ??
          StatutDocument.brouillon,
      totalHt: const DecimalConverter().fromJson(json['total_ht']),
      fodec: const DecimalConverter().fromJson(json['fodec']),
      totalTva: const DecimalConverter().fromJson(json['total_tva']),
      totalTtc: const DecimalConverter().fromJson(json['total_ttc']),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$CommandeClientToJson(_CommandeClient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numero': instance.numero,
      'exercice_id': instance.exerciceId,
      'client_id': instance.clientId,
      'devis_id': instance.devisId,
      'date_commande': instance.dateCommande.toIso8601String(),
      'date_livraison_prevue': instance.dateLivraisonPrevue?.toIso8601String(),
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

_CommandeClientLigne _$CommandeClientLigneFromJson(Map<String, dynamic> json) =>
    _CommandeClientLigne(
      id: json['id'] as String?,
      commandeId: json['commande_id'] as String,
      articleId: json['article_id'] as String,
      varianteId: json['variante_id'] as String?,
      quantite: const DecimalConverter().fromJson(json['quantite']),
      prixUnitaire: const DecimalConverter().fromJson(json['prix_unitaire']),
      remisePct: const DecimalConverter().fromJson(json['remise_pct']),
      tauxTvaId: json['taux_tva_id'] as String,
      quantiteLivree: const DecimalConverter().fromJson(
        json['quantite_livree'],
      ),
      ordre: (json['ordre'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CommandeClientLigneToJson(
  _CommandeClientLigne instance,
) => <String, dynamic>{
  'id': instance.id,
  'commande_id': instance.commandeId,
  'article_id': instance.articleId,
  'variante_id': instance.varianteId,
  'quantite': const DecimalConverter().toJson(instance.quantite),
  'prix_unitaire': const DecimalConverter().toJson(instance.prixUnitaire),
  'remise_pct': const DecimalConverter().toJson(instance.remisePct),
  'taux_tva_id': instance.tauxTvaId,
  'quantite_livree': const DecimalConverter().toJson(instance.quantiteLivree),
  'ordre': instance.ordre,
};
