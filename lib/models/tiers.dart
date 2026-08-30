import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;

part 'tiers.freezed.dart';
part 'tiers.g.dart';

enum TypeTiers {
  @JsonValue('CLIENT')
  client,
  @JsonValue('FOURNISSEUR')
  fournisseur,
  @JsonValue('LES_DEUX')
  lesDeux,
}

extension TypeTiersLibelle on TypeTiers {
  String get libelle => switch (this) {
    TypeTiers.client => 'Client',
    TypeTiers.fournisseur => 'Fournisseur',
    TypeTiers.lesDeux => 'Client & fournisseur',
  };
}

@freezed
abstract class Tiers with _$Tiers {
  const factory Tiers({
    String? id,
    required TypeTiers type,
    required String code,
    @JsonKey(name: 'raison_sociale') required String raisonSociale,
    @JsonKey(name: 'matricule_fiscal') String? matriculeFiscal,
    String? adresse,
    String? ville,
    String? telephone,
    String? email,
    @DecimalConverter() @JsonKey(name: 'taux_retenue_source') required Decimal tauxRetenueSource,
    @DecimalConverter() @JsonKey(name: 'plafond_credit') required Decimal plafondCredit,
    @DecimalConverter() required Decimal solde,
    @Default(true) bool actif,
  }) = _Tiers;

  factory Tiers.fromJson(Map<String, dynamic> json) => _$TiersFromJson(json);
}
