import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'reglement.dart' show SensReglement;

export 'reglement.dart' show SensReglement, SensReglementLibelle;

part 'caisse.freezed.dart';
part 'caisse.g.dart';

@freezed
abstract class Caisse with _$Caisse {
  const factory Caisse({
    String? id,
    required String libelle,
    @DecimalConverter() required Decimal solde,
    @Default(true) bool actif,
  }) = _Caisse;

  factory Caisse.fromJson(Map<String, dynamic> json) => _$CaisseFromJson(json);
}

@freezed
abstract class CaisseOperation with _$CaisseOperation {
  const factory CaisseOperation({
    String? id,
    @JsonKey(name: 'caisse_id') required String caisseId,
    required SensReglement sens,
    @DecimalConverter() required Decimal montant,
    @JsonKey(name: 'date_operation') required DateTime dateOperation,
    @JsonKey(name: 'reglement_id') String? reglementId,
    required String libelle,
  }) = _CaisseOperation;

  factory CaisseOperation.fromJson(Map<String, dynamic> json) => _$CaisseOperationFromJson(json);
}
