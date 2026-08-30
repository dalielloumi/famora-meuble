import 'package:freezed_annotation/freezed_annotation.dart';

part 'livraison.freezed.dart';
part 'livraison.g.dart';

enum StatutTournee {
  @JsonValue('PREVUE')
  prevue,
  @JsonValue('EN_COURS')
  enCours,
  @JsonValue('TERMINEE')
  terminee,
  @JsonValue('ANNULEE')
  annulee,
}

extension StatutTourneeLibelle on StatutTournee {
  String get libelle => switch (this) {
    StatutTournee.prevue => 'Prévue',
    StatutTournee.enCours => 'En cours',
    StatutTournee.terminee => 'Terminée',
    StatutTournee.annulee => 'Annulée',
  };
}

enum StatutLivraisonLigne {
  @JsonValue('PREVUE')
  prevue,
  @JsonValue('LIVREE')
  livree,
  @JsonValue('ECHEC')
  echec,
}

extension StatutLivraisonLigneLibelle on StatutLivraisonLigne {
  String get libelle => switch (this) {
    StatutLivraisonLigne.prevue => 'Prévue',
    StatutLivraisonLigne.livree => 'Livrée',
    StatutLivraisonLigne.echec => 'Échec',
  };
}

@freezed
abstract class TourneeLivraison with _$TourneeLivraison {
  const factory TourneeLivraison({
    String? id,
    String? numero,
    @JsonKey(name: 'date_tournee') required DateTime dateTournee,
    String? chauffeur,
    String? vehicule,
    @Default(StatutTournee.prevue) StatutTournee statut,
    String? notes,
  }) = _TourneeLivraison;

  factory TourneeLivraison.fromJson(Map<String, dynamic> json) => _$TourneeLivraisonFromJson(json);
}

@freezed
abstract class TourneeLivraisonLigne with _$TourneeLivraisonLigne {
  const factory TourneeLivraisonLigne({
    String? id,
    @JsonKey(name: 'tournee_id') required String tourneeId,
    @JsonKey(name: 'bl_id') required String blId,
    @Default(0) int ordre,
    @Default(StatutLivraisonLigne.prevue) StatutLivraisonLigne statut,
    String? commentaire,
  }) = _TourneeLivraisonLigne;

  factory TourneeLivraisonLigne.fromJson(Map<String, dynamic> json) => _$TourneeLivraisonLigneFromJson(json);
}
