// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reglement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reglement _$ReglementFromJson(Map<String, dynamic> json) => _Reglement(
  id: json['id'] as String?,
  numero: json['numero'] as String?,
  exerciceId: json['exercice_id'] as String,
  tiersId: json['tiers_id'] as String,
  sens: $enumDecode(_$SensReglementEnumMap, json['sens']),
  mode: $enumDecode(_$ModeReglementEnumMap, json['mode']),
  montant: const DecimalConverter().fromJson(json['montant']),
  dateReglement: DateTime.parse(json['date_reglement'] as String),
  commandeClientId: json['commande_client_id'] as String?,
  reference: json['reference'] as String?,
  banque: json['banque'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$ReglementToJson(_Reglement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numero': instance.numero,
      'exercice_id': instance.exerciceId,
      'tiers_id': instance.tiersId,
      'sens': _$SensReglementEnumMap[instance.sens]!,
      'mode': _$ModeReglementEnumMap[instance.mode]!,
      'montant': const DecimalConverter().toJson(instance.montant),
      'date_reglement': instance.dateReglement.toIso8601String(),
      'commande_client_id': instance.commandeClientId,
      'reference': instance.reference,
      'banque': instance.banque,
      'notes': instance.notes,
    };

const _$SensReglementEnumMap = {
  SensReglement.encaissement: 'ENCAISSEMENT',
  SensReglement.decaissement: 'DECAISSEMENT',
};

const _$ModeReglementEnumMap = {
  ModeReglement.especes: 'ESPECES',
  ModeReglement.cheque: 'CHEQUE',
  ModeReglement.traite: 'TRAITE',
  ModeReglement.virement: 'VIREMENT',
  ModeReglement.carte: 'CARTE',
};

_ReglementAffectation _$ReglementAffectationFromJson(
  Map<String, dynamic> json,
) => _ReglementAffectation(
  id: json['id'] as String?,
  reglementId: json['reglement_id'] as String,
  factureVenteId: json['facture_vente_id'] as String?,
  factureAchatId: json['facture_achat_id'] as String?,
  montantAffecte: const DecimalConverter().fromJson(json['montant_affecte']),
);

Map<String, dynamic> _$ReglementAffectationToJson(
  _ReglementAffectation instance,
) => <String, dynamic>{
  'id': instance.id,
  'reglement_id': instance.reglementId,
  'facture_vente_id': instance.factureVenteId,
  'facture_achat_id': instance.factureAchatId,
  'montant_affecte': const DecimalConverter().toJson(instance.montantAffecte),
};

_Effet _$EffetFromJson(Map<String, dynamic> json) => _Effet(
  id: json['id'] as String?,
  reglementId: json['reglement_id'] as String,
  numeroEffet: json['numero_effet'] as String,
  dateEcheance: DateTime.parse(json['date_echeance'] as String),
  montant: const DecimalConverter().fromJson(json['montant']),
  statut:
      $enumDecodeNullable(_$StatutEffetEnumMap, json['statut']) ??
      StatutEffet.enPortefeuille,
  banque: json['banque'] as String?,
);

Map<String, dynamic> _$EffetToJson(_Effet instance) => <String, dynamic>{
  'id': instance.id,
  'reglement_id': instance.reglementId,
  'numero_effet': instance.numeroEffet,
  'date_echeance': instance.dateEcheance.toIso8601String(),
  'montant': const DecimalConverter().toJson(instance.montant),
  'statut': _$StatutEffetEnumMap[instance.statut]!,
  'banque': instance.banque,
};

const _$StatutEffetEnumMap = {
  StatutEffet.enPortefeuille: 'EN_PORTEFEUILLE',
  StatutEffet.encaisse: 'ENCAISSE',
  StatutEffet.impaye: 'IMPAYE',
  StatutEffet.escompte: 'ESCOMPTE',
};
