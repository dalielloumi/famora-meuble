import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'statut_document.dart';

export 'statut_document.dart';

part 'facture_achat.freezed.dart';
part 'facture_achat.g.dart';

@freezed
abstract class FactureAchat with _$FactureAchat {
  const factory FactureAchat({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'fournisseur_id') required String fournisseurId,
    @JsonKey(name: 'reception_id') String? receptionId,
    @JsonKey(name: 'numero_facture_fournisseur') String? numeroFactureFournisseur,
    @JsonKey(name: 'date_facture') required DateTime dateFacture,
    @JsonKey(name: 'date_echeance') DateTime? dateEcheance,
    @Default(StatutDocument.brouillon) StatutDocument statut,
    @Default(StatutPaiement.impaye) @JsonKey(name: 'statut_paiement') StatutPaiement statutPaiement,
    @DecimalConverter() @JsonKey(name: 'total_ht') required Decimal totalHt,
    @DecimalConverter() @JsonKey(name: 'total_tva') required Decimal totalTva,
    @DecimalConverter() @JsonKey(name: 'timbre_fiscal') required Decimal timbreFiscal,
    @DecimalConverter() @JsonKey(name: 'retenue_source') required Decimal retenueSource,
    @DecimalConverter() @JsonKey(name: 'total_ttc') required Decimal totalTtc,
    @DecimalConverter() @JsonKey(name: 'montant_regle') required Decimal montantRegle,
    String? notes,
  }) = _FactureAchat;

  factory FactureAchat.fromJson(Map<String, dynamic> json) => _$FactureAchatFromJson(json);
}

@freezed
abstract class FactureAchatLigne with _$FactureAchatLigne {
  const factory FactureAchatLigne({
    String? id,
    @JsonKey(name: 'facture_id') required String factureId,
    @JsonKey(name: 'reception_ligne_id') String? receptionLigneId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() @JsonKey(name: 'prix_unitaire') required Decimal prixUnitaire,
    @DecimalConverter() @JsonKey(name: 'remise_pct') required Decimal remisePct,
    @JsonKey(name: 'taux_tva_id') required String tauxTvaId,
    @Default(0) int ordre,
  }) = _FactureAchatLigne;

  factory FactureAchatLigne.fromJson(Map<String, dynamic> json) => _$FactureAchatLigneFromJson(json);
}
