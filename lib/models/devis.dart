import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'statut_document.dart';

export 'statut_document.dart';

part 'devis.freezed.dart';
part 'devis.g.dart';

@freezed
abstract class Devis with _$Devis {
  const factory Devis({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'client_id') required String clientId,
    @JsonKey(name: 'date_devis') required DateTime dateDevis,
    @JsonKey(name: 'date_validite') DateTime? dateValidite,
    @Default(StatutDocument.brouillon) StatutDocument statut,
    @DecimalConverter() @JsonKey(name: 'total_ht') required Decimal totalHt,
    @DecimalConverter() required Decimal fodec,
    @DecimalConverter() @JsonKey(name: 'total_tva') required Decimal totalTva,
    @DecimalConverter() @JsonKey(name: 'total_ttc') required Decimal totalTtc,
    String? notes,
  }) = _Devis;

  factory Devis.fromJson(Map<String, dynamic> json) => _$DevisFromJson(json);
}

@freezed
abstract class DevisLigne with _$DevisLigne {
  const factory DevisLigne({
    String? id,
    @JsonKey(name: 'devis_id') required String devisId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() @JsonKey(name: 'prix_unitaire') required Decimal prixUnitaire,
    @DecimalConverter() @JsonKey(name: 'remise_pct') required Decimal remisePct,
    @JsonKey(name: 'taux_tva_id') required String tauxTvaId,
    @Default(0) int ordre,
  }) = _DevisLigne;

  factory DevisLigne.fromJson(Map<String, dynamic> json) => _$DevisLigneFromJson(json);
}
