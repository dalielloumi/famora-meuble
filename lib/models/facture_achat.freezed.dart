// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facture_achat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FactureAchat {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'fournisseur_id') String get fournisseurId;@JsonKey(name: 'reception_id') String? get receptionId;@JsonKey(name: 'numero_facture_fournisseur') String? get numeroFactureFournisseur;@JsonKey(name: 'date_facture') DateTime get dateFacture;@JsonKey(name: 'date_echeance') DateTime? get dateEcheance; StatutDocument get statut;@JsonKey(name: 'statut_paiement') StatutPaiement get statutPaiement;@DecimalConverter()@JsonKey(name: 'total_ht') Decimal get totalHt;@DecimalConverter()@JsonKey(name: 'total_tva') Decimal get totalTva;@DecimalConverter()@JsonKey(name: 'timbre_fiscal') Decimal get timbreFiscal;@DecimalConverter()@JsonKey(name: 'retenue_source') Decimal get retenueSource;@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal get totalTtc;@DecimalConverter()@JsonKey(name: 'montant_regle') Decimal get montantRegle; String? get notes;
/// Create a copy of FactureAchat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FactureAchatCopyWith<FactureAchat> get copyWith => _$FactureAchatCopyWithImpl<FactureAchat>(this as FactureAchat, _$identity);

  /// Serializes this FactureAchat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FactureAchat&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.fournisseurId, fournisseurId) || other.fournisseurId == fournisseurId)&&(identical(other.receptionId, receptionId) || other.receptionId == receptionId)&&(identical(other.numeroFactureFournisseur, numeroFactureFournisseur) || other.numeroFactureFournisseur == numeroFactureFournisseur)&&(identical(other.dateFacture, dateFacture) || other.dateFacture == dateFacture)&&(identical(other.dateEcheance, dateEcheance) || other.dateEcheance == dateEcheance)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.statutPaiement, statutPaiement) || other.statutPaiement == statutPaiement)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.timbreFiscal, timbreFiscal) || other.timbreFiscal == timbreFiscal)&&(identical(other.retenueSource, retenueSource) || other.retenueSource == retenueSource)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc)&&(identical(other.montantRegle, montantRegle) || other.montantRegle == montantRegle)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,fournisseurId,receptionId,numeroFactureFournisseur,dateFacture,dateEcheance,statut,statutPaiement,totalHt,totalTva,timbreFiscal,retenueSource,totalTtc,montantRegle,notes);

@override
String toString() {
  return 'FactureAchat(id: $id, numero: $numero, exerciceId: $exerciceId, fournisseurId: $fournisseurId, receptionId: $receptionId, numeroFactureFournisseur: $numeroFactureFournisseur, dateFacture: $dateFacture, dateEcheance: $dateEcheance, statut: $statut, statutPaiement: $statutPaiement, totalHt: $totalHt, totalTva: $totalTva, timbreFiscal: $timbreFiscal, retenueSource: $retenueSource, totalTtc: $totalTtc, montantRegle: $montantRegle, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $FactureAchatCopyWith<$Res>  {
  factory $FactureAchatCopyWith(FactureAchat value, $Res Function(FactureAchat) _then) = _$FactureAchatCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'fournisseur_id') String fournisseurId,@JsonKey(name: 'reception_id') String? receptionId,@JsonKey(name: 'numero_facture_fournisseur') String? numeroFactureFournisseur,@JsonKey(name: 'date_facture') DateTime dateFacture,@JsonKey(name: 'date_echeance') DateTime? dateEcheance, StatutDocument statut,@JsonKey(name: 'statut_paiement') StatutPaiement statutPaiement,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'timbre_fiscal') Decimal timbreFiscal,@DecimalConverter()@JsonKey(name: 'retenue_source') Decimal retenueSource,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc,@DecimalConverter()@JsonKey(name: 'montant_regle') Decimal montantRegle, String? notes
});




}
/// @nodoc
class _$FactureAchatCopyWithImpl<$Res>
    implements $FactureAchatCopyWith<$Res> {
  _$FactureAchatCopyWithImpl(this._self, this._then);

  final FactureAchat _self;
  final $Res Function(FactureAchat) _then;

/// Create a copy of FactureAchat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? fournisseurId = null,Object? receptionId = freezed,Object? numeroFactureFournisseur = freezed,Object? dateFacture = null,Object? dateEcheance = freezed,Object? statut = null,Object? statutPaiement = null,Object? totalHt = null,Object? totalTva = null,Object? timbreFiscal = null,Object? retenueSource = null,Object? totalTtc = null,Object? montantRegle = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,fournisseurId: null == fournisseurId ? _self.fournisseurId : fournisseurId // ignore: cast_nullable_to_non_nullable
as String,receptionId: freezed == receptionId ? _self.receptionId : receptionId // ignore: cast_nullable_to_non_nullable
as String?,numeroFactureFournisseur: freezed == numeroFactureFournisseur ? _self.numeroFactureFournisseur : numeroFactureFournisseur // ignore: cast_nullable_to_non_nullable
as String?,dateFacture: null == dateFacture ? _self.dateFacture : dateFacture // ignore: cast_nullable_to_non_nullable
as DateTime,dateEcheance: freezed == dateEcheance ? _self.dateEcheance : dateEcheance // ignore: cast_nullable_to_non_nullable
as DateTime?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,statutPaiement: null == statutPaiement ? _self.statutPaiement : statutPaiement // ignore: cast_nullable_to_non_nullable
as StatutPaiement,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,timbreFiscal: null == timbreFiscal ? _self.timbreFiscal : timbreFiscal // ignore: cast_nullable_to_non_nullable
as Decimal,retenueSource: null == retenueSource ? _self.retenueSource : retenueSource // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,montantRegle: null == montantRegle ? _self.montantRegle : montantRegle // ignore: cast_nullable_to_non_nullable
as Decimal,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FactureAchat].
extension FactureAchatPatterns on FactureAchat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FactureAchat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FactureAchat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FactureAchat value)  $default,){
final _that = this;
switch (_that) {
case _FactureAchat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FactureAchat value)?  $default,){
final _that = this;
switch (_that) {
case _FactureAchat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'reception_id')  String? receptionId, @JsonKey(name: 'numero_facture_fournisseur')  String? numeroFactureFournisseur, @JsonKey(name: 'date_facture')  DateTime dateFacture, @JsonKey(name: 'date_echeance')  DateTime? dateEcheance,  StatutDocument statut, @JsonKey(name: 'statut_paiement')  StatutPaiement statutPaiement, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'timbre_fiscal')  Decimal timbreFiscal, @DecimalConverter()@JsonKey(name: 'retenue_source')  Decimal retenueSource, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc, @DecimalConverter()@JsonKey(name: 'montant_regle')  Decimal montantRegle,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FactureAchat() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.fournisseurId,_that.receptionId,_that.numeroFactureFournisseur,_that.dateFacture,_that.dateEcheance,_that.statut,_that.statutPaiement,_that.totalHt,_that.totalTva,_that.timbreFiscal,_that.retenueSource,_that.totalTtc,_that.montantRegle,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'reception_id')  String? receptionId, @JsonKey(name: 'numero_facture_fournisseur')  String? numeroFactureFournisseur, @JsonKey(name: 'date_facture')  DateTime dateFacture, @JsonKey(name: 'date_echeance')  DateTime? dateEcheance,  StatutDocument statut, @JsonKey(name: 'statut_paiement')  StatutPaiement statutPaiement, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'timbre_fiscal')  Decimal timbreFiscal, @DecimalConverter()@JsonKey(name: 'retenue_source')  Decimal retenueSource, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc, @DecimalConverter()@JsonKey(name: 'montant_regle')  Decimal montantRegle,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _FactureAchat():
return $default(_that.id,_that.numero,_that.exerciceId,_that.fournisseurId,_that.receptionId,_that.numeroFactureFournisseur,_that.dateFacture,_that.dateEcheance,_that.statut,_that.statutPaiement,_that.totalHt,_that.totalTva,_that.timbreFiscal,_that.retenueSource,_that.totalTtc,_that.montantRegle,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'reception_id')  String? receptionId, @JsonKey(name: 'numero_facture_fournisseur')  String? numeroFactureFournisseur, @JsonKey(name: 'date_facture')  DateTime dateFacture, @JsonKey(name: 'date_echeance')  DateTime? dateEcheance,  StatutDocument statut, @JsonKey(name: 'statut_paiement')  StatutPaiement statutPaiement, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'timbre_fiscal')  Decimal timbreFiscal, @DecimalConverter()@JsonKey(name: 'retenue_source')  Decimal retenueSource, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc, @DecimalConverter()@JsonKey(name: 'montant_regle')  Decimal montantRegle,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _FactureAchat() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.fournisseurId,_that.receptionId,_that.numeroFactureFournisseur,_that.dateFacture,_that.dateEcheance,_that.statut,_that.statutPaiement,_that.totalHt,_that.totalTva,_that.timbreFiscal,_that.retenueSource,_that.totalTtc,_that.montantRegle,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FactureAchat implements FactureAchat {
  const _FactureAchat({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'fournisseur_id') required this.fournisseurId, @JsonKey(name: 'reception_id') this.receptionId, @JsonKey(name: 'numero_facture_fournisseur') this.numeroFactureFournisseur, @JsonKey(name: 'date_facture') required this.dateFacture, @JsonKey(name: 'date_echeance') this.dateEcheance, this.statut = StatutDocument.brouillon, @JsonKey(name: 'statut_paiement') this.statutPaiement = StatutPaiement.impaye, @DecimalConverter()@JsonKey(name: 'total_ht') required this.totalHt, @DecimalConverter()@JsonKey(name: 'total_tva') required this.totalTva, @DecimalConverter()@JsonKey(name: 'timbre_fiscal') required this.timbreFiscal, @DecimalConverter()@JsonKey(name: 'retenue_source') required this.retenueSource, @DecimalConverter()@JsonKey(name: 'total_ttc') required this.totalTtc, @DecimalConverter()@JsonKey(name: 'montant_regle') required this.montantRegle, this.notes});
  factory _FactureAchat.fromJson(Map<String, dynamic> json) => _$FactureAchatFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'fournisseur_id') final  String fournisseurId;
@override@JsonKey(name: 'reception_id') final  String? receptionId;
@override@JsonKey(name: 'numero_facture_fournisseur') final  String? numeroFactureFournisseur;
@override@JsonKey(name: 'date_facture') final  DateTime dateFacture;
@override@JsonKey(name: 'date_echeance') final  DateTime? dateEcheance;
@override@JsonKey() final  StatutDocument statut;
@override@JsonKey(name: 'statut_paiement') final  StatutPaiement statutPaiement;
@override@DecimalConverter()@JsonKey(name: 'total_ht') final  Decimal totalHt;
@override@DecimalConverter()@JsonKey(name: 'total_tva') final  Decimal totalTva;
@override@DecimalConverter()@JsonKey(name: 'timbre_fiscal') final  Decimal timbreFiscal;
@override@DecimalConverter()@JsonKey(name: 'retenue_source') final  Decimal retenueSource;
@override@DecimalConverter()@JsonKey(name: 'total_ttc') final  Decimal totalTtc;
@override@DecimalConverter()@JsonKey(name: 'montant_regle') final  Decimal montantRegle;
@override final  String? notes;

/// Create a copy of FactureAchat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FactureAchatCopyWith<_FactureAchat> get copyWith => __$FactureAchatCopyWithImpl<_FactureAchat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FactureAchatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FactureAchat&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.fournisseurId, fournisseurId) || other.fournisseurId == fournisseurId)&&(identical(other.receptionId, receptionId) || other.receptionId == receptionId)&&(identical(other.numeroFactureFournisseur, numeroFactureFournisseur) || other.numeroFactureFournisseur == numeroFactureFournisseur)&&(identical(other.dateFacture, dateFacture) || other.dateFacture == dateFacture)&&(identical(other.dateEcheance, dateEcheance) || other.dateEcheance == dateEcheance)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.statutPaiement, statutPaiement) || other.statutPaiement == statutPaiement)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.timbreFiscal, timbreFiscal) || other.timbreFiscal == timbreFiscal)&&(identical(other.retenueSource, retenueSource) || other.retenueSource == retenueSource)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc)&&(identical(other.montantRegle, montantRegle) || other.montantRegle == montantRegle)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,fournisseurId,receptionId,numeroFactureFournisseur,dateFacture,dateEcheance,statut,statutPaiement,totalHt,totalTva,timbreFiscal,retenueSource,totalTtc,montantRegle,notes);

@override
String toString() {
  return 'FactureAchat(id: $id, numero: $numero, exerciceId: $exerciceId, fournisseurId: $fournisseurId, receptionId: $receptionId, numeroFactureFournisseur: $numeroFactureFournisseur, dateFacture: $dateFacture, dateEcheance: $dateEcheance, statut: $statut, statutPaiement: $statutPaiement, totalHt: $totalHt, totalTva: $totalTva, timbreFiscal: $timbreFiscal, retenueSource: $retenueSource, totalTtc: $totalTtc, montantRegle: $montantRegle, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$FactureAchatCopyWith<$Res> implements $FactureAchatCopyWith<$Res> {
  factory _$FactureAchatCopyWith(_FactureAchat value, $Res Function(_FactureAchat) _then) = __$FactureAchatCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'fournisseur_id') String fournisseurId,@JsonKey(name: 'reception_id') String? receptionId,@JsonKey(name: 'numero_facture_fournisseur') String? numeroFactureFournisseur,@JsonKey(name: 'date_facture') DateTime dateFacture,@JsonKey(name: 'date_echeance') DateTime? dateEcheance, StatutDocument statut,@JsonKey(name: 'statut_paiement') StatutPaiement statutPaiement,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'timbre_fiscal') Decimal timbreFiscal,@DecimalConverter()@JsonKey(name: 'retenue_source') Decimal retenueSource,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc,@DecimalConverter()@JsonKey(name: 'montant_regle') Decimal montantRegle, String? notes
});




}
/// @nodoc
class __$FactureAchatCopyWithImpl<$Res>
    implements _$FactureAchatCopyWith<$Res> {
  __$FactureAchatCopyWithImpl(this._self, this._then);

  final _FactureAchat _self;
  final $Res Function(_FactureAchat) _then;

/// Create a copy of FactureAchat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? fournisseurId = null,Object? receptionId = freezed,Object? numeroFactureFournisseur = freezed,Object? dateFacture = null,Object? dateEcheance = freezed,Object? statut = null,Object? statutPaiement = null,Object? totalHt = null,Object? totalTva = null,Object? timbreFiscal = null,Object? retenueSource = null,Object? totalTtc = null,Object? montantRegle = null,Object? notes = freezed,}) {
  return _then(_FactureAchat(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,fournisseurId: null == fournisseurId ? _self.fournisseurId : fournisseurId // ignore: cast_nullable_to_non_nullable
as String,receptionId: freezed == receptionId ? _self.receptionId : receptionId // ignore: cast_nullable_to_non_nullable
as String?,numeroFactureFournisseur: freezed == numeroFactureFournisseur ? _self.numeroFactureFournisseur : numeroFactureFournisseur // ignore: cast_nullable_to_non_nullable
as String?,dateFacture: null == dateFacture ? _self.dateFacture : dateFacture // ignore: cast_nullable_to_non_nullable
as DateTime,dateEcheance: freezed == dateEcheance ? _self.dateEcheance : dateEcheance // ignore: cast_nullable_to_non_nullable
as DateTime?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,statutPaiement: null == statutPaiement ? _self.statutPaiement : statutPaiement // ignore: cast_nullable_to_non_nullable
as StatutPaiement,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,timbreFiscal: null == timbreFiscal ? _self.timbreFiscal : timbreFiscal // ignore: cast_nullable_to_non_nullable
as Decimal,retenueSource: null == retenueSource ? _self.retenueSource : retenueSource // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,montantRegle: null == montantRegle ? _self.montantRegle : montantRegle // ignore: cast_nullable_to_non_nullable
as Decimal,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FactureAchatLigne {

 String? get id;@JsonKey(name: 'facture_id') String get factureId;@JsonKey(name: 'reception_ligne_id') String? get receptionLigneId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@DecimalConverter() Decimal get quantite;@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal get prixUnitaire;@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal get remisePct;@JsonKey(name: 'taux_tva_id') String get tauxTvaId; int get ordre;
/// Create a copy of FactureAchatLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FactureAchatLigneCopyWith<FactureAchatLigne> get copyWith => _$FactureAchatLigneCopyWithImpl<FactureAchatLigne>(this as FactureAchatLigne, _$identity);

  /// Serializes this FactureAchatLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FactureAchatLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.factureId, factureId) || other.factureId == factureId)&&(identical(other.receptionLigneId, receptionLigneId) || other.receptionLigneId == receptionLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.remisePct, remisePct) || other.remisePct == remisePct)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,factureId,receptionLigneId,articleId,varianteId,quantite,prixUnitaire,remisePct,tauxTvaId,ordre);

@override
String toString() {
  return 'FactureAchatLigne(id: $id, factureId: $factureId, receptionLigneId: $receptionLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, remisePct: $remisePct, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class $FactureAchatLigneCopyWith<$Res>  {
  factory $FactureAchatLigneCopyWith(FactureAchatLigne value, $Res Function(FactureAchatLigne) _then) = _$FactureAchatLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'facture_id') String factureId,@JsonKey(name: 'reception_ligne_id') String? receptionLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal remisePct,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class _$FactureAchatLigneCopyWithImpl<$Res>
    implements $FactureAchatLigneCopyWith<$Res> {
  _$FactureAchatLigneCopyWithImpl(this._self, this._then);

  final FactureAchatLigne _self;
  final $Res Function(FactureAchatLigne) _then;

/// Create a copy of FactureAchatLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? factureId = null,Object? receptionLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? remisePct = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,factureId: null == factureId ? _self.factureId : factureId // ignore: cast_nullable_to_non_nullable
as String,receptionLigneId: freezed == receptionLigneId ? _self.receptionLigneId : receptionLigneId // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [FactureAchatLigne].
extension FactureAchatLignePatterns on FactureAchatLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FactureAchatLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FactureAchatLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FactureAchatLigne value)  $default,){
final _that = this;
switch (_that) {
case _FactureAchatLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FactureAchatLigne value)?  $default,){
final _that = this;
switch (_that) {
case _FactureAchatLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'facture_id')  String factureId, @JsonKey(name: 'reception_ligne_id')  String? receptionLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FactureAchatLigne() when $default != null:
return $default(_that.id,_that.factureId,_that.receptionLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.ordre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'facture_id')  String factureId, @JsonKey(name: 'reception_ligne_id')  String? receptionLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)  $default,) {final _that = this;
switch (_that) {
case _FactureAchatLigne():
return $default(_that.id,_that.factureId,_that.receptionLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.ordre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'facture_id')  String factureId, @JsonKey(name: 'reception_ligne_id')  String? receptionLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)?  $default,) {final _that = this;
switch (_that) {
case _FactureAchatLigne() when $default != null:
return $default(_that.id,_that.factureId,_that.receptionLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.ordre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FactureAchatLigne implements FactureAchatLigne {
  const _FactureAchatLigne({this.id, @JsonKey(name: 'facture_id') required this.factureId, @JsonKey(name: 'reception_ligne_id') this.receptionLigneId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @DecimalConverter() required this.quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire') required this.prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct') required this.remisePct, @JsonKey(name: 'taux_tva_id') required this.tauxTvaId, this.ordre = 0});
  factory _FactureAchatLigne.fromJson(Map<String, dynamic> json) => _$FactureAchatLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'facture_id') final  String factureId;
@override@JsonKey(name: 'reception_ligne_id') final  String? receptionLigneId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter()@JsonKey(name: 'prix_unitaire') final  Decimal prixUnitaire;
@override@DecimalConverter()@JsonKey(name: 'remise_pct') final  Decimal remisePct;
@override@JsonKey(name: 'taux_tva_id') final  String tauxTvaId;
@override@JsonKey() final  int ordre;

/// Create a copy of FactureAchatLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FactureAchatLigneCopyWith<_FactureAchatLigne> get copyWith => __$FactureAchatLigneCopyWithImpl<_FactureAchatLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FactureAchatLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FactureAchatLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.factureId, factureId) || other.factureId == factureId)&&(identical(other.receptionLigneId, receptionLigneId) || other.receptionLigneId == receptionLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.remisePct, remisePct) || other.remisePct == remisePct)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,factureId,receptionLigneId,articleId,varianteId,quantite,prixUnitaire,remisePct,tauxTvaId,ordre);

@override
String toString() {
  return 'FactureAchatLigne(id: $id, factureId: $factureId, receptionLigneId: $receptionLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, remisePct: $remisePct, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class _$FactureAchatLigneCopyWith<$Res> implements $FactureAchatLigneCopyWith<$Res> {
  factory _$FactureAchatLigneCopyWith(_FactureAchatLigne value, $Res Function(_FactureAchatLigne) _then) = __$FactureAchatLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'facture_id') String factureId,@JsonKey(name: 'reception_ligne_id') String? receptionLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal remisePct,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class __$FactureAchatLigneCopyWithImpl<$Res>
    implements _$FactureAchatLigneCopyWith<$Res> {
  __$FactureAchatLigneCopyWithImpl(this._self, this._then);

  final _FactureAchatLigne _self;
  final $Res Function(_FactureAchatLigne) _then;

/// Create a copy of FactureAchatLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? factureId = null,Object? receptionLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? remisePct = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_FactureAchatLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,factureId: null == factureId ? _self.factureId : factureId // ignore: cast_nullable_to_non_nullable
as String,receptionLigneId: freezed == receptionLigneId ? _self.receptionLigneId : receptionLigneId // ignore: cast_nullable_to_non_nullable
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
