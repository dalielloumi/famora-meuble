import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'statut_document.dart';

export 'statut_document.dart';

part 'avoir_vente.freezed.dart';
part 'avoir_vente.g.dart';

@freezed
abstract class AvoirVente with _$AvoirVente {
  const factory AvoirVente({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'client_id') required String clientId,
    @JsonKey(name: 'facture_vente_id') required String factureVenteId,
    required String motif,
    @JsonKey(name: 'date_avoir') required DateTime dateAvoir,
    @Default(StatutDocument.brouillon) StatutDocument statut,
    @DecimalConverter() @JsonKey(name: 'total_ht') required Decimal totalHt,
    @DecimalConverter() required Decimal fodec,
    @DecimalConverter() @JsonKey(name: 'total_tva') required Decimal totalTva,
    @DecimalConverter() @JsonKey(name: 'total_ttc') required Decimal totalTtc,
  }) = _AvoirVente;

  factory AvoirVente.fromJson(Map<String, dynamic> json) => _$AvoirVenteFromJson(json);
}

@freezed
abstract class AvoirVenteLigne with _$AvoirVenteLigne {
  const factory AvoirVenteLigne({
    String? id,
    @JsonKey(name: 'avoir_id') required String avoirId,
    @JsonKey(name: 'facture_ligne_id') String? factureLigneId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() @JsonKey(name: 'prix_unitaire') required Decimal prixUnitaire,
    @JsonKey(name: 'taux_tva_id') required String tauxTvaId,
    @Default(0) int ordre,
  }) = _AvoirVenteLigne;

  factory AvoirVenteLigne.fromJson(Map<String, dynamic> json) => _$AvoirVenteLigneFromJson(json);
}
