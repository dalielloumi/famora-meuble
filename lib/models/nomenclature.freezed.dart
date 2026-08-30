// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nomenclature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Nomenclature {

 String? get id;@JsonKey(name: 'article_id') String get articleId; int get version; bool get actif; String? get notes;
/// Create a copy of Nomenclature
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NomenclatureCopyWith<Nomenclature> get copyWith => _$NomenclatureCopyWithImpl<Nomenclature>(this as Nomenclature, _$identity);

  /// Serializes this Nomenclature to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Nomenclature&&(identical(other.id, id) || other.id == id)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.version, version) || other.version == version)&&(identical(other.actif, actif) || other.actif == actif)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,articleId,version,actif,notes);

@override
String toString() {
  return 'Nomenclature(id: $id, articleId: $articleId, version: $version, actif: $actif, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $NomenclatureCopyWith<$Res>  {
  factory $NomenclatureCopyWith(Nomenclature value, $Res Function(Nomenclature) _then) = _$NomenclatureCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'article_id') String articleId, int version, bool actif, String? notes
});




}
/// @nodoc
class _$NomenclatureCopyWithImpl<$Res>
    implements $NomenclatureCopyWith<$Res> {
  _$NomenclatureCopyWithImpl(this._self, this._then);

  final Nomenclature _self;
  final $Res Function(Nomenclature) _then;

/// Create a copy of Nomenclature
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? articleId = null,Object? version = null,Object? actif = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Nomenclature].
extension NomenclaturePatterns on Nomenclature {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Nomenclature value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Nomenclature() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Nomenclature value)  $default,){
final _that = this;
switch (_that) {
case _Nomenclature():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Nomenclature value)?  $default,){
final _that = this;
switch (_that) {
case _Nomenclature() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'article_id')  String articleId,  int version,  bool actif,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Nomenclature() when $default != null:
return $default(_that.id,_that.articleId,_that.version,_that.actif,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'article_id')  String articleId,  int version,  bool actif,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Nomenclature():
return $default(_that.id,_that.articleId,_that.version,_that.actif,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'article_id')  String articleId,  int version,  bool actif,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Nomenclature() when $default != null:
return $default(_that.id,_that.articleId,_that.version,_that.actif,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Nomenclature implements Nomenclature {
  const _Nomenclature({this.id, @JsonKey(name: 'article_id') required this.articleId, this.version = 1, this.actif = true, this.notes});
  factory _Nomenclature.fromJson(Map<String, dynamic> json) => _$NomenclatureFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey() final  int version;
@override@JsonKey() final  bool actif;
@override final  String? notes;

/// Create a copy of Nomenclature
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NomenclatureCopyWith<_Nomenclature> get copyWith => __$NomenclatureCopyWithImpl<_Nomenclature>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NomenclatureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Nomenclature&&(identical(other.id, id) || other.id == id)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.version, version) || other.version == version)&&(identical(other.actif, actif) || other.actif == actif)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,articleId,version,actif,notes);

@override
String toString() {
  return 'Nomenclature(id: $id, articleId: $articleId, version: $version, actif: $actif, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$NomenclatureCopyWith<$Res> implements $NomenclatureCopyWith<$Res> {
  factory _$NomenclatureCopyWith(_Nomenclature value, $Res Function(_Nomenclature) _then) = __$NomenclatureCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'article_id') String articleId, int version, bool actif, String? notes
});




}
/// @nodoc
class __$NomenclatureCopyWithImpl<$Res>
    implements _$NomenclatureCopyWith<$Res> {
  __$NomenclatureCopyWithImpl(this._self, this._then);

  final _Nomenclature _self;
  final $Res Function(_Nomenclature) _then;

/// Create a copy of Nomenclature
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? articleId = null,Object? version = null,Object? actif = null,Object? notes = freezed,}) {
  return _then(_Nomenclature(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$NomenclatureLigne {

 String? get id;@JsonKey(name: 'nomenclature_id') String get nomenclatureId;@JsonKey(name: 'composant_id') String get composantId;@DecimalConverter() Decimal get quantite;@JsonKey(name: 'unite_id') String get uniteId; int get ordre;
/// Create a copy of NomenclatureLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NomenclatureLigneCopyWith<NomenclatureLigne> get copyWith => _$NomenclatureLigneCopyWithImpl<NomenclatureLigne>(this as NomenclatureLigne, _$identity);

  /// Serializes this NomenclatureLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NomenclatureLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.nomenclatureId, nomenclatureId) || other.nomenclatureId == nomenclatureId)&&(identical(other.composantId, composantId) || other.composantId == composantId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.uniteId, uniteId) || other.uniteId == uniteId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nomenclatureId,composantId,quantite,uniteId,ordre);

@override
String toString() {
  return 'NomenclatureLigne(id: $id, nomenclatureId: $nomenclatureId, composantId: $composantId, quantite: $quantite, uniteId: $uniteId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class $NomenclatureLigneCopyWith<$Res>  {
  factory $NomenclatureLigneCopyWith(NomenclatureLigne value, $Res Function(NomenclatureLigne) _then) = _$NomenclatureLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'nomenclature_id') String nomenclatureId,@JsonKey(name: 'composant_id') String composantId,@DecimalConverter() Decimal quantite,@JsonKey(name: 'unite_id') String uniteId, int ordre
});




}
/// @nodoc
class _$NomenclatureLigneCopyWithImpl<$Res>
    implements $NomenclatureLigneCopyWith<$Res> {
  _$NomenclatureLigneCopyWithImpl(this._self, this._then);

  final NomenclatureLigne _self;
  final $Res Function(NomenclatureLigne) _then;

/// Create a copy of NomenclatureLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nomenclatureId = null,Object? composantId = null,Object? quantite = null,Object? uniteId = null,Object? ordre = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nomenclatureId: null == nomenclatureId ? _self.nomenclatureId : nomenclatureId // ignore: cast_nullable_to_non_nullable
as String,composantId: null == composantId ? _self.composantId : composantId // ignore: cast_nullable_to_non_nullable
as String,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,uniteId: null == uniteId ? _self.uniteId : uniteId // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NomenclatureLigne].
extension NomenclatureLignePatterns on NomenclatureLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NomenclatureLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NomenclatureLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NomenclatureLigne value)  $default,){
final _that = this;
switch (_that) {
case _NomenclatureLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NomenclatureLigne value)?  $default,){
final _that = this;
switch (_that) {
case _NomenclatureLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'nomenclature_id')  String nomenclatureId, @JsonKey(name: 'composant_id')  String composantId, @DecimalConverter()  Decimal quantite, @JsonKey(name: 'unite_id')  String uniteId,  int ordre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NomenclatureLigne() when $default != null:
return $default(_that.id,_that.nomenclatureId,_that.composantId,_that.quantite,_that.uniteId,_that.ordre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'nomenclature_id')  String nomenclatureId, @JsonKey(name: 'composant_id')  String composantId, @DecimalConverter()  Decimal quantite, @JsonKey(name: 'unite_id')  String uniteId,  int ordre)  $default,) {final _that = this;
switch (_that) {
case _NomenclatureLigne():
return $default(_that.id,_that.nomenclatureId,_that.composantId,_that.quantite,_that.uniteId,_that.ordre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'nomenclature_id')  String nomenclatureId, @JsonKey(name: 'composant_id')  String composantId, @DecimalConverter()  Decimal quantite, @JsonKey(name: 'unite_id')  String uniteId,  int ordre)?  $default,) {final _that = this;
switch (_that) {
case _NomenclatureLigne() when $default != null:
return $default(_that.id,_that.nomenclatureId,_that.composantId,_that.quantite,_that.uniteId,_that.ordre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NomenclatureLigne implements NomenclatureLigne {
  const _NomenclatureLigne({this.id, @JsonKey(name: 'nomenclature_id') required this.nomenclatureId, @JsonKey(name: 'composant_id') required this.composantId, @DecimalConverter() required this.quantite, @JsonKey(name: 'unite_id') required this.uniteId, this.ordre = 0});
  factory _NomenclatureLigne.fromJson(Map<String, dynamic> json) => _$NomenclatureLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'nomenclature_id') final  String nomenclatureId;
@override@JsonKey(name: 'composant_id') final  String composantId;
@override@DecimalConverter() final  Decimal quantite;
@override@JsonKey(name: 'unite_id') final  String uniteId;
@override@JsonKey() final  int ordre;

/// Create a copy of NomenclatureLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NomenclatureLigneCopyWith<_NomenclatureLigne> get copyWith => __$NomenclatureLigneCopyWithImpl<_NomenclatureLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NomenclatureLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NomenclatureLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.nomenclatureId, nomenclatureId) || other.nomenclatureId == nomenclatureId)&&(identical(other.composantId, composantId) || other.composantId == composantId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.uniteId, uniteId) || other.uniteId == uniteId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nomenclatureId,composantId,quantite,uniteId,ordre);

@override
String toString() {
  return 'NomenclatureLigne(id: $id, nomenclatureId: $nomenclatureId, composantId: $composantId, quantite: $quantite, uniteId: $uniteId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class _$NomenclatureLigneCopyWith<$Res> implements $NomenclatureLigneCopyWith<$Res> {
  factory _$NomenclatureLigneCopyWith(_NomenclatureLigne value, $Res Function(_NomenclatureLigne) _then) = __$NomenclatureLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'nomenclature_id') String nomenclatureId,@JsonKey(name: 'composant_id') String composantId,@DecimalConverter() Decimal quantite,@JsonKey(name: 'unite_id') String uniteId, int ordre
});




}
/// @nodoc
class __$NomenclatureLigneCopyWithImpl<$Res>
    implements _$NomenclatureLigneCopyWith<$Res> {
  __$NomenclatureLigneCopyWithImpl(this._self, this._then);

  final _NomenclatureLigne _self;
  final $Res Function(_NomenclatureLigne) _then;

/// Create a copy of NomenclatureLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nomenclatureId = null,Object? composantId = null,Object? quantite = null,Object? uniteId = null,Object? ordre = null,}) {
  return _then(_NomenclatureLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nomenclatureId: null == nomenclatureId ? _self.nomenclatureId : nomenclatureId // ignore: cast_nullable_to_non_nullable
as String,composantId: null == composantId ? _self.composantId : composantId // ignore: cast_nullable_to_non_nullable
as String,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,uniteId: null == uniteId ? _self.uniteId : uniteId // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
