import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;

part 'stock.freezed.dart';
part 'stock.g.dart';

enum TypeMouvementStock {
  @JsonValue('ENTREE_ACHAT')
  entreeAchat,
  @JsonValue('SORTIE_VENTE')
  sortieVente,
  @JsonValue('ENTREE_PRODUCTION')
  entreeProduction,
  @JsonValue('SORTIE_PRODUCTION')
  sortieProduction,
  @JsonValue('TRANSFERT_ENTREE')
  transfertEntree,
  @JsonValue('TRANSFERT_SORTIE')
  transfertSortie,
  @JsonValue('INVENTAIRE_AJUST')
  inventaireAjust,
  @JsonValue('RETOUR_CLIENT')
  retourClient,
  @JsonValue('RETOUR_FOURNISSEUR')
  retourFournisseur,
}

extension TypeMouvementStockLibelle on TypeMouvementStock {
  String get libelle => switch (this) {
    TypeMouvementStock.entreeAchat => 'Entrée achat',
    TypeMouvementStock.sortieVente => 'Sortie vente',
    TypeMouvementStock.entreeProduction => 'Entrée production',
    TypeMouvementStock.sortieProduction => 'Sortie production',
    TypeMouvementStock.transfertEntree => 'Transfert (entrée)',
    TypeMouvementStock.transfertSortie => 'Transfert (sortie)',
    TypeMouvementStock.inventaireAjust => 'Ajustement inventaire',
    TypeMouvementStock.retourClient => 'Retour client',
    TypeMouvementStock.retourFournisseur => 'Retour fournisseur',
  };
}

enum SensMouvement {
  @JsonValue('ENTREE')
  entree,
  @JsonValue('SORTIE')
  sortie,
}

@freezed
abstract class StockLigne with _$StockLigne {
  const factory StockLigne({
    required String id,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @JsonKey(name: 'depot_id') required String depotId,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() required Decimal cmp,
  }) = _StockLigne;

  factory StockLigne.fromJson(Map<String, dynamic> json) => _$StockLigneFromJson(json);
}

@freezed
abstract class MouvementStock with _$MouvementStock {
  const factory MouvementStock({
    String? id,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @JsonKey(name: 'depot_id') required String depotId,
    @JsonKey(name: 'type_mouvement') required TypeMouvementStock typeMouvement,
    required SensMouvement sens,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() @JsonKey(name: 'prix_unitaire') required Decimal prixUnitaire,
    @JsonKey(name: 'date_mouvement') required DateTime dateMouvement,
    String? notes,
  }) = _MouvementStock;

  factory MouvementStock.fromJson(Map<String, dynamic> json) => _$MouvementStockFromJson(json);
}
