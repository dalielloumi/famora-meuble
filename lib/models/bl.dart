import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'statut_document.dart';

export 'statut_document.dart';

part 'bl.freezed.dart';
part 'bl.g.dart';

@freezed
abstract class Bl with _$Bl {
  const factory Bl({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'client_id') required String clientId,
    @JsonKey(name: 'commande_client_id') String? commandeClientId,
    @JsonKey(name: 'depot_id') required String depotId,
    @JsonKey(name: 'date_bl') required DateTime dateBl,
    @JsonKey(name: 'adresse_livraison') String? adresseLivraison,
    @Default(StatutDocument.brouillon) StatutDocument statut,
    String? notes,
  }) = _Bl;

  factory Bl.fromJson(Map<String, dynamic> json) => _$BlFromJson(json);
}

@freezed
abstract class BlLigne with _$BlLigne {
  const factory BlLigne({
    String? id,
    @JsonKey(name: 'bl_id') required String blId,
    @JsonKey(name: 'commande_ligne_id') String? commandeLigneId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() @JsonKey(name: 'prix_unitaire') required Decimal prixUnitaire,
    @JsonKey(name: 'taux_tva_id') required String tauxTvaId,
    @Default(0) int ordre,
  }) = _BlLigne;

  factory BlLigne.fromJson(Map<String, dynamic> json) => _$BlLigneFromJson(json);
}
