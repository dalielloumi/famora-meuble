import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'statut_document.dart';

export 'statut_document.dart';

part 'avoir_achat.freezed.dart';
part 'avoir_achat.g.dart';

@freezed
abstract class AvoirAchat with _$AvoirAchat {
  const factory AvoirAchat({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'fournisseur_id') required String fournisseurId,
    @JsonKey(name: 'facture_achat_id') required String factureAchatId,
    required String motif,
    @JsonKey(name: 'date_avoir') required DateTime dateAvoir,
    @Default(StatutDocument.brouillon) StatutDocument statut,
    @DecimalConverter() @JsonKey(name: 'total_ht') required Decimal totalHt,
    @DecimalConverter() @JsonKey(name: 'total_tva') required Decimal totalTva,
    @DecimalConverter() @JsonKey(name: 'total_ttc') required Decimal totalTtc,
  }) = _AvoirAchat;

  factory AvoirAchat.fromJson(Map<String, dynamic> json) => _$AvoirAchatFromJson(json);
}

@freezed
abstract class AvoirAchatLigne with _$AvoirAchatLigne {
  const factory AvoirAchatLigne({
    String? id,
    @JsonKey(name: 'avoir_id') required String avoirId,
    @JsonKey(name: 'facture_ligne_id') String? factureLigneId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() @JsonKey(name: 'prix_unitaire') required Decimal prixUnitaire,
    @JsonKey(name: 'taux_tva_id') required String tauxTvaId,
    @Default(0) int ordre,
  }) = _AvoirAchatLigne;

  factory AvoirAchatLigne.fromJson(Map<String, dynamic> json) => _$AvoirAchatLigneFromJson(json);
}
