// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'societe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Societe {

 String get id;@JsonKey(name: 'raison_sociale') String get raisonSociale;@JsonKey(name: 'matricule_fiscal') String get matriculeFiscal; String get adresse;@DecimalConverter()@JsonKey(name: 'timbre_fiscal') Decimal get timbreFiscal;@DecimalConverter()@JsonKey(name: 'taux_fodec') Decimal get tauxFodec; String? get telephone;@JsonKey(name: 'logo_url') String? get logoUrl;
/// Create a copy of Societe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocieteCopyWith<Societe> get copyWith => _$SocieteCopyWithImpl<Societe>(this as Societe, _$identity);

  /// Serializes this Societe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Societe&&(identical(other.id, id) || other.id == id)&&(identical(other.raisonSociale, raisonSociale) || other.raisonSociale == raisonSociale)&&(identical(other.matriculeFiscal, matriculeFiscal) || other.matriculeFiscal == matriculeFiscal)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.timbreFiscal, timbreFiscal) || other.timbreFiscal == timbreFiscal)&&(identical(other.tauxFodec, tauxFodec) || other.tauxFodec == tauxFodec)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,raisonSociale,matriculeFiscal,adresse,timbreFiscal,tauxFodec,telephone,logoUrl);

@override
String toString() {
  return 'Societe(id: $id, raisonSociale: $raisonSociale, matriculeFiscal: $matriculeFiscal, adresse: $adresse, timbreFiscal: $timbreFiscal, tauxFodec: $tauxFodec, telephone: $telephone, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class $SocieteCopyWith<$Res>  {
  factory $SocieteCopyWith(Societe value, $Res Function(Societe) _then) = _$SocieteCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'raison_sociale') String raisonSociale,@JsonKey(name: 'matricule_fiscal') String matriculeFiscal, String adresse,@DecimalConverter()@JsonKey(name: 'timbre_fiscal') Decimal timbreFiscal,@DecimalConverter()@JsonKey(name: 'taux_fodec') Decimal tauxFodec, String? telephone,@JsonKey(name: 'logo_url') String? logoUrl
});




}
/// @nodoc
class _$SocieteCopyWithImpl<$Res>
    implements $SocieteCopyWith<$Res> {
  _$SocieteCopyWithImpl(this._self, this._then);

  final Societe _self;
  final $Res Function(Societe) _then;

/// Create a copy of Societe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? raisonSociale = null,Object? matriculeFiscal = null,Object? adresse = null,Object? timbreFiscal = null,Object? tauxFodec = null,Object? telephone = freezed,Object? logoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,raisonSociale: null == raisonSociale ? _self.raisonSociale : raisonSociale // ignore: cast_nullable_to_non_nullable
as String,matriculeFiscal: null == matriculeFiscal ? _self.matriculeFiscal : matriculeFiscal // ignore: cast_nullable_to_non_nullable
as String,adresse: null == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String,timbreFiscal: null == timbreFiscal ? _self.timbreFiscal : timbreFiscal // ignore: cast_nullable_to_non_nullable
as Decimal,tauxFodec: null == tauxFodec ? _self.tauxFodec : tauxFodec // ignore: cast_nullable_to_non_nullable
as Decimal,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Societe].
extension SocietePatterns on Societe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Societe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Societe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Societe value)  $default,){
final _that = this;
switch (_that) {
case _Societe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Societe value)?  $default,){
final _that = this;
switch (_that) {
case _Societe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'raison_sociale')  String raisonSociale, @JsonKey(name: 'matricule_fiscal')  String matriculeFiscal,  String adresse, @DecimalConverter()@JsonKey(name: 'timbre_fiscal')  Decimal timbreFiscal, @DecimalConverter()@JsonKey(name: 'taux_fodec')  Decimal tauxFodec,  String? telephone, @JsonKey(name: 'logo_url')  String? logoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Societe() when $default != null:
return $default(_that.id,_that.raisonSociale,_that.matriculeFiscal,_that.adresse,_that.timbreFiscal,_that.tauxFodec,_that.telephone,_that.logoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'raison_sociale')  String raisonSociale, @JsonKey(name: 'matricule_fiscal')  String matriculeFiscal,  String adresse, @DecimalConverter()@JsonKey(name: 'timbre_fiscal')  Decimal timbreFiscal, @DecimalConverter()@JsonKey(name: 'taux_fodec')  Decimal tauxFodec,  String? telephone, @JsonKey(name: 'logo_url')  String? logoUrl)  $default,) {final _that = this;
switch (_that) {
case _Societe():
return $default(_that.id,_that.raisonSociale,_that.matriculeFiscal,_that.adresse,_that.timbreFiscal,_that.tauxFodec,_that.telephone,_that.logoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'raison_sociale')  String raisonSociale, @JsonKey(name: 'matricule_fiscal')  String matriculeFiscal,  String adresse, @DecimalConverter()@JsonKey(name: 'timbre_fiscal')  Decimal timbreFiscal, @DecimalConverter()@JsonKey(name: 'taux_fodec')  Decimal tauxFodec,  String? telephone, @JsonKey(name: 'logo_url')  String? logoUrl)?  $default,) {final _that = this;
switch (_that) {
case _Societe() when $default != null:
return $default(_that.id,_that.raisonSociale,_that.matriculeFiscal,_that.adresse,_that.timbreFiscal,_that.tauxFodec,_that.telephone,_that.logoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Societe implements Societe {
  const _Societe({required this.id, @JsonKey(name: 'raison_sociale') required this.raisonSociale, @JsonKey(name: 'matricule_fiscal') required this.matriculeFiscal, required this.adresse, @DecimalConverter()@JsonKey(name: 'timbre_fiscal') required this.timbreFiscal, @DecimalConverter()@JsonKey(name: 'taux_fodec') required this.tauxFodec, this.telephone, @JsonKey(name: 'logo_url') this.logoUrl});
  factory _Societe.fromJson(Map<String, dynamic> json) => _$SocieteFromJson(json);

@override final  String id;
@override@JsonKey(name: 'raison_sociale') final  String raisonSociale;
@override@JsonKey(name: 'matricule_fiscal') final  String matriculeFiscal;
@override final  String adresse;
@override@DecimalConverter()@JsonKey(name: 'timbre_fiscal') final  Decimal timbreFiscal;
@override@DecimalConverter()@JsonKey(name: 'taux_fodec') final  Decimal tauxFodec;
@override final  String? telephone;
@override@JsonKey(name: 'logo_url') final  String? logoUrl;

/// Create a copy of Societe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocieteCopyWith<_Societe> get copyWith => __$SocieteCopyWithImpl<_Societe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocieteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Societe&&(identical(other.id, id) || other.id == id)&&(identical(other.raisonSociale, raisonSociale) || other.raisonSociale == raisonSociale)&&(identical(other.matriculeFiscal, matriculeFiscal) || other.matriculeFiscal == matriculeFiscal)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.timbreFiscal, timbreFiscal) || other.timbreFiscal == timbreFiscal)&&(identical(other.tauxFodec, tauxFodec) || other.tauxFodec == tauxFodec)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,raisonSociale,matriculeFiscal,adresse,timbreFiscal,tauxFodec,telephone,logoUrl);

@override
String toString() {
  return 'Societe(id: $id, raisonSociale: $raisonSociale, matriculeFiscal: $matriculeFiscal, adresse: $adresse, timbreFiscal: $timbreFiscal, tauxFodec: $tauxFodec, telephone: $telephone, logoUrl: $logoUrl)';
}


}

/// @nodoc
abstract mixin class _$SocieteCopyWith<$Res> implements $SocieteCopyWith<$Res> {
  factory _$SocieteCopyWith(_Societe value, $Res Function(_Societe) _then) = __$SocieteCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'raison_sociale') String raisonSociale,@JsonKey(name: 'matricule_fiscal') String matriculeFiscal, String adresse,@DecimalConverter()@JsonKey(name: 'timbre_fiscal') Decimal timbreFiscal,@DecimalConverter()@JsonKey(name: 'taux_fodec') Decimal tauxFodec, String? telephone,@JsonKey(name: 'logo_url') String? logoUrl
});




}
/// @nodoc
class __$SocieteCopyWithImpl<$Res>
    implements _$SocieteCopyWith<$Res> {
  __$SocieteCopyWithImpl(this._self, this._then);

  final _Societe _self;
  final $Res Function(_Societe) _then;

/// Create a copy of Societe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? raisonSociale = null,Object? matriculeFiscal = null,Object? adresse = null,Object? timbreFiscal = null,Object? tauxFodec = null,Object? telephone = freezed,Object? logoUrl = freezed,}) {
  return _then(_Societe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,raisonSociale: null == raisonSociale ? _self.raisonSociale : raisonSociale // ignore: cast_nullable_to_non_nullable
as String,matriculeFiscal: null == matriculeFiscal ? _self.matriculeFiscal : matriculeFiscal // ignore: cast_nullable_to_non_nullable
as String,adresse: null == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String,timbreFiscal: null == timbreFiscal ? _self.timbreFiscal : timbreFiscal // ignore: cast_nullable_to_non_nullable
as Decimal,tauxFodec: null == tauxFodec ? _self.tauxFodec : tauxFodec // ignore: cast_nullable_to_non_nullable
as Decimal,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
