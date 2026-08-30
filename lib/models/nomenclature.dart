import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;

part 'nomenclature.freezed.dart';
part 'nomenclature.g.dart';

@freezed
abstract class Nomenclature with _$Nomenclature {
  const factory Nomenclature({
    String? id,
    @JsonKey(name: 'article_id') required String articleId,
    @Default(1) int version,
    @Default(true) bool actif,
    String? notes,
  }) = _Nomenclature;

  factory Nomenclature.fromJson(Map<String, dynamic> json) => _$NomenclatureFromJson(json);
}

@freezed
abstract class NomenclatureLigne with _$NomenclatureLigne {
  const factory NomenclatureLigne({
    String? id,
    @JsonKey(name: 'nomenclature_id') required String nomenclatureId,
    @JsonKey(name: 'composant_id') required String composantId,
    @DecimalConverter() required Decimal quantite,
    @JsonKey(name: 'unite_id') required String uniteId,
    @Default(0) int ordre,
  }) = _NomenclatureLigne;

  factory NomenclatureLigne.fromJson(Map<String, dynamic> json) => _$NomenclatureLigneFromJson(json);
}
