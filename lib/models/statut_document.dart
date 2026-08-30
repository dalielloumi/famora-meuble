import 'package:freezed_annotation/freezed_annotation.dart';

enum StatutDocument {
  @JsonValue('BROUILLON')
  brouillon,
  @JsonValue('VALIDE')
  valide,
  @JsonValue('ANNULE')
  annule,
}

extension StatutDocumentLibelle on StatutDocument {
  String get libelle => switch (this) {
    StatutDocument.brouillon => 'Brouillon',
    StatutDocument.valide => 'Validé',
    StatutDocument.annule => 'Annulé',
  };
}

enum StatutPaiement {
  @JsonValue('IMPAYE')
  impaye,
  @JsonValue('PARTIEL')
  partiel,
  @JsonValue('SOLDE')
  solde,
}

extension StatutPaiementLibelle on StatutPaiement {
  String get libelle => switch (this) {
    StatutPaiement.impaye => 'Impayé',
    StatutPaiement.partiel => 'Partiel',
    StatutPaiement.solde => 'Soldé',
  };
}
