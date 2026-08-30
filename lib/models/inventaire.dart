import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'statut_document.dart';

export 'statut_document.dart';

part 'inventaire.freezed.dart';
part 'inventaire.g.dart';

@freezed
abstract class Inventaire with _$Inventaire {
  const factory Inventaire({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'depot_id') required String depotId,
    @JsonKey(name: 'date_inventaire') required DateTime dateInventaire,
    @Default(StatutDocument.brouillon) StatutDocument statut,
    String? notes,
  }) = _Inventaire;

  factory Inventaire.fromJson(Map<String, dynamic> json) => _$InventaireFromJson(json);
}

@freezed
abstract class InventaireLigne with _$InventaireLigne {
  const factory InventaireLigne({
    String? id,
    @JsonKey(name: 'inventaire_id') required String inventaireId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @DecimalConverter() @JsonKey(name: 'quantite_theorique') required Decimal quantiteTheorique,
    @DecimalConverter() @JsonKey(name: 'quantite_comptee') Decimal? quantiteComptee,
    @DecimalConverter() required Decimal ecart,
  }) = _InventaireLigne;

  factory InventaireLigne.fromJson(Map<String, dynamic> json) => _$InventaireLigneFromJson(json);
}
