import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'statut_document.dart';

export 'statut_document.dart';

part 'reception.freezed.dart';
part 'reception.g.dart';

@freezed
abstract class Reception with _$Reception {
  const factory Reception({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'commande_fournisseur_id') String? commandeFournisseurId,
    @JsonKey(name: 'fournisseur_id') required String fournisseurId,
    @JsonKey(name: 'depot_id') required String depotId,
    @JsonKey(name: 'date_reception') required DateTime dateReception,
    @Default(StatutDocument.brouillon) StatutDocument statut,
    String? notes,
  }) = _Reception;

  factory Reception.fromJson(Map<String, dynamic> json) => _$ReceptionFromJson(json);
}

@freezed
abstract class ReceptionLigne with _$ReceptionLigne {
  const factory ReceptionLigne({
    String? id,
    @JsonKey(name: 'reception_id') required String receptionId,
    @JsonKey(name: 'commande_ligne_id') String? commandeLigneId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() @JsonKey(name: 'prix_unitaire') required Decimal prixUnitaire,
    @Default(0) int ordre,
  }) = _ReceptionLigne;

  factory ReceptionLigne.fromJson(Map<String, dynamic> json) => _$ReceptionLigneFromJson(json);
}
