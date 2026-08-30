import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;

part 'reglement.freezed.dart';
part 'reglement.g.dart';

enum SensReglement {
  @JsonValue('ENCAISSEMENT')
  encaissement,
  @JsonValue('DECAISSEMENT')
  decaissement,
}

extension SensReglementLibelle on SensReglement {
  String get libelle => this == SensReglement.encaissement ? 'Encaissement' : 'Décaissement';
}

enum ModeReglement {
  @JsonValue('ESPECES')
  especes,
  @JsonValue('CHEQUE')
  cheque,
  @JsonValue('TRAITE')
  traite,
  @JsonValue('VIREMENT')
  virement,
  @JsonValue('CARTE')
  carte,
}

extension ModeReglementLibelle on ModeReglement {
  String get libelle => switch (this) {
    ModeReglement.especes => 'Espèces',
    ModeReglement.cheque => 'Chèque',
    ModeReglement.traite => 'Traite',
    ModeReglement.virement => 'Virement',
    ModeReglement.carte => 'Carte',
  };

  bool get estUnEffet => this == ModeReglement.cheque || this == ModeReglement.traite;
}

enum StatutEffet {
  @JsonValue('EN_PORTEFEUILLE')
  enPortefeuille,
  @JsonValue('ENCAISSE')
  encaisse,
  @JsonValue('IMPAYE')
  impaye,
  @JsonValue('ESCOMPTE')
  escompte,
}

extension StatutEffetLibelle on StatutEffet {
  String get libelle => switch (this) {
    StatutEffet.enPortefeuille => 'En portefeuille',
    StatutEffet.encaisse => 'Encaissé',
    StatutEffet.impaye => 'Impayé',
    StatutEffet.escompte => 'Escompté',
  };
}

@freezed
abstract class Reglement with _$Reglement {
  const factory Reglement({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'tiers_id') required String tiersId,
    required SensReglement sens,
    required ModeReglement mode,
    @DecimalConverter() required Decimal montant,
    @JsonKey(name: 'date_reglement') required DateTime dateReglement,
    @JsonKey(name: 'commande_client_id') String? commandeClientId,
    String? reference,
    String? banque,
    String? notes,
  }) = _Reglement;

  factory Reglement.fromJson(Map<String, dynamic> json) => _$ReglementFromJson(json);
}

@freezed
abstract class ReglementAffectation with _$ReglementAffectation {
  const factory ReglementAffectation({
    String? id,
    @JsonKey(name: 'reglement_id') required String reglementId,
    @JsonKey(name: 'facture_vente_id') String? factureVenteId,
    @JsonKey(name: 'facture_achat_id') String? factureAchatId,
    @DecimalConverter() @JsonKey(name: 'montant_affecte') required Decimal montantAffecte,
  }) = _ReglementAffectation;

  factory ReglementAffectation.fromJson(Map<String, dynamic> json) => _$ReglementAffectationFromJson(json);
}

@freezed
abstract class Effet with _$Effet {
  const factory Effet({
    String? id,
    @JsonKey(name: 'reglement_id') required String reglementId,
    @JsonKey(name: 'numero_effet') required String numeroEffet,
    @JsonKey(name: 'date_echeance') required DateTime dateEcheance,
    @DecimalConverter() required Decimal montant,
    @Default(StatutEffet.enPortefeuille) StatutEffet statut,
    String? banque,
  }) = _Effet;

  factory Effet.fromJson(Map<String, dynamic> json) => _$EffetFromJson(json);
}
