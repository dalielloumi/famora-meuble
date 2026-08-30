import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;

part 'societe.freezed.dart';
part 'societe.g.dart';

@freezed
abstract class Societe with _$Societe {
  const factory Societe({
    @JsonKey(name: 'raison_sociale') required String raisonSociale,
    @JsonKey(name: 'matricule_fiscal') required String matriculeFiscal,
    required String adresse,
    @DecimalConverter() @JsonKey(name: 'timbre_fiscal') required Decimal timbreFiscal,
    @DecimalConverter() @JsonKey(name: 'taux_fodec') required Decimal tauxFodec,
    String? telephone,
    @JsonKey(name: 'logo_url') String? logoUrl,
  }) = _Societe;

  factory Societe.fromJson(Map<String, dynamic> json) => _$SocieteFromJson(json);
}
