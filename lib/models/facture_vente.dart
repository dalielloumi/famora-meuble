import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'statut_document.dart';

export 'statut_document.dart';

part 'facture_vente.freezed.dart';
part 'facture_vente.g.dart';

@freezed
abstract class FactureVente with _$FactureVente {
  const factory FactureVente({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'client_id') required String clientId,
    @JsonKey(name: 'bl_id') String? blId,
    @JsonKey(name: 'commande_client_id') String? commandeClientId,
    @JsonKey(name: 'date_facture') required DateTime dateFacture,
    @JsonKey(name: 'date_echeance') DateTime? dateEcheance,
    @Default(StatutDocument.brouillon) StatutDocument statut,
    @Default(StatutPaiement.impaye) @JsonKey(name: 'statut_paiement') StatutPaiement statutPaiement,
    @DecimalConverter() @JsonKey(name: 'total_ht') required Decimal totalHt,
    @DecimalConverter() required Decimal fodec,
    @DecimalConverter() @JsonKey(name: 'total_tva') required Decimal totalTva,
    @DecimalConverter() @JsonKey(name: 'timbre_fiscal') required Decimal timbreFiscal,
    @DecimalConverter() @JsonKey(name: 'frais_livraison') required Decimal fraisLivraison,
    @DecimalConverter() @JsonKey(name: 'retenue_source') required Decimal retenueSource,
    @DecimalConverter() @JsonKey(name: 'total_ttc') required Decimal totalTtc,
    @DecimalConverter() @JsonKey(name: 'montant_regle') required Decimal montantRegle,
    String? notes,
  }) = _FactureVente;

  factory FactureVente.fromJson(Map<String, dynamic> json) => _$FactureVenteFromJson(json);
}

@freezed
abstract class FactureVenteLigne with _$FactureVenteLigne {
  const factory FactureVenteLigne({
    String? id,
    @JsonKey(name: 'facture_id') required String factureId,
    @JsonKey(name: 'bl_ligne_id') String? blLigneId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() @JsonKey(name: 'prix_unitaire') required Decimal prixUnitaire,
    @DecimalConverter() @JsonKey(name: 'remise_pct') required Decimal remisePct,
    @JsonKey(name: 'taux_tva_id') required String tauxTvaId,
    @Default(0) int ordre,
  }) = _FactureVenteLigne;

  factory FactureVenteLigne.fromJson(Map<String, dynamic> json) => _$FactureVenteLigneFromJson(json);
}
