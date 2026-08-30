// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tiers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tiers {

 String? get id; TypeTiers get type; String get code;@JsonKey(name: 'raison_sociale') String get raisonSociale;@JsonKey(name: 'matricule_fiscal') String? get matriculeFiscal; String? get adresse; String? get ville; String? get telephone; String? get email;@DecimalConverter()@JsonKey(name: 'taux_retenue_source') Decimal get tauxRetenueSource;@DecimalConverter()@JsonKey(name: 'plafond_credit') Decimal get plafondCredit;@DecimalConverter() Decimal get solde; bool get actif;
/// Create a copy of Tiers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TiersCopyWith<Tiers> get copyWith => _$TiersCopyWithImpl<Tiers>(this as Tiers, _$identity);

  /// Serializes this Tiers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tiers&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.code, code) || other.code == code)&&(identical(other.raisonSociale, raisonSociale) || other.raisonSociale == raisonSociale)&&(identical(other.matriculeFiscal, matriculeFiscal) || other.matriculeFiscal == matriculeFiscal)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.ville, ville) || other.ville == ville)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.email, email) || other.email == email)&&(identical(other.tauxRetenueSource, tauxRetenueSource) || other.tauxRetenueSource == tauxRetenueSource)&&(identical(other.plafondCredit, plafondCredit) || other.plafondCredit == plafondCredit)&&(identical(other.solde, solde) || other.solde == solde)&&(identical(other.actif, actif) || other.actif == actif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,code,raisonSociale,matriculeFiscal,adresse,ville,telephone,email,tauxRetenueSource,plafondCredit,solde,actif);

@override
String toString() {
  return 'Tiers(id: $id, type: $type, code: $code, raisonSociale: $raisonSociale, matriculeFiscal: $matriculeFiscal, adresse: $adresse, ville: $ville, telephone: $telephone, email: $email, tauxRetenueSource: $tauxRetenueSource, plafondCredit: $plafondCredit, solde: $solde, actif: $actif)';
}


}

/// @nodoc
abstract mixin class $TiersCopyWith<$Res>  {
  factory $TiersCopyWith(Tiers value, $Res Function(Tiers) _then) = _$TiersCopyWithImpl;
@useResult
$Res call({
 String? id, TypeTiers type, String code,@JsonKey(name: 'raison_sociale') String raisonSociale,@JsonKey(name: 'matricule_fiscal') String? matriculeFiscal, String? adresse, String? ville, String? telephone, String? email,@DecimalConverter()@JsonKey(name: 'taux_retenue_source') Decimal tauxRetenueSource,@DecimalConverter()@JsonKey(name: 'plafond_credit') Decimal plafondCredit,@DecimalConverter() Decimal solde, bool actif
});




}
/// @nodoc
class _$TiersCopyWithImpl<$Res>
    implements $TiersCopyWith<$Res> {
  _$TiersCopyWithImpl(this._self, this._then);

  final Tiers _self;
  final $Res Function(Tiers) _then;

/// Create a copy of Tiers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = null,Object? code = null,Object? raisonSociale = null,Object? matriculeFiscal = freezed,Object? adresse = freezed,Object? ville = freezed,Object? telephone = freezed,Object? email = freezed,Object? tauxRetenueSource = null,Object? plafondCredit = null,Object? solde = null,Object? actif = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypeTiers,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,raisonSociale: null == raisonSociale ? _self.raisonSociale : raisonSociale // ignore: cast_nullable_to_non_nullable
as String,matriculeFiscal: freezed == matriculeFiscal ? _self.matriculeFiscal : matriculeFiscal // ignore: cast_nullable_to_non_nullable
as String?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,ville: freezed == ville ? _self.ville : ville // ignore: cast_nullable_to_non_nullable
as String?,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,tauxRetenueSource: null == tauxRetenueSource ? _self.tauxRetenueSource : tauxRetenueSource // ignore: cast_nullable_to_non_nullable
as Decimal,plafondCredit: null == plafondCredit ? _self.plafondCredit : plafondCredit // ignore: cast_nullable_to_non_nullable
as Decimal,solde: null == solde ? _self.solde : solde // ignore: cast_nullable_to_non_nullable
as Decimal,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Tiers].
extension TiersPatterns on Tiers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tiers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tiers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tiers value)  $default,){
final _that = this;
switch (_that) {
case _Tiers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tiers value)?  $default,){
final _that = this;
switch (_that) {
case _Tiers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  TypeTiers type,  String code, @JsonKey(name: 'raison_sociale')  String raisonSociale, @JsonKey(name: 'matricule_fiscal')  String? matriculeFiscal,  String? adresse,  String? ville,  String? telephone,  String? email, @DecimalConverter()@JsonKey(name: 'taux_retenue_source')  Decimal tauxRetenueSource, @DecimalConverter()@JsonKey(name: 'plafond_credit')  Decimal plafondCredit, @DecimalConverter()  Decimal solde,  bool actif)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tiers() when $default != null:
return $default(_that.id,_that.type,_that.code,_that.raisonSociale,_that.matriculeFiscal,_that.adresse,_that.ville,_that.telephone,_that.email,_that.tauxRetenueSource,_that.plafondCredit,_that.solde,_that.actif);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  TypeTiers type,  String code, @JsonKey(name: 'raison_sociale')  String raisonSociale, @JsonKey(name: 'matricule_fiscal')  String? matriculeFiscal,  String? adresse,  String? ville,  String? telephone,  String? email, @DecimalConverter()@JsonKey(name: 'taux_retenue_source')  Decimal tauxRetenueSource, @DecimalConverter()@JsonKey(name: 'plafond_credit')  Decimal plafondCredit, @DecimalConverter()  Decimal solde,  bool actif)  $default,) {final _that = this;
switch (_that) {
case _Tiers():
return $default(_that.id,_that.type,_that.code,_that.raisonSociale,_that.matriculeFiscal,_that.adresse,_that.ville,_that.telephone,_that.email,_that.tauxRetenueSource,_that.plafondCredit,_that.solde,_that.actif);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  TypeTiers type,  String code, @JsonKey(name: 'raison_sociale')  String raisonSociale, @JsonKey(name: 'matricule_fiscal')  String? matriculeFiscal,  String? adresse,  String? ville,  String? telephone,  String? email, @DecimalConverter()@JsonKey(name: 'taux_retenue_source')  Decimal tauxRetenueSource, @DecimalConverter()@JsonKey(name: 'plafond_credit')  Decimal plafondCredit, @DecimalConverter()  Decimal solde,  bool actif)?  $default,) {final _that = this;
switch (_that) {
case _Tiers() when $default != null:
return $default(_that.id,_that.type,_that.code,_that.raisonSociale,_that.matriculeFiscal,_that.adresse,_that.ville,_that.telephone,_that.email,_that.tauxRetenueSource,_that.plafondCredit,_that.solde,_that.actif);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tiers implements Tiers {
  const _Tiers({this.id, required this.type, required this.code, @JsonKey(name: 'raison_sociale') required this.raisonSociale, @JsonKey(name: 'matricule_fiscal') this.matriculeFiscal, this.adresse, this.ville, this.telephone, this.email, @DecimalConverter()@JsonKey(name: 'taux_retenue_source') required this.tauxRetenueSource, @DecimalConverter()@JsonKey(name: 'plafond_credit') required this.plafondCredit, @DecimalConverter() required this.solde, this.actif = true});
  factory _Tiers.fromJson(Map<String, dynamic> json) => _$TiersFromJson(json);

@override final  String? id;
@override final  TypeTiers type;
@override final  String code;
@override@JsonKey(name: 'raison_sociale') final  String raisonSociale;
@override@JsonKey(name: 'matricule_fiscal') final  String? matriculeFiscal;
@override final  String? adresse;
@override final  String? ville;
@override final  String? telephone;
@override final  String? email;
@override@DecimalConverter()@JsonKey(name: 'taux_retenue_source') final  Decimal tauxRetenueSource;
@override@DecimalConverter()@JsonKey(name: 'plafond_credit') final  Decimal plafondCredit;
@override@DecimalConverter() final  Decimal solde;
@override@JsonKey() final  bool actif;

/// Create a copy of Tiers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TiersCopyWith<_Tiers> get copyWith => __$TiersCopyWithImpl<_Tiers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TiersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tiers&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.code, code) || other.code == code)&&(identical(other.raisonSociale, raisonSociale) || other.raisonSociale == raisonSociale)&&(identical(other.matriculeFiscal, matriculeFiscal) || other.matriculeFiscal == matriculeFiscal)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.ville, ville) || other.ville == ville)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.email, email) || other.email == email)&&(identical(other.tauxRetenueSource, tauxRetenueSource) || other.tauxRetenueSource == tauxRetenueSource)&&(identical(other.plafondCredit, plafondCredit) || other.plafondCredit == plafondCredit)&&(identical(other.solde, solde) || other.solde == solde)&&(identical(other.actif, actif) || other.actif == actif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,code,raisonSociale,matriculeFiscal,adresse,ville,telephone,email,tauxRetenueSource,plafondCredit,solde,actif);

@override
String toString() {
  return 'Tiers(id: $id, type: $type, code: $code, raisonSociale: $raisonSociale, matriculeFiscal: $matriculeFiscal, adresse: $adresse, ville: $ville, telephone: $telephone, email: $email, tauxRetenueSource: $tauxRetenueSource, plafondCredit: $plafondCredit, solde: $solde, actif: $actif)';
}


}

/// @nodoc
abstract mixin class _$TiersCopyWith<$Res> implements $TiersCopyWith<$Res> {
  factory _$TiersCopyWith(_Tiers value, $Res Function(_Tiers) _then) = __$TiersCopyWithImpl;
@override @useResult
$Res call({
 String? id, TypeTiers type, String code,@JsonKey(name: 'raison_sociale') String raisonSociale,@JsonKey(name: 'matricule_fiscal') String? matriculeFiscal, String? adresse, String? ville, String? telephone, String? email,@DecimalConverter()@JsonKey(name: 'taux_retenue_source') Decimal tauxRetenueSource,@DecimalConverter()@JsonKey(name: 'plafond_credit') Decimal plafondCredit,@DecimalConverter() Decimal solde, bool actif
});




}
/// @nodoc
class __$TiersCopyWithImpl<$Res>
    implements _$TiersCopyWith<$Res> {
  __$TiersCopyWithImpl(this._self, this._then);

  final _Tiers _self;
  final $Res Function(_Tiers) _then;

/// Create a copy of Tiers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? code = null,Object? raisonSociale = null,Object? matriculeFiscal = freezed,Object? adresse = freezed,Object? ville = freezed,Object? telephone = freezed,Object? email = freezed,Object? tauxRetenueSource = null,Object? plafondCredit = null,Object? solde = null,Object? actif = null,}) {
  return _then(_Tiers(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypeTiers,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,raisonSociale: null == raisonSociale ? _self.raisonSociale : raisonSociale // ignore: cast_nullable_to_non_nullable
as String,matriculeFiscal: freezed == matriculeFiscal ? _self.matriculeFiscal : matriculeFiscal // ignore: cast_nullable_to_non_nullable
as String?,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,ville: freezed == ville ? _self.ville : ville // ignore: cast_nullable_to_non_nullable
as String?,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,tauxRetenueSource: null == tauxRetenueSource ? _self.tauxRetenueSource : tauxRetenueSource // ignore: cast_nullable_to_non_nullable
as Decimal,plafondCredit: null == plafondCredit ? _self.plafondCredit : plafondCredit // ignore: cast_nullable_to_non_nullable
as Decimal,solde: null == solde ? _self.solde : solde // ignore: cast_nullable_to_non_nullable
as Decimal,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
