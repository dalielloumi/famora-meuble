// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockLigne {

 String get id;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@JsonKey(name: 'depot_id') String get depotId;@DecimalConverter() Decimal get quantite;@DecimalConverter() Decimal get cmp;
/// Create a copy of StockLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockLigneCopyWith<StockLigne> get copyWith => _$StockLigneCopyWithImpl<StockLigne>(this as StockLigne, _$identity);

  /// Serializes this StockLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.cmp, cmp) || other.cmp == cmp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,articleId,varianteId,depotId,quantite,cmp);

@override
String toString() {
  return 'StockLigne(id: $id, articleId: $articleId, varianteId: $varianteId, depotId: $depotId, quantite: $quantite, cmp: $cmp)';
}


}

/// @nodoc
abstract mixin class $StockLigneCopyWith<$Res>  {
  factory $StockLigneCopyWith(StockLigne value, $Res Function(StockLigne) _then) = _$StockLigneCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@JsonKey(name: 'depot_id') String depotId,@DecimalConverter() Decimal quantite,@DecimalConverter() Decimal cmp
});




}
/// @nodoc
class _$StockLigneCopyWithImpl<$Res>
    implements $StockLigneCopyWith<$Res> {
  _$StockLigneCopyWithImpl(this._self, this._then);

  final StockLigne _self;
  final $Res Function(StockLigne) _then;

/// Create a copy of StockLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? articleId = null,Object? varianteId = freezed,Object? depotId = null,Object? quantite = null,Object? cmp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,cmp: null == cmp ? _self.cmp : cmp // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}

}


/// Adds pattern-matching-related methods to [StockLigne].
extension StockLignePatterns on StockLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockLigne value)  $default,){
final _that = this;
switch (_that) {
case _StockLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockLigne value)?  $default,){
final _that = this;
switch (_that) {
case _StockLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @JsonKey(name: 'depot_id')  String depotId, @DecimalConverter()  Decimal quantite, @DecimalConverter()  Decimal cmp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockLigne() when $default != null:
return $default(_that.id,_that.articleId,_that.varianteId,_that.depotId,_that.quantite,_that.cmp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @JsonKey(name: 'depot_id')  String depotId, @DecimalConverter()  Decimal quantite, @DecimalConverter()  Decimal cmp)  $default,) {final _that = this;
switch (_that) {
case _StockLigne():
return $default(_that.id,_that.articleId,_that.varianteId,_that.depotId,_that.quantite,_that.cmp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @JsonKey(name: 'depot_id')  String depotId, @DecimalConverter()  Decimal quantite, @DecimalConverter()  Decimal cmp)?  $default,) {final _that = this;
switch (_that) {
case _StockLigne() when $default != null:
return $default(_that.id,_that.articleId,_that.varianteId,_that.depotId,_that.quantite,_that.cmp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockLigne implements StockLigne {
  const _StockLigne({required this.id, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @JsonKey(name: 'depot_id') required this.depotId, @DecimalConverter() required this.quantite, @DecimalConverter() required this.cmp});
  factory _StockLigne.fromJson(Map<String, dynamic> json) => _$StockLigneFromJson(json);

@override final  String id;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@JsonKey(name: 'depot_id') final  String depotId;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter() final  Decimal cmp;

/// Create a copy of StockLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockLigneCopyWith<_StockLigne> get copyWith => __$StockLigneCopyWithImpl<_StockLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.cmp, cmp) || other.cmp == cmp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,articleId,varianteId,depotId,quantite,cmp);

@override
String toString() {
  return 'StockLigne(id: $id, articleId: $articleId, varianteId: $varianteId, depotId: $depotId, quantite: $quantite, cmp: $cmp)';
}


}

/// @nodoc
abstract mixin class _$StockLigneCopyWith<$Res> implements $StockLigneCopyWith<$Res> {
  factory _$StockLigneCopyWith(_StockLigne value, $Res Function(_StockLigne) _then) = __$StockLigneCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@JsonKey(name: 'depot_id') String depotId,@DecimalConverter() Decimal quantite,@DecimalConverter() Decimal cmp
});




}
/// @nodoc
class __$StockLigneCopyWithImpl<$Res>
    implements _$StockLigneCopyWith<$Res> {
  __$StockLigneCopyWithImpl(this._self, this._then);

  final _StockLigne _self;
  final $Res Function(_StockLigne) _then;

/// Create a copy of StockLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? articleId = null,Object? varianteId = freezed,Object? depotId = null,Object? quantite = null,Object? cmp = null,}) {
  return _then(_StockLigne(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,cmp: null == cmp ? _self.cmp : cmp // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}


}


/// @nodoc
mixin _$MouvementStock {

 String? get id;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@JsonKey(name: 'depot_id') String get depotId;@JsonKey(name: 'type_mouvement') TypeMouvementStock get typeMouvement; SensMouvement get sens;@DecimalConverter() Decimal get quantite;@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal get prixUnitaire;@JsonKey(name: 'date_mouvement') DateTime get dateMouvement; String? get notes;
/// Create a copy of MouvementStock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MouvementStockCopyWith<MouvementStock> get copyWith => _$MouvementStockCopyWithImpl<MouvementStock>(this as MouvementStock, _$identity);

  /// Serializes this MouvementStock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MouvementStock&&(identical(other.id, id) || other.id == id)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.typeMouvement, typeMouvement) || other.typeMouvement == typeMouvement)&&(identical(other.sens, sens) || other.sens == sens)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.dateMouvement, dateMouvement) || other.dateMouvement == dateMouvement)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,articleId,varianteId,depotId,typeMouvement,sens,quantite,prixUnitaire,dateMouvement,notes);

@override
String toString() {
  return 'MouvementStock(id: $id, articleId: $articleId, varianteId: $varianteId, depotId: $depotId, typeMouvement: $typeMouvement, sens: $sens, quantite: $quantite, prixUnitaire: $prixUnitaire, dateMouvement: $dateMouvement, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $MouvementStockCopyWith<$Res>  {
  factory $MouvementStockCopyWith(MouvementStock value, $Res Function(MouvementStock) _then) = _$MouvementStockCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@JsonKey(name: 'depot_id') String depotId,@JsonKey(name: 'type_mouvement') TypeMouvementStock typeMouvement, SensMouvement sens,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@JsonKey(name: 'date_mouvement') DateTime dateMouvement, String? notes
});




}
/// @nodoc
class _$MouvementStockCopyWithImpl<$Res>
    implements $MouvementStockCopyWith<$Res> {
  _$MouvementStockCopyWithImpl(this._self, this._then);

  final MouvementStock _self;
  final $Res Function(MouvementStock) _then;

/// Create a copy of MouvementStock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? articleId = null,Object? varianteId = freezed,Object? depotId = null,Object? typeMouvement = null,Object? sens = null,Object? quantite = null,Object? prixUnitaire = null,Object? dateMouvement = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,typeMouvement: null == typeMouvement ? _self.typeMouvement : typeMouvement // ignore: cast_nullable_to_non_nullable
as TypeMouvementStock,sens: null == sens ? _self.sens : sens // ignore: cast_nullable_to_non_nullable
as SensMouvement,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,dateMouvement: null == dateMouvement ? _self.dateMouvement : dateMouvement // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MouvementStock].
extension MouvementStockPatterns on MouvementStock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MouvementStock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MouvementStock() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MouvementStock value)  $default,){
final _that = this;
switch (_that) {
case _MouvementStock():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MouvementStock value)?  $default,){
final _that = this;
switch (_that) {
case _MouvementStock() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'type_mouvement')  TypeMouvementStock typeMouvement,  SensMouvement sens, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @JsonKey(name: 'date_mouvement')  DateTime dateMouvement,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MouvementStock() when $default != null:
return $default(_that.id,_that.articleId,_that.varianteId,_that.depotId,_that.typeMouvement,_that.sens,_that.quantite,_that.prixUnitaire,_that.dateMouvement,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'type_mouvement')  TypeMouvementStock typeMouvement,  SensMouvement sens, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @JsonKey(name: 'date_mouvement')  DateTime dateMouvement,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _MouvementStock():
return $default(_that.id,_that.articleId,_that.varianteId,_that.depotId,_that.typeMouvement,_that.sens,_that.quantite,_that.prixUnitaire,_that.dateMouvement,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'type_mouvement')  TypeMouvementStock typeMouvement,  SensMouvement sens, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @JsonKey(name: 'date_mouvement')  DateTime dateMouvement,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _MouvementStock() when $default != null:
return $default(_that.id,_that.articleId,_that.varianteId,_that.depotId,_that.typeMouvement,_that.sens,_that.quantite,_that.prixUnitaire,_that.dateMouvement,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MouvementStock implements MouvementStock {
  const _MouvementStock({this.id, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @JsonKey(name: 'depot_id') required this.depotId, @JsonKey(name: 'type_mouvement') required this.typeMouvement, required this.sens, @DecimalConverter() required this.quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire') required this.prixUnitaire, @JsonKey(name: 'date_mouvement') required this.dateMouvement, this.notes});
  factory _MouvementStock.fromJson(Map<String, dynamic> json) => _$MouvementStockFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@JsonKey(name: 'depot_id') final  String depotId;
@override@JsonKey(name: 'type_mouvement') final  TypeMouvementStock typeMouvement;
@override final  SensMouvement sens;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter()@JsonKey(name: 'prix_unitaire') final  Decimal prixUnitaire;
@override@JsonKey(name: 'date_mouvement') final  DateTime dateMouvement;
@override final  String? notes;

/// Create a copy of MouvementStock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MouvementStockCopyWith<_MouvementStock> get copyWith => __$MouvementStockCopyWithImpl<_MouvementStock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MouvementStockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MouvementStock&&(identical(other.id, id) || other.id == id)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.typeMouvement, typeMouvement) || other.typeMouvement == typeMouvement)&&(identical(other.sens, sens) || other.sens == sens)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.dateMouvement, dateMouvement) || other.dateMouvement == dateMouvement)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,articleId,varianteId,depotId,typeMouvement,sens,quantite,prixUnitaire,dateMouvement,notes);

@override
String toString() {
  return 'MouvementStock(id: $id, articleId: $articleId, varianteId: $varianteId, depotId: $depotId, typeMouvement: $typeMouvement, sens: $sens, quantite: $quantite, prixUnitaire: $prixUnitaire, dateMouvement: $dateMouvement, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$MouvementStockCopyWith<$Res> implements $MouvementStockCopyWith<$Res> {
  factory _$MouvementStockCopyWith(_MouvementStock value, $Res Function(_MouvementStock) _then) = __$MouvementStockCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@JsonKey(name: 'depot_id') String depotId,@JsonKey(name: 'type_mouvement') TypeMouvementStock typeMouvement, SensMouvement sens,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@JsonKey(name: 'date_mouvement') DateTime dateMouvement, String? notes
});




}
/// @nodoc
class __$MouvementStockCopyWithImpl<$Res>
    implements _$MouvementStockCopyWith<$Res> {
  __$MouvementStockCopyWithImpl(this._self, this._then);

  final _MouvementStock _self;
  final $Res Function(_MouvementStock) _then;

/// Create a copy of MouvementStock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? articleId = null,Object? varianteId = freezed,Object? depotId = null,Object? typeMouvement = null,Object? sens = null,Object? quantite = null,Object? prixUnitaire = null,Object? dateMouvement = null,Object? notes = freezed,}) {
  return _then(_MouvementStock(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,typeMouvement: null == typeMouvement ? _self.typeMouvement : typeMouvement // ignore: cast_nullable_to_non_nullable
as TypeMouvementStock,sens: null == sens ? _self.sens : sens // ignore: cast_nullable_to_non_nullable
as SensMouvement,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,dateMouvement: null == dateMouvement ? _self.dateMouvement : dateMouvement // ignore: cast_nullable_to_non_nullable
as DateTime,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
