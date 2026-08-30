// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facture_vente.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FactureVente {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'client_id') String get clientId;@JsonKey(name: 'bl_id') String? get blId;@JsonKey(name: 'commande_client_id') String? get commandeClientId;@JsonKey(name: 'date_facture') DateTime get dateFacture;@JsonKey(name: 'date_echeance') DateTime? get dateEcheance; StatutDocument get statut;@JsonKey(name: 'statut_paiement') StatutPaiement get statutPaiement;@DecimalConverter()@JsonKey(name: 'total_ht') Decimal get totalHt;@DecimalConverter() Decimal get fodec;@DecimalConverter()@JsonKey(name: 'total_tva') Decimal get totalTva;@DecimalConverter()@JsonKey(name: 'timbre_fiscal') Decimal get timbreFiscal;@DecimalConverter()@JsonKey(name: 'frais_livraison') Decimal get fraisLivraison;@DecimalConverter()@JsonKey(name: 'retenue_source') Decimal get retenueSource;@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal get totalTtc;@DecimalConverter()@JsonKey(name: 'montant_regle') Decimal get montantRegle; String? get notes;
/// Create a copy of FactureVente
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FactureVenteCopyWith<FactureVente> get copyWith => _$FactureVenteCopyWithImpl<FactureVente>(this as FactureVente, _$identity);

  /// Serializes this FactureVente to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FactureVente&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.blId, blId) || other.blId == blId)&&(identical(other.commandeClientId, commandeClientId) || other.commandeClientId == commandeClientId)&&(identical(other.dateFacture, dateFacture) || other.dateFacture == dateFacture)&&(identical(other.dateEcheance, dateEcheance) || other.dateEcheance == dateEcheance)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.statutPaiement, statutPaiement) || other.statutPaiement == statutPaiement)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.fodec, fodec) || other.fodec == fodec)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.timbreFiscal, timbreFiscal) || other.timbreFiscal == timbreFiscal)&&(identical(other.fraisLivraison, fraisLivraison) || other.fraisLivraison == fraisLivraison)&&(identical(other.retenueSource, retenueSource) || other.retenueSource == retenueSource)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc)&&(identical(other.montantRegle, montantRegle) || other.montantRegle == montantRegle)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,numero,exerciceId,clientId,blId,commandeClientId,dateFacture,dateEcheance,statut,statutPaiement,totalHt,fodec,totalTva,timbreFiscal,fraisLivraison,retenueSource,totalTtc,montantRegle,notes]);

@override
String toString() {
  return 'FactureVente(id: $id, numero: $numero, exerciceId: $exerciceId, clientId: $clientId, blId: $blId, commandeClientId: $commandeClientId, dateFacture: $dateFacture, dateEcheance: $dateEcheance, statut: $statut, statutPaiement: $statutPaiement, totalHt: $totalHt, fodec: $fodec, totalTva: $totalTva, timbreFiscal: $timbreFiscal, fraisLivraison: $fraisLivraison, retenueSource: $retenueSource, totalTtc: $totalTtc, montantRegle: $montantRegle, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $FactureVenteCopyWith<$Res>  {
  factory $FactureVenteCopyWith(FactureVente value, $Res Function(FactureVente) _then) = _$FactureVenteCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'bl_id') String? blId,@JsonKey(name: 'commande_client_id') String? commandeClientId,@JsonKey(name: 'date_facture') DateTime dateFacture,@JsonKey(name: 'date_echeance') DateTime? dateEcheance, StatutDocument statut,@JsonKey(name: 'statut_paiement') StatutPaiement statutPaiement,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter() Decimal fodec,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'timbre_fiscal') Decimal timbreFiscal,@DecimalConverter()@JsonKey(name: 'frais_livraison') Decimal fraisLivraison,@DecimalConverter()@JsonKey(name: 'retenue_source') Decimal retenueSource,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc,@DecimalConverter()@JsonKey(name: 'montant_regle') Decimal montantRegle, String? notes
});




}
/// @nodoc
class _$FactureVenteCopyWithImpl<$Res>
    implements $FactureVenteCopyWith<$Res> {
  _$FactureVenteCopyWithImpl(this._self, this._then);

  final FactureVente _self;
  final $Res Function(FactureVente) _then;

/// Create a copy of FactureVente
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? clientId = null,Object? blId = freezed,Object? commandeClientId = freezed,Object? dateFacture = null,Object? dateEcheance = freezed,Object? statut = null,Object? statutPaiement = null,Object? totalHt = null,Object? fodec = null,Object? totalTva = null,Object? timbreFiscal = null,Object? fraisLivraison = null,Object? retenueSource = null,Object? totalTtc = null,Object? montantRegle = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,blId: freezed == blId ? _self.blId : blId // ignore: cast_nullable_to_non_nullable
as String?,commandeClientId: freezed == commandeClientId ? _self.commandeClientId : commandeClientId // ignore: cast_nullable_to_non_nullable
as String?,dateFacture: null == dateFacture ? _self.dateFacture : dateFacture // ignore: cast_nullable_to_non_nullable
as DateTime,dateEcheance: freezed == dateEcheance ? _self.dateEcheance : dateEcheance // ignore: cast_nullable_to_non_nullable
as DateTime?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,statutPaiement: null == statutPaiement ? _self.statutPaiement : statutPaiement // ignore: cast_nullable_to_non_nullable
as StatutPaiement,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,fodec: null == fodec ? _self.fodec : fodec // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,timbreFiscal: null == timbreFiscal ? _self.timbreFiscal : timbreFiscal // ignore: cast_nullable_to_non_nullable
as Decimal,fraisLivraison: null == fraisLivraison ? _self.fraisLivraison : fraisLivraison // ignore: cast_nullable_to_non_nullable
as Decimal,retenueSource: null == retenueSource ? _self.retenueSource : retenueSource // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,montantRegle: null == montantRegle ? _self.montantRegle : montantRegle // ignore: cast_nullable_to_non_nullable
as Decimal,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FactureVente].
extension FactureVentePatterns on FactureVente {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FactureVente value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FactureVente() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FactureVente value)  $default,){
final _that = this;
switch (_that) {
case _FactureVente():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FactureVente value)?  $default,){
final _that = this;
switch (_that) {
case _FactureVente() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'bl_id')  String? blId, @JsonKey(name: 'commande_client_id')  String? commandeClientId, @JsonKey(name: 'date_facture')  DateTime dateFacture, @JsonKey(name: 'date_echeance')  DateTime? dateEcheance,  StatutDocument statut, @JsonKey(name: 'statut_paiement')  StatutPaiement statutPaiement, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'timbre_fiscal')  Decimal timbreFiscal, @DecimalConverter()@JsonKey(name: 'frais_livraison')  Decimal fraisLivraison, @DecimalConverter()@JsonKey(name: 'retenue_source')  Decimal retenueSource, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc, @DecimalConverter()@JsonKey(name: 'montant_regle')  Decimal montantRegle,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FactureVente() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.blId,_that.commandeClientId,_that.dateFacture,_that.dateEcheance,_that.statut,_that.statutPaiement,_that.totalHt,_that.fodec,_that.totalTva,_that.timbreFiscal,_that.fraisLivraison,_that.retenueSource,_that.totalTtc,_that.montantRegle,_that.notes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'bl_id')  String? blId, @JsonKey(name: 'commande_client_id')  String? commandeClientId, @JsonKey(name: 'date_facture')  DateTime dateFacture, @JsonKey(name: 'date_echeance')  DateTime? dateEcheance,  StatutDocument statut, @JsonKey(name: 'statut_paiement')  StatutPaiement statutPaiement, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'timbre_fiscal')  Decimal timbreFiscal, @DecimalConverter()@JsonKey(name: 'frais_livraison')  Decimal fraisLivraison, @DecimalConverter()@JsonKey(name: 'retenue_source')  Decimal retenueSource, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc, @DecimalConverter()@JsonKey(name: 'montant_regle')  Decimal montantRegle,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _FactureVente():
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.blId,_that.commandeClientId,_that.dateFacture,_that.dateEcheance,_that.statut,_that.statutPaiement,_that.totalHt,_that.fodec,_that.totalTva,_that.timbreFiscal,_that.fraisLivraison,_that.retenueSource,_that.totalTtc,_that.montantRegle,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'bl_id')  String? blId, @JsonKey(name: 'commande_client_id')  String? commandeClientId, @JsonKey(name: 'date_facture')  DateTime dateFacture, @JsonKey(name: 'date_echeance')  DateTime? dateEcheance,  StatutDocument statut, @JsonKey(name: 'statut_paiement')  StatutPaiement statutPaiement, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'timbre_fiscal')  Decimal timbreFiscal, @DecimalConverter()@JsonKey(name: 'frais_livraison')  Decimal fraisLivraison, @DecimalConverter()@JsonKey(name: 'retenue_source')  Decimal retenueSource, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc, @DecimalConverter()@JsonKey(name: 'montant_regle')  Decimal montantRegle,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _FactureVente() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.blId,_that.commandeClientId,_that.dateFacture,_that.dateEcheance,_that.statut,_that.statutPaiement,_that.totalHt,_that.fodec,_that.totalTva,_that.timbreFiscal,_that.fraisLivraison,_that.retenueSource,_that.totalTtc,_that.montantRegle,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FactureVente implements FactureVente {
  const _FactureVente({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'client_id') required this.clientId, @JsonKey(name: 'bl_id') this.blId, @JsonKey(name: 'commande_client_id') this.commandeClientId, @JsonKey(name: 'date_facture') required this.dateFacture, @JsonKey(name: 'date_echeance') this.dateEcheance, this.statut = StatutDocument.brouillon, @JsonKey(name: 'statut_paiement') this.statutPaiement = StatutPaiement.impaye, @DecimalConverter()@JsonKey(name: 'total_ht') required this.totalHt, @DecimalConverter() required this.fodec, @DecimalConverter()@JsonKey(name: 'total_tva') required this.totalTva, @DecimalConverter()@JsonKey(name: 'timbre_fiscal') required this.timbreFiscal, @DecimalConverter()@JsonKey(name: 'frais_livraison') required this.fraisLivraison, @DecimalConverter()@JsonKey(name: 'retenue_source') required this.retenueSource, @DecimalConverter()@JsonKey(name: 'total_ttc') required this.totalTtc, @DecimalConverter()@JsonKey(name: 'montant_regle') required this.montantRegle, this.notes});
  factory _FactureVente.fromJson(Map<String, dynamic> json) => _$FactureVenteFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'client_id') final  String clientId;
@override@JsonKey(name: 'bl_id') final  String? blId;
@override@JsonKey(name: 'commande_client_id') final  String? commandeClientId;
@override@JsonKey(name: 'date_facture') final  DateTime dateFacture;
@override@JsonKey(name: 'date_echeance') final  DateTime? dateEcheance;
@override@JsonKey() final  StatutDocument statut;
@override@JsonKey(name: 'statut_paiement') final  StatutPaiement statutPaiement;
@override@DecimalConverter()@JsonKey(name: 'total_ht') final  Decimal totalHt;
@override@DecimalConverter() final  Decimal fodec;
@override@DecimalConverter()@JsonKey(name: 'total_tva') final  Decimal totalTva;
@override@DecimalConverter()@JsonKey(name: 'timbre_fiscal') final  Decimal timbreFiscal;
@override@DecimalConverter()@JsonKey(name: 'frais_livraison') final  Decimal fraisLivraison;
@override@DecimalConverter()@JsonKey(name: 'retenue_source') final  Decimal retenueSource;
@override@DecimalConverter()@JsonKey(name: 'total_ttc') final  Decimal totalTtc;
@override@DecimalConverter()@JsonKey(name: 'montant_regle') final  Decimal montantRegle;
@override final  String? notes;

/// Create a copy of FactureVente
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FactureVenteCopyWith<_FactureVente> get copyWith => __$FactureVenteCopyWithImpl<_FactureVente>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FactureVenteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FactureVente&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.blId, blId) || other.blId == blId)&&(identical(other.commandeClientId, commandeClientId) || other.commandeClientId == commandeClientId)&&(identical(other.dateFacture, dateFacture) || other.dateFacture == dateFacture)&&(identical(other.dateEcheance, dateEcheance) || other.dateEcheance == dateEcheance)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.statutPaiement, statutPaiement) || other.statutPaiement == statutPaiement)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.fodec, fodec) || other.fodec == fodec)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.timbreFiscal, timbreFiscal) || other.timbreFiscal == timbreFiscal)&&(identical(other.fraisLivraison, fraisLivraison) || other.fraisLivraison == fraisLivraison)&&(identical(other.retenueSource, retenueSource) || other.retenueSource == retenueSource)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc)&&(identical(other.montantRegle, montantRegle) || other.montantRegle == montantRegle)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,numero,exerciceId,clientId,blId,commandeClientId,dateFacture,dateEcheance,statut,statutPaiement,totalHt,fodec,totalTva,timbreFiscal,fraisLivraison,retenueSource,totalTtc,montantRegle,notes]);

@override
String toString() {
  return 'FactureVente(id: $id, numero: $numero, exerciceId: $exerciceId, clientId: $clientId, blId: $blId, commandeClientId: $commandeClientId, dateFacture: $dateFacture, dateEcheance: $dateEcheance, statut: $statut, statutPaiement: $statutPaiement, totalHt: $totalHt, fodec: $fodec, totalTva: $totalTva, timbreFiscal: $timbreFiscal, fraisLivraison: $fraisLivraison, retenueSource: $retenueSource, totalTtc: $totalTtc, montantRegle: $montantRegle, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$FactureVenteCopyWith<$Res> implements $FactureVenteCopyWith<$Res> {
  factory _$FactureVenteCopyWith(_FactureVente value, $Res Function(_FactureVente) _then) = __$FactureVenteCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'bl_id') String? blId,@JsonKey(name: 'commande_client_id') String? commandeClientId,@JsonKey(name: 'date_facture') DateTime dateFacture,@JsonKey(name: 'date_echeance') DateTime? dateEcheance, StatutDocument statut,@JsonKey(name: 'statut_paiement') StatutPaiement statutPaiement,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter() Decimal fodec,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'timbre_fiscal') Decimal timbreFiscal,@DecimalConverter()@JsonKey(name: 'frais_livraison') Decimal fraisLivraison,@DecimalConverter()@JsonKey(name: 'retenue_source') Decimal retenueSource,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc,@DecimalConverter()@JsonKey(name: 'montant_regle') Decimal montantRegle, String? notes
});




}
/// @nodoc
class __$FactureVenteCopyWithImpl<$Res>
    implements _$FactureVenteCopyWith<$Res> {
  __$FactureVenteCopyWithImpl(this._self, this._then);

  final _FactureVente _self;
  final $Res Function(_FactureVente) _then;

/// Create a copy of FactureVente
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? clientId = null,Object? blId = freezed,Object? commandeClientId = freezed,Object? dateFacture = null,Object? dateEcheance = freezed,Object? statut = null,Object? statutPaiement = null,Object? totalHt = null,Object? fodec = null,Object? totalTva = null,Object? timbreFiscal = null,Object? fraisLivraison = null,Object? retenueSource = null,Object? totalTtc = null,Object? montantRegle = null,Object? notes = freezed,}) {
  return _then(_FactureVente(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,blId: freezed == blId ? _self.blId : blId // ignore: cast_nullable_to_non_nullable
as String?,commandeClientId: freezed == commandeClientId ? _self.commandeClientId : commandeClientId // ignore: cast_nullable_to_non_nullable
as String?,dateFacture: null == dateFacture ? _self.dateFacture : dateFacture // ignore: cast_nullable_to_non_nullable
as DateTime,dateEcheance: freezed == dateEcheance ? _self.dateEcheance : dateEcheance // ignore: cast_nullable_to_non_nullable
as DateTime?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,statutPaiement: null == statutPaiement ? _self.statutPaiement : statutPaiement // ignore: cast_nullable_to_non_nullable
as StatutPaiement,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,fodec: null == fodec ? _self.fodec : fodec // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,timbreFiscal: null == timbreFiscal ? _self.timbreFiscal : timbreFiscal // ignore: cast_nullable_to_non_nullable
as Decimal,fraisLivraison: null == fraisLivraison ? _self.fraisLivraison : fraisLivraison // ignore: cast_nullable_to_non_nullable
as Decimal,retenueSource: null == retenueSource ? _self.retenueSource : retenueSource // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,montantRegle: null == montantRegle ? _self.montantRegle : montantRegle // ignore: cast_nullable_to_non_nullable
as Decimal,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FactureVenteLigne {

 String? get id;@JsonKey(name: 'facture_id') String get factureId;@JsonKey(name: 'bl_ligne_id') String? get blLigneId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@DecimalConverter() Decimal get quantite;@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal get prixUnitaire;@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal get remisePct;@JsonKey(name: 'taux_tva_id') String get tauxTvaId; int get ordre;
/// Create a copy of FactureVenteLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FactureVenteLigneCopyWith<FactureVenteLigne> get copyWith => _$FactureVenteLigneCopyWithImpl<FactureVenteLigne>(this as FactureVenteLigne, _$identity);

  /// Serializes this FactureVenteLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FactureVenteLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.factureId, factureId) || other.factureId == factureId)&&(identical(other.blLigneId, blLigneId) || other.blLigneId == blLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.remisePct, remisePct) || other.remisePct == remisePct)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,factureId,blLigneId,articleId,varianteId,quantite,prixUnitaire,remisePct,tauxTvaId,ordre);

@override
String toString() {
  return 'FactureVenteLigne(id: $id, factureId: $factureId, blLigneId: $blLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, remisePct: $remisePct, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class $FactureVenteLigneCopyWith<$Res>  {
  factory $FactureVenteLigneCopyWith(FactureVenteLigne value, $Res Function(FactureVenteLigne) _then) = _$FactureVenteLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'facture_id') String factureId,@JsonKey(name: 'bl_ligne_id') String? blLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal remisePct,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class _$FactureVenteLigneCopyWithImpl<$Res>
    implements $FactureVenteLigneCopyWith<$Res> {
  _$FactureVenteLigneCopyWithImpl(this._self, this._then);

  final FactureVenteLigne _self;
  final $Res Function(FactureVenteLigne) _then;

/// Create a copy of FactureVenteLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? factureId = null,Object? blLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? remisePct = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,factureId: null == factureId ? _self.factureId : factureId // ignore: cast_nullable_to_non_nullable
as String,blLigneId: freezed == blLigneId ? _self.blLigneId : blLigneId // ignore: cast_nullable_to_non_nullable
as String?,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,remisePct: null == remisePct ? _self.remisePct : remisePct // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FactureVenteLigne].
extension FactureVenteLignePatterns on FactureVenteLigne {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FactureVenteLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FactureVenteLigne() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FactureVenteLigne value)  $default,){
final _that = this;
switch (_that) {
case _FactureVenteLigne():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FactureVenteLigne value)?  $default,){
final _that = this;
switch (_that) {
case _FactureVenteLigne() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'facture_id')  String factureId, @JsonKey(name: 'bl_ligne_id')  String? blLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FactureVenteLigne() when $default != null:
return $default(_that.id,_that.factureId,_that.blLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.ordre);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'facture_id')  String factureId, @JsonKey(name: 'bl_ligne_id')  String? blLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)  $default,) {final _that = this;
switch (_that) {
case _FactureVenteLigne():
return $default(_that.id,_that.factureId,_that.blLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.ordre);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'facture_id')  String factureId, @JsonKey(name: 'bl_ligne_id')  String? blLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)?  $default,) {final _that = this;
switch (_that) {
case _FactureVenteLigne() when $default != null:
return $default(_that.id,_that.factureId,_that.blLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.ordre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FactureVenteLigne implements FactureVenteLigne {
  const _FactureVenteLigne({this.id, @JsonKey(name: 'facture_id') required this.factureId, @JsonKey(name: 'bl_ligne_id') this.blLigneId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @DecimalConverter() required this.quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire') required this.prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct') required this.remisePct, @JsonKey(name: 'taux_tva_id') required this.tauxTvaId, this.ordre = 0});
  factory _FactureVenteLigne.fromJson(Map<String, dynamic> json) => _$FactureVenteLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'facture_id') final  String factureId;
@override@JsonKey(name: 'bl_ligne_id') final  String? blLigneId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter()@JsonKey(name: 'prix_unitaire') final  Decimal prixUnitaire;
@override@DecimalConverter()@JsonKey(name: 'remise_pct') final  Decimal remisePct;
@override@JsonKey(name: 'taux_tva_id') final  String tauxTvaId;
@override@JsonKey() final  int ordre;

/// Create a copy of FactureVenteLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FactureVenteLigneCopyWith<_FactureVenteLigne> get copyWith => __$FactureVenteLigneCopyWithImpl<_FactureVenteLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FactureVenteLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FactureVenteLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.factureId, factureId) || other.factureId == factureId)&&(identical(other.blLigneId, blLigneId) || other.blLigneId == blLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.remisePct, remisePct) || other.remisePct == remisePct)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,factureId,blLigneId,articleId,varianteId,quantite,prixUnitaire,remisePct,tauxTvaId,ordre);

@override
String toString() {
  return 'FactureVenteLigne(id: $id, factureId: $factureId, blLigneId: $blLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, remisePct: $remisePct, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class _$FactureVenteLigneCopyWith<$Res> implements $FactureVenteLigneCopyWith<$Res> {
  factory _$FactureVenteLigneCopyWith(_FactureVenteLigne value, $Res Function(_FactureVenteLigne) _then) = __$FactureVenteLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'facture_id') String factureId,@JsonKey(name: 'bl_ligne_id') String? blLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal remisePct,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class __$FactureVenteLigneCopyWithImpl<$Res>
    implements _$FactureVenteLigneCopyWith<$Res> {
  __$FactureVenteLigneCopyWithImpl(this._self, this._then);

  final _FactureVenteLigne _self;
  final $Res Function(_FactureVenteLigne) _then;

/// Create a copy of FactureVenteLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? factureId = null,Object? blLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? remisePct = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_FactureVenteLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,factureId: null == factureId ? _self.factureId : factureId // ignore: cast_nullable_to_non_nullable
as String,blLigneId: freezed == blLigneId ? _self.blLigneId : blLigneId // ignore: cast_nullable_to_non_nullable
as String?,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,remisePct: null == remisePct ? _self.remisePct : remisePct // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
