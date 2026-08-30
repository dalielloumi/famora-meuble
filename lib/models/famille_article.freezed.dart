// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'famille_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FamilleArticle {

 String? get id; String get code; String get libelle;@JsonKey(name: 'parent_id') String? get parentId;
/// Create a copy of FamilleArticle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FamilleArticleCopyWith<FamilleArticle> get copyWith => _$FamilleArticleCopyWithImpl<FamilleArticle>(this as FamilleArticle, _$identity);

  /// Serializes this FamilleArticle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FamilleArticle&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.libelle, libelle) || other.libelle == libelle)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,libelle,parentId);

@override
String toString() {
  return 'FamilleArticle(id: $id, code: $code, libelle: $libelle, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class $FamilleArticleCopyWith<$Res>  {
  factory $FamilleArticleCopyWith(FamilleArticle value, $Res Function(FamilleArticle) _then) = _$FamilleArticleCopyWithImpl;
@useResult
$Res call({
 String? id, String code, String libelle,@JsonKey(name: 'parent_id') String? parentId
});




}
/// @nodoc
class _$FamilleArticleCopyWithImpl<$Res>
    implements $FamilleArticleCopyWith<$Res> {
  _$FamilleArticleCopyWithImpl(this._self, this._then);

  final FamilleArticle _self;
  final $Res Function(FamilleArticle) _then;

/// Create a copy of FamilleArticle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? code = null,Object? libelle = null,Object? parentId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FamilleArticle].
extension FamilleArticlePatterns on FamilleArticle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FamilleArticle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FamilleArticle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FamilleArticle value)  $default,){
final _that = this;
switch (_that) {
case _FamilleArticle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FamilleArticle value)?  $default,){
final _that = this;
switch (_that) {
case _FamilleArticle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String code,  String libelle, @JsonKey(name: 'parent_id')  String? parentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FamilleArticle() when $default != null:
return $default(_that.id,_that.code,_that.libelle,_that.parentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String code,  String libelle, @JsonKey(name: 'parent_id')  String? parentId)  $default,) {final _that = this;
switch (_that) {
case _FamilleArticle():
return $default(_that.id,_that.code,_that.libelle,_that.parentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String code,  String libelle, @JsonKey(name: 'parent_id')  String? parentId)?  $default,) {final _that = this;
switch (_that) {
case _FamilleArticle() when $default != null:
return $default(_that.id,_that.code,_that.libelle,_that.parentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FamilleArticle implements FamilleArticle {
  const _FamilleArticle({this.id, required this.code, required this.libelle, @JsonKey(name: 'parent_id') this.parentId});
  factory _FamilleArticle.fromJson(Map<String, dynamic> json) => _$FamilleArticleFromJson(json);

@override final  String? id;
@override final  String code;
@override final  String libelle;
@override@JsonKey(name: 'parent_id') final  String? parentId;

/// Create a copy of FamilleArticle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FamilleArticleCopyWith<_FamilleArticle> get copyWith => __$FamilleArticleCopyWithImpl<_FamilleArticle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FamilleArticleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FamilleArticle&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.libelle, libelle) || other.libelle == libelle)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,libelle,parentId);

@override
String toString() {
  return 'FamilleArticle(id: $id, code: $code, libelle: $libelle, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class _$FamilleArticleCopyWith<$Res> implements $FamilleArticleCopyWith<$Res> {
  factory _$FamilleArticleCopyWith(_FamilleArticle value, $Res Function(_FamilleArticle) _then) = __$FamilleArticleCopyWithImpl;
@override @useResult
$Res call({
 String? id, String code, String libelle,@JsonKey(name: 'parent_id') String? parentId
});




}
/// @nodoc
class __$FamilleArticleCopyWithImpl<$Res>
    implements _$FamilleArticleCopyWith<$Res> {
  __$FamilleArticleCopyWithImpl(this._self, this._then);

  final _FamilleArticle _self;
  final $Res Function(_FamilleArticle) _then;

/// Create a copy of FamilleArticle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? code = null,Object? libelle = null,Object? parentId = freezed,}) {
  return _then(_FamilleArticle(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
