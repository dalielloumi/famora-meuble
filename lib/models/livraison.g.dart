// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livraison.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TourneeLivraison _$TourneeLivraisonFromJson(Map<String, dynamic> json) =>
    _TourneeLivraison(
      id: json['id'] as String?,
      numero: json['numero'] as String?,
      dateTournee: DateTime.parse(json['date_tournee'] as String),
      chauffeur: json['chauffeur'] as String?,
      vehicule: json['vehicule'] as String?,
      statut:
          $enumDecodeNullable(_$StatutTourneeEnumMap, json['statut']) ??
          StatutTournee.prevue,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$TourneeLivraisonToJson(_TourneeLivraison instance) =>
    <String, dynamic>{
      'id': instance.id,
      'numero': instance.numero,
      'date_tournee': instance.dateTournee.toIso8601String(),
      'chauffeur': instance.chauffeur,
      'vehicule': instance.vehicule,
      'statut': _$StatutTourneeEnumMap[instance.statut]!,
      'notes': instance.notes,
    };

const _$StatutTourneeEnumMap = {
  StatutTournee.prevue: 'PREVUE',
  StatutTournee.enCours: 'EN_COURS',
  StatutTournee.terminee: 'TERMINEE',
  StatutTournee.annulee: 'ANNULEE',
};

_TourneeLivraisonLigne _$TourneeLivraisonLigneFromJson(
  Map<String, dynamic> json,
) => _TourneeLivraisonLigne(
  id: json['id'] as String?,
  tourneeId: json['tournee_id'] as String,
  blId: json['bl_id'] as String,
  ordre: (json['ordre'] as num?)?.toInt() ?? 0,
  statut:
      $enumDecodeNullable(_$StatutLivraisonLigneEnumMap, json['statut']) ??
      StatutLivraisonLigne.prevue,
  commentaire: json['commentaire'] as String?,
);

Map<String, dynamic> _$TourneeLivraisonLigneToJson(
  _TourneeLivraisonLigne instance,
) => <String, dynamic>{
  'id': instance.id,
  'tournee_id': instance.tourneeId,
  'bl_id': instance.blId,
  'ordre': instance.ordre,
  'statut': _$StatutLivraisonLigneEnumMap[instance.statut]!,
  'commentaire': instance.commentaire,
};

const _$StatutLivraisonLigneEnumMap = {
  StatutLivraisonLigne.prevue: 'PREVUE',
  StatutLivraisonLigne.livree: 'LIVREE',
  StatutLivraisonLigne.echec: 'ECHEC',
};
