// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'depot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Depot {

 String? get id; String get code; String get libelle; TypeDepot get type; String? get adresse; bool get actif;
/// Create a copy of Depot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepotCopyWith<Depot> get copyWith => _$DepotCopyWithImpl<Depot>(this as Depot, _$identity);

  /// Serializes this Depot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Depot&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.libelle, libelle) || other.libelle == libelle)&&(identical(other.type, type) || other.type == type)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.actif, actif) || other.actif == actif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,libelle,type,adresse,actif);

@override
String toString() {
  return 'Depot(id: $id, code: $code, libelle: $libelle, type: $type, adresse: $adresse, actif: $actif)';
}


}

/// @nodoc
abstract mixin class $DepotCopyWith<$Res>  {
  factory $DepotCopyWith(Depot value, $Res Function(Depot) _then) = _$DepotCopyWithImpl;
@useResult
$Res call({
 String? id, String code, String libelle, TypeDepot type, String? adresse, bool actif
});




}
/// @nodoc
class _$DepotCopyWithImpl<$Res>
    implements $DepotCopyWith<$Res> {
  _$DepotCopyWithImpl(this._self, this._then);

  final Depot _self;
  final $Res Function(Depot) _then;

/// Create a copy of Depot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? code = null,Object? libelle = null,Object? type = null,Object? adresse = freezed,Object? actif = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypeDepot,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Depot].
extension DepotPatterns on Depot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Depot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Depot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Depot value)  $default,){
final _that = this;
switch (_that) {
case _Depot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Depot value)?  $default,){
final _that = this;
switch (_that) {
case _Depot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String code,  String libelle,  TypeDepot type,  String? adresse,  bool actif)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Depot() when $default != null:
return $default(_that.id,_that.code,_that.libelle,_that.type,_that.adresse,_that.actif);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String code,  String libelle,  TypeDepot type,  String? adresse,  bool actif)  $default,) {final _that = this;
switch (_that) {
case _Depot():
return $default(_that.id,_that.code,_that.libelle,_that.type,_that.adresse,_that.actif);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String code,  String libelle,  TypeDepot type,  String? adresse,  bool actif)?  $default,) {final _that = this;
switch (_that) {
case _Depot() when $default != null:
return $default(_that.id,_that.code,_that.libelle,_that.type,_that.adresse,_that.actif);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Depot implements Depot {
  const _Depot({this.id, required this.code, required this.libelle, required this.type, this.adresse, this.actif = true});
  factory _Depot.fromJson(Map<String, dynamic> json) => _$DepotFromJson(json);

@override final  String? id;
@override final  String code;
@override final  String libelle;
@override final  TypeDepot type;
@override final  String? adresse;
@override@JsonKey() final  bool actif;

/// Create a copy of Depot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepotCopyWith<_Depot> get copyWith => __$DepotCopyWithImpl<_Depot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Depot&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.libelle, libelle) || other.libelle == libelle)&&(identical(other.type, type) || other.type == type)&&(identical(other.adresse, adresse) || other.adresse == adresse)&&(identical(other.actif, actif) || other.actif == actif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,libelle,type,adresse,actif);

@override
String toString() {
  return 'Depot(id: $id, code: $code, libelle: $libelle, type: $type, adresse: $adresse, actif: $actif)';
}


}

/// @nodoc
abstract mixin class _$DepotCopyWith<$Res> implements $DepotCopyWith<$Res> {
  factory _$DepotCopyWith(_Depot value, $Res Function(_Depot) _then) = __$DepotCopyWithImpl;
@override @useResult
$Res call({
 String? id, String code, String libelle, TypeDepot type, String? adresse, bool actif
});




}
/// @nodoc
class __$DepotCopyWithImpl<$Res>
    implements _$DepotCopyWith<$Res> {
  __$DepotCopyWithImpl(this._self, this._then);

  final _Depot _self;
  final $Res Function(_Depot) _then;

/// Create a copy of Depot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? code = null,Object? libelle = null,Object? type = null,Object? adresse = freezed,Object? actif = null,}) {
  return _then(_Depot(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TypeDepot,adresse: freezed == adresse ? _self.adresse : adresse // ignore: cast_nullable_to_non_nullable
as String?,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
