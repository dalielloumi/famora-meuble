// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UniteMesure {

 String get id; String get code; String get libelle;
/// Create a copy of UniteMesure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UniteMesureCopyWith<UniteMesure> get copyWith => _$UniteMesureCopyWithImpl<UniteMesure>(this as UniteMesure, _$identity);

  /// Serializes this UniteMesure to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UniteMesure&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.libelle, libelle) || other.libelle == libelle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,libelle);

@override
String toString() {
  return 'UniteMesure(id: $id, code: $code, libelle: $libelle)';
}


}

/// @nodoc
abstract mixin class $UniteMesureCopyWith<$Res>  {
  factory $UniteMesureCopyWith(UniteMesure value, $Res Function(UniteMesure) _then) = _$UniteMesureCopyWithImpl;
@useResult
$Res call({
 String id, String code, String libelle
});




}
/// @nodoc
class _$UniteMesureCopyWithImpl<$Res>
    implements $UniteMesureCopyWith<$Res> {
  _$UniteMesureCopyWithImpl(this._self, this._then);

  final UniteMesure _self;
  final $Res Function(UniteMesure) _then;

/// Create a copy of UniteMesure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? libelle = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UniteMesure].
extension UniteMesurePatterns on UniteMesure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UniteMesure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UniteMesure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UniteMesure value)  $default,){
final _that = this;
switch (_that) {
case _UniteMesure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UniteMesure value)?  $default,){
final _that = this;
switch (_that) {
case _UniteMesure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String libelle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UniteMesure() when $default != null:
return $default(_that.id,_that.code,_that.libelle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String libelle)  $default,) {final _that = this;
switch (_that) {
case _UniteMesure():
return $default(_that.id,_that.code,_that.libelle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String libelle)?  $default,) {final _that = this;
switch (_that) {
case _UniteMesure() when $default != null:
return $default(_that.id,_that.code,_that.libelle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UniteMesure implements UniteMesure {
  const _UniteMesure({required this.id, required this.code, required this.libelle});
  factory _UniteMesure.fromJson(Map<String, dynamic> json) => _$UniteMesureFromJson(json);

@override final  String id;
@override final  String code;
@override final  String libelle;

/// Create a copy of UniteMesure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UniteMesureCopyWith<_UniteMesure> get copyWith => __$UniteMesureCopyWithImpl<_UniteMesure>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UniteMesureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UniteMesure&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.libelle, libelle) || other.libelle == libelle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,libelle);

@override
String toString() {
  return 'UniteMesure(id: $id, code: $code, libelle: $libelle)';
}


}

/// @nodoc
abstract mixin class _$UniteMesureCopyWith<$Res> implements $UniteMesureCopyWith<$Res> {
  factory _$UniteMesureCopyWith(_UniteMesure value, $Res Function(_UniteMesure) _then) = __$UniteMesureCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String libelle
});




}
/// @nodoc
class __$UniteMesureCopyWithImpl<$Res>
    implements _$UniteMesureCopyWith<$Res> {
  __$UniteMesureCopyWithImpl(this._self, this._then);

  final _UniteMesure _self;
  final $Res Function(_UniteMesure) _then;

/// Create a copy of UniteMesure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? libelle = null,}) {
  return _then(_UniteMesure(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TauxTva {

 String get id; String get code; num get taux; String get libelle;
/// Create a copy of TauxTva
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TauxTvaCopyWith<TauxTva> get copyWith => _$TauxTvaCopyWithImpl<TauxTva>(this as TauxTva, _$identity);

  /// Serializes this TauxTva to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TauxTva&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.taux, taux) || other.taux == taux)&&(identical(other.libelle, libelle) || other.libelle == libelle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,taux,libelle);

@override
String toString() {
  return 'TauxTva(id: $id, code: $code, taux: $taux, libelle: $libelle)';
}


}

/// @nodoc
abstract mixin class $TauxTvaCopyWith<$Res>  {
  factory $TauxTvaCopyWith(TauxTva value, $Res Function(TauxTva) _then) = _$TauxTvaCopyWithImpl;
@useResult
$Res call({
 String id, String code, num taux, String libelle
});




}
/// @nodoc
class _$TauxTvaCopyWithImpl<$Res>
    implements $TauxTvaCopyWith<$Res> {
  _$TauxTvaCopyWithImpl(this._self, this._then);

  final TauxTva _self;
  final $Res Function(TauxTva) _then;

/// Create a copy of TauxTva
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? taux = null,Object? libelle = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,taux: null == taux ? _self.taux : taux // ignore: cast_nullable_to_non_nullable
as num,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TauxTva].
extension TauxTvaPatterns on TauxTva {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TauxTva value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TauxTva() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TauxTva value)  $default,){
final _that = this;
switch (_that) {
case _TauxTva():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TauxTva value)?  $default,){
final _that = this;
switch (_that) {
case _TauxTva() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  num taux,  String libelle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TauxTva() when $default != null:
return $default(_that.id,_that.code,_that.taux,_that.libelle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  num taux,  String libelle)  $default,) {final _that = this;
switch (_that) {
case _TauxTva():
return $default(_that.id,_that.code,_that.taux,_that.libelle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  num taux,  String libelle)?  $default,) {final _that = this;
switch (_that) {
case _TauxTva() when $default != null:
return $default(_that.id,_that.code,_that.taux,_that.libelle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TauxTva implements TauxTva {
  const _TauxTva({required this.id, required this.code, required this.taux, required this.libelle});
  factory _TauxTva.fromJson(Map<String, dynamic> json) => _$TauxTvaFromJson(json);

@override final  String id;
@override final  String code;
@override final  num taux;
@override final  String libelle;

/// Create a copy of TauxTva
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TauxTvaCopyWith<_TauxTva> get copyWith => __$TauxTvaCopyWithImpl<_TauxTva>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TauxTvaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TauxTva&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.taux, taux) || other.taux == taux)&&(identical(other.libelle, libelle) || other.libelle == libelle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,taux,libelle);

@override
String toString() {
  return 'TauxTva(id: $id, code: $code, taux: $taux, libelle: $libelle)';
}


}

/// @nodoc
abstract mixin class _$TauxTvaCopyWith<$Res> implements $TauxTvaCopyWith<$Res> {
  factory _$TauxTvaCopyWith(_TauxTva value, $Res Function(_TauxTva) _then) = __$TauxTvaCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, num taux, String libelle
});




}
/// @nodoc
class __$TauxTvaCopyWithImpl<$Res>
    implements _$TauxTvaCopyWith<$Res> {
  __$TauxTvaCopyWithImpl(this._self, this._then);

  final _TauxTva _self;
  final $Res Function(_TauxTva) _then;

/// Create a copy of TauxTva
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? taux = null,Object? libelle = null,}) {
  return _then(_TauxTva(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,taux: null == taux ? _self.taux : taux // ignore: cast_nullable_to_non_nullable
as num,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
