import 'package:freezed_annotation/freezed_annotation.dart';

part 'reference.freezed.dart';
part 'reference.g.dart';

/// Petites tables de référence en lecture seule côté app (unités, taux de
/// TVA) : gérées par script SQL pour l'instant, pas d'écran de gestion dédié.

@freezed
abstract class UniteMesure with _$UniteMesure {
  const factory UniteMesure({required String id, required String code, required String libelle}) = _UniteMesure;

  factory UniteMesure.fromJson(Map<String, dynamic> json) => _$UniteMesureFromJson(json);
}

@freezed
abstract class TauxTva with _$TauxTva {
  const factory TauxTva({
    required String id,
    required String code,
    required num taux,
    required String libelle,
  }) = _TauxTva;

  factory TauxTva.fromJson(Map<String, dynamic> json) => _$TauxTvaFromJson(json);
}
