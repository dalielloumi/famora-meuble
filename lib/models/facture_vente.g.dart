// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facture_vente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FactureVente _$FactureVenteFromJson(
  Map<String, dynamic> json,
) => _FactureVente(
  id: json['id'] as String?,
  numero: json['numero'] as String?,
  exerciceId: json['exercice_id'] as String,
  clientId: json['client_id'] as String,
  blId: json['bl_id'] as String?,
  commandeClientId: json['commande_client_id'] as String?,
  dateFacture: DateTime.parse(json['date_facture'] as String),
  dateEcheance: json['date_echeance'] == null
      ? null
      : DateTime.parse(json['date_echeance'] as String),
  statut:
      $enumDecodeNullable(_$StatutDocumentEnumMap, json['statut']) ??
      StatutDocument.brouillon,
  statutPaiement:
      $enumDecodeNullable(_$StatutPaiementEnumMap, json['statut_paiement']) ??
      StatutPaiement.impaye,
  totalHt: const DecimalConverter().fromJson(json['total_ht']),
  fodec: const DecimalConverter().fromJson(json['fodec']),
  totalTva: const DecimalConverter().fromJson(json['total_tva']),
  timbreFiscal: const DecimalConverter().fromJson(json['timbre_fiscal']),
  fraisLivraison: const DecimalConverter().fromJson(json['frais_livraison']),
  retenueSource: const DecimalConverter().fromJson(json['retenue_source']),
  totalTtc: const DecimalConverter().fromJson(json['total_ttc']),
  montantRegle: const DecimalConverter().fromJson(json['montant_regle']),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$FactureVenteToJson(
  _FactureVente instance,
) => <String, dynamic>{
  'id': instance.id,
  'numero': instance.numero,
  'exercice_id': instance.exerciceId,
  'client_id': instance.clientId,
  'bl_id': instance.blId,
  'commande_client_id': instance.commandeClientId,
  'date_facture': instance.dateFacture.toIso8601String(),
  'date_echeance': instance.dateEcheance?.toIso8601String(),
  'statut': _$StatutDocumentEnumMap[instance.statut]!,
  'statut_paiement': _$StatutPaiementEnumMap[instance.statutPaiement]!,
  'total_ht': const DecimalConverter().toJson(instance.totalHt),
  'fodec': const DecimalConverter().toJson(instance.fodec),
  'total_tva': const DecimalConverter().toJson(instance.totalTva),
  'timbre_fiscal': const DecimalConverter().toJson(instance.timbreFiscal),
  'frais_livraison': const DecimalConverter().toJson(instance.fraisLivraison),
  'retenue_source': const DecimalConverter().toJson(instance.retenueSource),
  'total_ttc': const DecimalConverter().toJson(instance.totalTtc),
  'montant_regle': const DecimalConverter().toJson(instance.montantRegle),
  'notes': instance.notes,
};

const _$StatutDocumentEnumMap = {
  StatutDocument.brouillon: 'BROUILLON',
  StatutDocument.valide: 'VALIDE',
  StatutDocument.annule: 'ANNULE',
};

const _$StatutPaiementEnumMap = {
  StatutPaiement.impaye: 'IMPAYE',
  StatutPaiement.partiel: 'PARTIEL',
  StatutPaiement.solde: 'SOLDE',
};

_FactureVenteLigne _$FactureVenteLigneFromJson(Map<String, dynamic> json) =>
    _FactureVenteLigne(
      id: json['id'] as String?,
      factureId: json['facture_id'] as String,
      blLigneId: json['bl_ligne_id'] as String?,
      articleId: json['article_id'] as String,
      varianteId: json['variante_id'] as String?,
      quantite: const DecimalConverter().fromJson(json['quantite']),
      prixUnitaire: const DecimalConverter().fromJson(json['prix_unitaire']),
      remisePct: const DecimalConverter().fromJson(json['remise_pct']),
      tauxTvaId: json['taux_tva_id'] as String,
      ordre: (json['ordre'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FactureVenteLigneToJson(_FactureVenteLigne instance) =>
    <String, dynamic>{
      'id': instance.id,
      'facture_id': instance.factureId,
      'bl_ligne_id': instance.blLigneId,
      'article_id': instance.articleId,
      'variante_id': instance.varianteId,
      'quantite': const DecimalConverter().toJson(instance.quantite),
      'prix_unitaire': const DecimalConverter().toJson(instance.prixUnitaire),
      'remise_pct': const DecimalConverter().toJson(instance.remisePct),
      'taux_tva_id': instance.tauxTvaId,
      'ordre': instance.ordre,
    };
