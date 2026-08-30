import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;

part 'ordre_fabrication.freezed.dart';
part 'ordre_fabrication.g.dart';

enum StatutOf {
  @JsonValue('BROUILLON')
  brouillon,
  @JsonValue('LANCE')
  lance,
  @JsonValue('CLOTURE')
  cloture,
  @JsonValue('ANNULE')
  annule,
}

extension StatutOfLibelle on StatutOf {
  String get libelle => switch (this) {
    StatutOf.brouillon => 'Brouillon',
    StatutOf.lance => 'Lancé',
    StatutOf.cloture => 'Clôturé',
    StatutOf.annule => 'Annulé',
  };
}

@freezed
abstract class OrdreFabrication with _$OrdreFabrication {
  const factory OrdreFabrication({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'nomenclature_id') required String nomenclatureId,
    @JsonKey(name: 'commande_client_ligne_id') String? commandeClientLigneId,
    @DecimalConverter() @JsonKey(name: 'quantite_prevue') required Decimal quantitePrevue,
    @DecimalConverter() @JsonKey(name: 'quantite_produite') required Decimal quantiteProduite,
    @JsonKey(name: 'depot_source_id') required String depotSourceId,
    @JsonKey(name: 'depot_destination_id') required String depotDestinationId,
    @Default(StatutOf.brouillon) StatutOf statut,
    @JsonKey(name: 'date_lancement') DateTime? dateLancement,
    @JsonKey(name: 'date_cloture') DateTime? dateCloture,
    @DecimalConverter() @JsonKey(name: 'cout_matiere') required Decimal coutMatiere,
    String? notes,
  }) = _OrdreFabrication;

  factory OrdreFabrication.fromJson(Map<String, dynamic> json) => _$OrdreFabricationFromJson(json);
}
