import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'statut_document.dart';

export 'statut_document.dart';

part 'commande_fournisseur.freezed.dart';
part 'commande_fournisseur.g.dart';

@freezed
abstract class CommandeFournisseur with _$CommandeFournisseur {
  const factory CommandeFournisseur({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'fournisseur_id') required String fournisseurId,
    @JsonKey(name: 'depot_id') required String depotId,
    @JsonKey(name: 'date_commande') required DateTime dateCommande,
    @JsonKey(name: 'date_livraison_prevue') DateTime? dateLivraisonPrevue,
    @Default(StatutDocument.brouillon) StatutDocument statut,
    @DecimalConverter() @JsonKey(name: 'total_ht') required Decimal totalHt,
    @DecimalConverter() @JsonKey(name: 'total_tva') required Decimal totalTva,
    @DecimalConverter() @JsonKey(name: 'total_ttc') required Decimal totalTtc,
    String? notes,
  }) = _CommandeFournisseur;

  factory CommandeFournisseur.fromJson(Map<String, dynamic> json) => _$CommandeFournisseurFromJson(json);
}

@freezed
abstract class CommandeFournisseurLigne with _$CommandeFournisseurLigne {
  const factory CommandeFournisseurLigne({
    String? id,
    @JsonKey(name: 'commande_id') required String commandeId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() @JsonKey(name: 'prix_unitaire') required Decimal prixUnitaire,
    @DecimalConverter() @JsonKey(name: 'remise_pct') required Decimal remisePct,
    @JsonKey(name: 'taux_tva_id') required String tauxTvaId,
    @DecimalConverter() @JsonKey(name: 'quantite_recue') required Decimal quantiteRecue,
    @Default(0) int ordre,
  }) = _CommandeFournisseurLigne;

  factory CommandeFournisseurLigne.fromJson(Map<String, dynamic> json) => _$CommandeFournisseurLigneFromJson(json);
}
