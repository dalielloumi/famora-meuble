import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart' show DecimalConverter;
import 'statut_document.dart';

export 'statut_document.dart';

part 'commande_client.freezed.dart';
part 'commande_client.g.dart';

@freezed
abstract class CommandeClient with _$CommandeClient {
  const factory CommandeClient({
    String? id,
    String? numero,
    @JsonKey(name: 'exercice_id') required String exerciceId,
    @JsonKey(name: 'client_id') required String clientId,
    @JsonKey(name: 'devis_id') String? devisId,
    @JsonKey(name: 'date_commande') required DateTime dateCommande,
    @JsonKey(name: 'date_livraison_prevue') DateTime? dateLivraisonPrevue,
    @Default(StatutDocument.brouillon) StatutDocument statut,
    @DecimalConverter() @JsonKey(name: 'total_ht') required Decimal totalHt,
    @DecimalConverter() required Decimal fodec,
    @DecimalConverter() @JsonKey(name: 'total_tva') required Decimal totalTva,
    @DecimalConverter() @JsonKey(name: 'total_ttc') required Decimal totalTtc,
    String? notes,
  }) = _CommandeClient;

  factory CommandeClient.fromJson(Map<String, dynamic> json) => _$CommandeClientFromJson(json);
}

@freezed
abstract class CommandeClientLigne with _$CommandeClientLigne {
  const factory CommandeClientLigne({
    String? id,
    @JsonKey(name: 'commande_id') required String commandeId,
    @JsonKey(name: 'article_id') required String articleId,
    @JsonKey(name: 'variante_id') String? varianteId,
    @DecimalConverter() required Decimal quantite,
    @DecimalConverter() @JsonKey(name: 'prix_unitaire') required Decimal prixUnitaire,
    @DecimalConverter() @JsonKey(name: 'remise_pct') required Decimal remisePct,
    @JsonKey(name: 'taux_tva_id') required String tauxTvaId,
    @DecimalConverter() @JsonKey(name: 'quantite_livree') required Decimal quantiteLivree,
    @Default(0) int ordre,
  }) = _CommandeClientLigne;

  factory CommandeClientLigne.fromJson(Map<String, dynamic> json) => _$CommandeClientLigneFromJson(json);
}
