import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;

part 'sav.freezed.dart';
part 'sav.g.dart';

enum StatutSav {
  @JsonValue('OUVERT')
  ouvert,
  @JsonValue('EN_COURS')
  enCours,
  @JsonValue('RESOLU')
  resolu,
  @JsonValue('FERME')
  ferme,
}

extension StatutSavLibelle on StatutSav {
  String get libelle => switch (this) {
    StatutSav.ouvert => 'Ouvert',
    StatutSav.enCours => 'En cours',
    StatutSav.resolu => 'Résolu',
    StatutSav.ferme => 'Fermé',
  };
}

enum TypeInterventionSav {
  @JsonValue('REPARATION')
  reparation,
  @JsonValue('ECHANGE')
  echange,
  @JsonValue('REMBOURSEMENT')
  remboursement,
}

extension TypeInterventionSavLibelle on TypeInterventionSav {
  String get libelle => switch (this) {
    TypeInterventionSav.reparation => 'Réparation',
    TypeInterventionSav.echange => 'Échange',
    TypeInterventionSav.remboursement => 'Remboursement',
  };
}

@freezed
abstract class Sav with _$Sav {
  const factory Sav({
    String? id,
    String? numero,
    @JsonKey(name: 'client_id') required String clientId,
    @JsonKey(name: 'article_id') String? articleId,
    @JsonKey(name: 'facture_vente_id') String? factureVenteId,
    @JsonKey(name: 'bl_id') String? blId,
    @JsonKey(name: 'date_ouverture') required DateTime dateOuverture,
    @JsonKey(name: 'description_probleme') required String descriptionProbleme,
    @JsonKey(name: 'type_intervention') TypeInterventionSav? typeIntervention,
    @Default(StatutSav.ouvert) StatutSav statut,
    @JsonKey(name: 'date_cloture') DateTime? dateCloture,
    @DecimalConverter() required Decimal cout,
  }) = _Sav;

  factory Sav.fromJson(Map<String, dynamic> json) => _$SavFromJson(json);
}

@freezed
abstract class SavIntervention with _$SavIntervention {
  const factory SavIntervention({
    String? id,
    @JsonKey(name: 'sav_id') required String savId,
    @JsonKey(name: 'date_intervention') required DateTime dateIntervention,
    required String description,
    @DecimalConverter() required Decimal cout,
  }) = _SavIntervention;

  factory SavIntervention.fromJson(Map<String, dynamic> json) => _$SavInterventionFromJson(json);
}
