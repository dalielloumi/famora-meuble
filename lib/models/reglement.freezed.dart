// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reglement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reglement {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'tiers_id') String get tiersId; SensReglement get sens; ModeReglement get mode;@DecimalConverter() Decimal get montant;@JsonKey(name: 'date_reglement') DateTime get dateReglement;@JsonKey(name: 'commande_client_id') String? get commandeClientId; String? get reference; String? get banque; String? get notes;
/// Create a copy of Reglement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReglementCopyWith<Reglement> get copyWith => _$ReglementCopyWithImpl<Reglement>(this as Reglement, _$identity);

  /// Serializes this Reglement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reglement&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.tiersId, tiersId) || other.tiersId == tiersId)&&(identical(other.sens, sens) || other.sens == sens)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.montant, montant) || other.montant == montant)&&(identical(other.dateReglement, dateReglement) || other.dateReglement == dateReglement)&&(identical(other.commandeClientId, commandeClientId) || other.commandeClientId == commandeClientId)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.banque, banque) || other.banque == banque)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,tiersId,sens,mode,montant,dateReglement,commandeClientId,reference,banque,notes);

@override
String toString() {
  return 'Reglement(id: $id, numero: $numero, exerciceId: $exerciceId, tiersId: $tiersId, sens: $sens, mode: $mode, montant: $montant, dateReglement: $dateReglement, commandeClientId: $commandeClientId, reference: $reference, banque: $banque, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $ReglementCopyWith<$Res>  {
  factory $ReglementCopyWith(Reglement value, $Res Function(Reglement) _then) = _$ReglementCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'tiers_id') String tiersId, SensReglement sens, ModeReglement mode,@DecimalConverter() Decimal montant,@JsonKey(name: 'date_reglement') DateTime dateReglement,@JsonKey(name: 'commande_client_id') String? commandeClientId, String? reference, String? banque, String? notes
});




}
/// @nodoc
class _$ReglementCopyWithImpl<$Res>
    implements $ReglementCopyWith<$Res> {
  _$ReglementCopyWithImpl(this._self, this._then);

  final Reglement _self;
  final $Res Function(Reglement) _then;

/// Create a copy of Reglement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? tiersId = null,Object? sens = null,Object? mode = null,Object? montant = null,Object? dateReglement = null,Object? commandeClientId = freezed,Object? reference = freezed,Object? banque = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,tiersId: null == tiersId ? _self.tiersId : tiersId // ignore: cast_nullable_to_non_nullable
as String,sens: null == sens ? _self.sens : sens // ignore: cast_nullable_to_non_nullable
as SensReglement,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ModeReglement,montant: null == montant ? _self.montant : montant // ignore: cast_nullable_to_non_nullable
as Decimal,dateReglement: null == dateReglement ? _self.dateReglement : dateReglement // ignore: cast_nullable_to_non_nullable
as DateTime,commandeClientId: freezed == commandeClientId ? _self.commandeClientId : commandeClientId // ignore: cast_nullable_to_non_nullable
as String?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,banque: freezed == banque ? _self.banque : banque // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Reglement].
extension ReglementPatterns on Reglement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reglement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reglement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reglement value)  $default,){
final _that = this;
switch (_that) {
case _Reglement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reglement value)?  $default,){
final _that = this;
switch (_that) {
case _Reglement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'tiers_id')  String tiersId,  SensReglement sens,  ModeReglement mode, @DecimalConverter()  Decimal montant, @JsonKey(name: 'date_reglement')  DateTime dateReglement, @JsonKey(name: 'commande_client_id')  String? commandeClientId,  String? reference,  String? banque,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reglement() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.tiersId,_that.sens,_that.mode,_that.montant,_that.dateReglement,_that.commandeClientId,_that.reference,_that.banque,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'tiers_id')  String tiersId,  SensReglement sens,  ModeReglement mode, @DecimalConverter()  Decimal montant, @JsonKey(name: 'date_reglement')  DateTime dateReglement, @JsonKey(name: 'commande_client_id')  String? commandeClientId,  String? reference,  String? banque,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Reglement():
return $default(_that.id,_that.numero,_that.exerciceId,_that.tiersId,_that.sens,_that.mode,_that.montant,_that.dateReglement,_that.commandeClientId,_that.reference,_that.banque,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'tiers_id')  String tiersId,  SensReglement sens,  ModeReglement mode, @DecimalConverter()  Decimal montant, @JsonKey(name: 'date_reglement')  DateTime dateReglement, @JsonKey(name: 'commande_client_id')  String? commandeClientId,  String? reference,  String? banque,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Reglement() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.tiersId,_that.sens,_that.mode,_that.montant,_that.dateReglement,_that.commandeClientId,_that.reference,_that.banque,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reglement implements Reglement {
  const _Reglement({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'tiers_id') required this.tiersId, required this.sens, required this.mode, @DecimalConverter() required this.montant, @JsonKey(name: 'date_reglement') required this.dateReglement, @JsonKey(name: 'commande_client_id') this.commandeClientId, this.reference, this.banque, this.notes});
  factory _Reglement.fromJson(Map<String, dynamic> json) => _$ReglementFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'tiers_id') final  String tiersId;
@override final  SensReglement sens;
@override final  ModeReglement mode;
@override@DecimalConverter() final  Decimal montant;
@override@JsonKey(name: 'date_reglement') final  DateTime dateReglement;
@override@JsonKey(name: 'commande_client_id') final  String? commandeClientId;
@override final  String? reference;
@override final  String? banque;
@override final  String? notes;

/// Create a copy of Reglement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReglementCopyWith<_Reglement> get copyWith => __$ReglementCopyWithImpl<_Reglement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReglementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reglement&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.tiersId, tiersId) || other.tiersId == tiersId)&&(identical(other.sens, sens) || other.sens == sens)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.montant, montant) || other.montant == montant)&&(identical(other.dateReglement, dateReglement) || other.dateReglement == dateReglement)&&(identical(other.commandeClientId, commandeClientId) || other.commandeClientId == commandeClientId)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.banque, banque) || other.banque == banque)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,tiersId,sens,mode,montant,dateReglement,commandeClientId,reference,banque,notes);

@override
String toString() {
  return 'Reglement(id: $id, numero: $numero, exerciceId: $exerciceId, tiersId: $tiersId, sens: $sens, mode: $mode, montant: $montant, dateReglement: $dateReglement, commandeClientId: $commandeClientId, reference: $reference, banque: $banque, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ReglementCopyWith<$Res> implements $ReglementCopyWith<$Res> {
  factory _$ReglementCopyWith(_Reglement value, $Res Function(_Reglement) _then) = __$ReglementCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'tiers_id') String tiersId, SensReglement sens, ModeReglement mode,@DecimalConverter() Decimal montant,@JsonKey(name: 'date_reglement') DateTime dateReglement,@JsonKey(name: 'commande_client_id') String? commandeClientId, String? reference, String? banque, String? notes
});




}
/// @nodoc
class __$ReglementCopyWithImpl<$Res>
    implements _$ReglementCopyWith<$Res> {
  __$ReglementCopyWithImpl(this._self, this._then);

  final _Reglement _self;
  final $Res Function(_Reglement) _then;

/// Create a copy of Reglement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? tiersId = null,Object? sens = null,Object? mode = null,Object? montant = null,Object? dateReglement = null,Object? commandeClientId = freezed,Object? reference = freezed,Object? banque = freezed,Object? notes = freezed,}) {
  return _then(_Reglement(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,tiersId: null == tiersId ? _self.tiersId : tiersId // ignore: cast_nullable_to_non_nullable
as String,sens: null == sens ? _self.sens : sens // ignore: cast_nullable_to_non_nullable
as SensReglement,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ModeReglement,montant: null == montant ? _self.montant : montant // ignore: cast_nullable_to_non_nullable
as Decimal,dateReglement: null == dateReglement ? _self.dateReglement : dateReglement // ignore: cast_nullable_to_non_nullable
as DateTime,commandeClientId: freezed == commandeClientId ? _self.commandeClientId : commandeClientId // ignore: cast_nullable_to_non_nullable
as String?,reference: freezed == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String?,banque: freezed == banque ? _self.banque : banque // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ReglementAffectation {

 String? get id;@JsonKey(name: 'reglement_id') String get reglementId;@JsonKey(name: 'facture_vente_id') String? get factureVenteId;@JsonKey(name: 'facture_achat_id') String? get factureAchatId;@DecimalConverter()@JsonKey(name: 'montant_affecte') Decimal get montantAffecte;
/// Create a copy of ReglementAffectation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReglementAffectationCopyWith<ReglementAffectation> get copyWith => _$ReglementAffectationCopyWithImpl<ReglementAffectation>(this as ReglementAffectation, _$identity);

  /// Serializes this ReglementAffectation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReglementAffectation&&(identical(other.id, id) || other.id == id)&&(identical(other.reglementId, reglementId) || other.reglementId == reglementId)&&(identical(other.factureVenteId, factureVenteId) || other.factureVenteId == factureVenteId)&&(identical(other.factureAchatId, factureAchatId) || other.factureAchatId == factureAchatId)&&(identical(other.montantAffecte, montantAffecte) || other.montantAffecte == montantAffecte));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reglementId,factureVenteId,factureAchatId,montantAffecte);

@override
String toString() {
  return 'ReglementAffectation(id: $id, reglementId: $reglementId, factureVenteId: $factureVenteId, factureAchatId: $factureAchatId, montantAffecte: $montantAffecte)';
}


}

/// @nodoc
abstract mixin class $ReglementAffectationCopyWith<$Res>  {
  factory $ReglementAffectationCopyWith(ReglementAffectation value, $Res Function(ReglementAffectation) _then) = _$ReglementAffectationCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'reglement_id') String reglementId,@JsonKey(name: 'facture_vente_id') String? factureVenteId,@JsonKey(name: 'facture_achat_id') String? factureAchatId,@DecimalConverter()@JsonKey(name: 'montant_affecte') Decimal montantAffecte
});




}
/// @nodoc
class _$ReglementAffectationCopyWithImpl<$Res>
    implements $ReglementAffectationCopyWith<$Res> {
  _$ReglementAffectationCopyWithImpl(this._self, this._then);

  final ReglementAffectation _self;
  final $Res Function(ReglementAffectation) _then;

/// Create a copy of ReglementAffectation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? reglementId = null,Object? factureVenteId = freezed,Object? factureAchatId = freezed,Object? montantAffecte = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,reglementId: null == reglementId ? _self.reglementId : reglementId // ignore: cast_nullable_to_non_nullable
as String,factureVenteId: freezed == factureVenteId ? _self.factureVenteId : factureVenteId // ignore: cast_nullable_to_non_nullable
as String?,factureAchatId: freezed == factureAchatId ? _self.factureAchatId : factureAchatId // ignore: cast_nullable_to_non_nullable
as String?,montantAffecte: null == montantAffecte ? _self.montantAffecte : montantAffecte // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}

}


/// Adds pattern-matching-related methods to [ReglementAffectation].
extension ReglementAffectationPatterns on ReglementAffectation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReglementAffectation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReglementAffectation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReglementAffectation value)  $default,){
final _that = this;
switch (_that) {
case _ReglementAffectation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReglementAffectation value)?  $default,){
final _that = this;
switch (_that) {
case _ReglementAffectation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'reglement_id')  String reglementId, @JsonKey(name: 'facture_vente_id')  String? factureVenteId, @JsonKey(name: 'facture_achat_id')  String? factureAchatId, @DecimalConverter()@JsonKey(name: 'montant_affecte')  Decimal montantAffecte)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReglementAffectation() when $default != null:
return $default(_that.id,_that.reglementId,_that.factureVenteId,_that.factureAchatId,_that.montantAffecte);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'reglement_id')  String reglementId, @JsonKey(name: 'facture_vente_id')  String? factureVenteId, @JsonKey(name: 'facture_achat_id')  String? factureAchatId, @DecimalConverter()@JsonKey(name: 'montant_affecte')  Decimal montantAffecte)  $default,) {final _that = this;
switch (_that) {
case _ReglementAffectation():
return $default(_that.id,_that.reglementId,_that.factureVenteId,_that.factureAchatId,_that.montantAffecte);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'reglement_id')  String reglementId, @JsonKey(name: 'facture_vente_id')  String? factureVenteId, @JsonKey(name: 'facture_achat_id')  String? factureAchatId, @DecimalConverter()@JsonKey(name: 'montant_affecte')  Decimal montantAffecte)?  $default,) {final _that = this;
switch (_that) {
case _ReglementAffectation() when $default != null:
return $default(_that.id,_that.reglementId,_that.factureVenteId,_that.factureAchatId,_that.montantAffecte);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReglementAffectation implements ReglementAffectation {
  const _ReglementAffectation({this.id, @JsonKey(name: 'reglement_id') required this.reglementId, @JsonKey(name: 'facture_vente_id') this.factureVenteId, @JsonKey(name: 'facture_achat_id') this.factureAchatId, @DecimalConverter()@JsonKey(name: 'montant_affecte') required this.montantAffecte});
  factory _ReglementAffectation.fromJson(Map<String, dynamic> json) => _$ReglementAffectationFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'reglement_id') final  String reglementId;
@override@JsonKey(name: 'facture_vente_id') final  String? factureVenteId;
@override@JsonKey(name: 'facture_achat_id') final  String? factureAchatId;
@override@DecimalConverter()@JsonKey(name: 'montant_affecte') final  Decimal montantAffecte;

/// Create a copy of ReglementAffectation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReglementAffectationCopyWith<_ReglementAffectation> get copyWith => __$ReglementAffectationCopyWithImpl<_ReglementAffectation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReglementAffectationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReglementAffectation&&(identical(other.id, id) || other.id == id)&&(identical(other.reglementId, reglementId) || other.reglementId == reglementId)&&(identical(other.factureVenteId, factureVenteId) || other.factureVenteId == factureVenteId)&&(identical(other.factureAchatId, factureAchatId) || other.factureAchatId == factureAchatId)&&(identical(other.montantAffecte, montantAffecte) || other.montantAffecte == montantAffecte));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reglementId,factureVenteId,factureAchatId,montantAffecte);

@override
String toString() {
  return 'ReglementAffectation(id: $id, reglementId: $reglementId, factureVenteId: $factureVenteId, factureAchatId: $factureAchatId, montantAffecte: $montantAffecte)';
}


}

/// @nodoc
abstract mixin class _$ReglementAffectationCopyWith<$Res> implements $ReglementAffectationCopyWith<$Res> {
  factory _$ReglementAffectationCopyWith(_ReglementAffectation value, $Res Function(_ReglementAffectation) _then) = __$ReglementAffectationCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'reglement_id') String reglementId,@JsonKey(name: 'facture_vente_id') String? factureVenteId,@JsonKey(name: 'facture_achat_id') String? factureAchatId,@DecimalConverter()@JsonKey(name: 'montant_affecte') Decimal montantAffecte
});




}
/// @nodoc
class __$ReglementAffectationCopyWithImpl<$Res>
    implements _$ReglementAffectationCopyWith<$Res> {
  __$ReglementAffectationCopyWithImpl(this._self, this._then);

  final _ReglementAffectation _self;
  final $Res Function(_ReglementAffectation) _then;

/// Create a copy of ReglementAffectation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? reglementId = null,Object? factureVenteId = freezed,Object? factureAchatId = freezed,Object? montantAffecte = null,}) {
  return _then(_ReglementAffectation(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,reglementId: null == reglementId ? _self.reglementId : reglementId // ignore: cast_nullable_to_non_nullable
as String,factureVenteId: freezed == factureVenteId ? _self.factureVenteId : factureVenteId // ignore: cast_nullable_to_non_nullable
as String?,factureAchatId: freezed == factureAchatId ? _self.factureAchatId : factureAchatId // ignore: cast_nullable_to_non_nullable
as String?,montantAffecte: null == montantAffecte ? _self.montantAffecte : montantAffecte // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}


}


/// @nodoc
mixin _$Effet {

 String? get id;@JsonKey(name: 'reglement_id') String get reglementId;@JsonKey(name: 'numero_effet') String get numeroEffet;@JsonKey(name: 'date_echeance') DateTime get dateEcheance;@DecimalConverter() Decimal get montant; StatutEffet get statut; String? get banque;
/// Create a copy of Effet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EffetCopyWith<Effet> get copyWith => _$EffetCopyWithImpl<Effet>(this as Effet, _$identity);

  /// Serializes this Effet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Effet&&(identical(other.id, id) || other.id == id)&&(identical(other.reglementId, reglementId) || other.reglementId == reglementId)&&(identical(other.numeroEffet, numeroEffet) || other.numeroEffet == numeroEffet)&&(identical(other.dateEcheance, dateEcheance) || other.dateEcheance == dateEcheance)&&(identical(other.montant, montant) || other.montant == montant)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.banque, banque) || other.banque == banque));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reglementId,numeroEffet,dateEcheance,montant,statut,banque);

@override
String toString() {
  return 'Effet(id: $id, reglementId: $reglementId, numeroEffet: $numeroEffet, dateEcheance: $dateEcheance, montant: $montant, statut: $statut, banque: $banque)';
}


}

/// @nodoc
abstract mixin class $EffetCopyWith<$Res>  {
  factory $EffetCopyWith(Effet value, $Res Function(Effet) _then) = _$EffetCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'reglement_id') String reglementId,@JsonKey(name: 'numero_effet') String numeroEffet,@JsonKey(name: 'date_echeance') DateTime dateEcheance,@DecimalConverter() Decimal montant, StatutEffet statut, String? banque
});




}
/// @nodoc
class _$EffetCopyWithImpl<$Res>
    implements $EffetCopyWith<$Res> {
  _$EffetCopyWithImpl(this._self, this._then);

  final Effet _self;
  final $Res Function(Effet) _then;

/// Create a copy of Effet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? reglementId = null,Object? numeroEffet = null,Object? dateEcheance = null,Object? montant = null,Object? statut = null,Object? banque = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,reglementId: null == reglementId ? _self.reglementId : reglementId // ignore: cast_nullable_to_non_nullable
as String,numeroEffet: null == numeroEffet ? _self.numeroEffet : numeroEffet // ignore: cast_nullable_to_non_nullable
as String,dateEcheance: null == dateEcheance ? _self.dateEcheance : dateEcheance // ignore: cast_nullable_to_non_nullable
as DateTime,montant: null == montant ? _self.montant : montant // ignore: cast_nullable_to_non_nullable
as Decimal,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutEffet,banque: freezed == banque ? _self.banque : banque // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Effet].
extension EffetPatterns on Effet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Effet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Effet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Effet value)  $default,){
final _that = this;
switch (_that) {
case _Effet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Effet value)?  $default,){
final _that = this;
switch (_that) {
case _Effet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'reglement_id')  String reglementId, @JsonKey(name: 'numero_effet')  String numeroEffet, @JsonKey(name: 'date_echeance')  DateTime dateEcheance, @DecimalConverter()  Decimal montant,  StatutEffet statut,  String? banque)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Effet() when $default != null:
return $default(_that.id,_that.reglementId,_that.numeroEffet,_that.dateEcheance,_that.montant,_that.statut,_that.banque);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'reglement_id')  String reglementId, @JsonKey(name: 'numero_effet')  String numeroEffet, @JsonKey(name: 'date_echeance')  DateTime dateEcheance, @DecimalConverter()  Decimal montant,  StatutEffet statut,  String? banque)  $default,) {final _that = this;
switch (_that) {
case _Effet():
return $default(_that.id,_that.reglementId,_that.numeroEffet,_that.dateEcheance,_that.montant,_that.statut,_that.banque);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'reglement_id')  String reglementId, @JsonKey(name: 'numero_effet')  String numeroEffet, @JsonKey(name: 'date_echeance')  DateTime dateEcheance, @DecimalConverter()  Decimal montant,  StatutEffet statut,  String? banque)?  $default,) {final _that = this;
switch (_that) {
case _Effet() when $default != null:
return $default(_that.id,_that.reglementId,_that.numeroEffet,_that.dateEcheance,_that.montant,_that.statut,_that.banque);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Effet implements Effet {
  const _Effet({this.id, @JsonKey(name: 'reglement_id') required this.reglementId, @JsonKey(name: 'numero_effet') required this.numeroEffet, @JsonKey(name: 'date_echeance') required this.dateEcheance, @DecimalConverter() required this.montant, this.statut = StatutEffet.enPortefeuille, this.banque});
  factory _Effet.fromJson(Map<String, dynamic> json) => _$EffetFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'reglement_id') final  String reglementId;
@override@JsonKey(name: 'numero_effet') final  String numeroEffet;
@override@JsonKey(name: 'date_echeance') final  DateTime dateEcheance;
@override@DecimalConverter() final  Decimal montant;
@override@JsonKey() final  StatutEffet statut;
@override final  String? banque;

/// Create a copy of Effet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EffetCopyWith<_Effet> get copyWith => __$EffetCopyWithImpl<_Effet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EffetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Effet&&(identical(other.id, id) || other.id == id)&&(identical(other.reglementId, reglementId) || other.reglementId == reglementId)&&(identical(other.numeroEffet, numeroEffet) || other.numeroEffet == numeroEffet)&&(identical(other.dateEcheance, dateEcheance) || other.dateEcheance == dateEcheance)&&(identical(other.montant, montant) || other.montant == montant)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.banque, banque) || other.banque == banque));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reglementId,numeroEffet,dateEcheance,montant,statut,banque);

@override
String toString() {
  return 'Effet(id: $id, reglementId: $reglementId, numeroEffet: $numeroEffet, dateEcheance: $dateEcheance, montant: $montant, statut: $statut, banque: $banque)';
}


}

/// @nodoc
abstract mixin class _$EffetCopyWith<$Res> implements $EffetCopyWith<$Res> {
  factory _$EffetCopyWith(_Effet value, $Res Function(_Effet) _then) = __$EffetCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'reglement_id') String reglementId,@JsonKey(name: 'numero_effet') String numeroEffet,@JsonKey(name: 'date_echeance') DateTime dateEcheance,@DecimalConverter() Decimal montant, StatutEffet statut, String? banque
});




}
/// @nodoc
class __$EffetCopyWithImpl<$Res>
    implements _$EffetCopyWith<$Res> {
  __$EffetCopyWithImpl(this._self, this._then);

  final _Effet _self;
  final $Res Function(_Effet) _then;

/// Create a copy of Effet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? reglementId = null,Object? numeroEffet = null,Object? dateEcheance = null,Object? montant = null,Object? statut = null,Object? banque = freezed,}) {
  return _then(_Effet(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,reglementId: null == reglementId ? _self.reglementId : reglementId // ignore: cast_nullable_to_non_nullable
as String,numeroEffet: null == numeroEffet ? _self.numeroEffet : numeroEffet // ignore: cast_nullable_to_non_nullable
as String,dateEcheance: null == dateEcheance ? _self.dateEcheance : dateEcheance // ignore: cast_nullable_to_non_nullable
as DateTime,montant: null == montant ? _self.montant : montant // ignore: cast_nullable_to_non_nullable
as Decimal,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutEffet,banque: freezed == banque ? _self.banque : banque // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
