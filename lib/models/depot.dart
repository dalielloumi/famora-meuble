import 'package:freezed_annotation/freezed_annotation.dart';

part 'depot.freezed.dart';
part 'depot.g.dart';

enum TypeDepot {
  @JsonValue('MAGASIN')
  magasin,
  @JsonValue('ATELIER')
  atelier,
  @JsonValue('AUTRE')
  autre,
}

extension TypeDepotLibelle on TypeDepot {
  String get libelle => switch (this) {
    TypeDepot.magasin => 'Magasin',
    TypeDepot.atelier => 'Atelier',
    TypeDepot.autre => 'Autre',
  };
}

@freezed
abstract class Depot with _$Depot {
  const factory Depot({
    String? id,
    required String code,
    required String libelle,
    required TypeDepot type,
    String? adresse,
    @Default(true) bool actif,
  }) = _Depot;

  factory Depot.fromJson(Map<String, dynamic> json) => _$DepotFromJson(json);
}
