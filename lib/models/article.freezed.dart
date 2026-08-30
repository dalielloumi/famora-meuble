// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Article {

 String? get id; String get reference; String get designation;@JsonKey(name: 'famille_id') String? get familleId;@JsonKey(name: 'type_article') TypeArticle get typeArticle;@JsonKey(name: 'unite_id') String get uniteId;@JsonKey(name: 'gere_stock') bool get gereStock;@DecimalConverter()@JsonKey(name: 'prix_achat_standard') Decimal get prixAchatStandard;@DecimalConverter()@JsonKey(name: 'prix_vente_ht') Decimal get prixVenteHt;@JsonKey(name: 'taux_tva_id') String get tauxTvaId;@DecimalConverter()@JsonKey(name: 'seuil_alerte') Decimal get seuilAlerte; bool get actif;
/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleCopyWith<Article> get copyWith => _$ArticleCopyWithImpl<Article>(this as Article, _$identity);

  /// Serializes this Article to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Article&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.familleId, familleId) || other.familleId == familleId)&&(identical(other.typeArticle, typeArticle) || other.typeArticle == typeArticle)&&(identical(other.uniteId, uniteId) || other.uniteId == uniteId)&&(identical(other.gereStock, gereStock) || other.gereStock == gereStock)&&(identical(other.prixAchatStandard, prixAchatStandard) || other.prixAchatStandard == prixAchatStandard)&&(identical(other.prixVenteHt, prixVenteHt) || other.prixVenteHt == prixVenteHt)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.seuilAlerte, seuilAlerte) || other.seuilAlerte == seuilAlerte)&&(identical(other.actif, actif) || other.actif == actif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reference,designation,familleId,typeArticle,uniteId,gereStock,prixAchatStandard,prixVenteHt,tauxTvaId,seuilAlerte,actif);

@override
String toString() {
  return 'Article(id: $id, reference: $reference, designation: $designation, familleId: $familleId, typeArticle: $typeArticle, uniteId: $uniteId, gereStock: $gereStock, prixAchatStandard: $prixAchatStandard, prixVenteHt: $prixVenteHt, tauxTvaId: $tauxTvaId, seuilAlerte: $seuilAlerte, actif: $actif)';
}


}

/// @nodoc
abstract mixin class $ArticleCopyWith<$Res>  {
  factory $ArticleCopyWith(Article value, $Res Function(Article) _then) = _$ArticleCopyWithImpl;
@useResult
$Res call({
 String? id, String reference, String designation,@JsonKey(name: 'famille_id') String? familleId,@JsonKey(name: 'type_article') TypeArticle typeArticle,@JsonKey(name: 'unite_id') String uniteId,@JsonKey(name: 'gere_stock') bool gereStock,@DecimalConverter()@JsonKey(name: 'prix_achat_standard') Decimal prixAchatStandard,@DecimalConverter()@JsonKey(name: 'prix_vente_ht') Decimal prixVenteHt,@JsonKey(name: 'taux_tva_id') String tauxTvaId,@DecimalConverter()@JsonKey(name: 'seuil_alerte') Decimal seuilAlerte, bool actif
});




}
/// @nodoc
class _$ArticleCopyWithImpl<$Res>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._self, this._then);

  final Article _self;
  final $Res Function(Article) _then;

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? reference = null,Object? designation = null,Object? familleId = freezed,Object? typeArticle = null,Object? uniteId = null,Object? gereStock = null,Object? prixAchatStandard = null,Object? prixVenteHt = null,Object? tauxTvaId = null,Object? seuilAlerte = null,Object? actif = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,designation: null == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String,familleId: freezed == familleId ? _self.familleId : familleId // ignore: cast_nullable_to_non_nullable
as String?,typeArticle: null == typeArticle ? _self.typeArticle : typeArticle // ignore: cast_nullable_to_non_nullable
as TypeArticle,uniteId: null == uniteId ? _self.uniteId : uniteId // ignore: cast_nullable_to_non_nullable
as String,gereStock: null == gereStock ? _self.gereStock : gereStock // ignore: cast_nullable_to_non_nullable
as bool,prixAchatStandard: null == prixAchatStandard ? _self.prixAchatStandard : prixAchatStandard // ignore: cast_nullable_to_non_nullable
as Decimal,prixVenteHt: null == prixVenteHt ? _self.prixVenteHt : prixVenteHt // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,seuilAlerte: null == seuilAlerte ? _self.seuilAlerte : seuilAlerte // ignore: cast_nullable_to_non_nullable
as Decimal,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Article].
extension ArticlePatterns on Article {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Article value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Article() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Article value)  $default,){
final _that = this;
switch (_that) {
case _Article():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Article value)?  $default,){
final _that = this;
switch (_that) {
case _Article() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String reference,  String designation, @JsonKey(name: 'famille_id')  String? familleId, @JsonKey(name: 'type_article')  TypeArticle typeArticle, @JsonKey(name: 'unite_id')  String uniteId, @JsonKey(name: 'gere_stock')  bool gereStock, @DecimalConverter()@JsonKey(name: 'prix_achat_standard')  Decimal prixAchatStandard, @DecimalConverter()@JsonKey(name: 'prix_vente_ht')  Decimal prixVenteHt, @JsonKey(name: 'taux_tva_id')  String tauxTvaId, @DecimalConverter()@JsonKey(name: 'seuil_alerte')  Decimal seuilAlerte,  bool actif)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Article() when $default != null:
return $default(_that.id,_that.reference,_that.designation,_that.familleId,_that.typeArticle,_that.uniteId,_that.gereStock,_that.prixAchatStandard,_that.prixVenteHt,_that.tauxTvaId,_that.seuilAlerte,_that.actif);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String reference,  String designation, @JsonKey(name: 'famille_id')  String? familleId, @JsonKey(name: 'type_article')  TypeArticle typeArticle, @JsonKey(name: 'unite_id')  String uniteId, @JsonKey(name: 'gere_stock')  bool gereStock, @DecimalConverter()@JsonKey(name: 'prix_achat_standard')  Decimal prixAchatStandard, @DecimalConverter()@JsonKey(name: 'prix_vente_ht')  Decimal prixVenteHt, @JsonKey(name: 'taux_tva_id')  String tauxTvaId, @DecimalConverter()@JsonKey(name: 'seuil_alerte')  Decimal seuilAlerte,  bool actif)  $default,) {final _that = this;
switch (_that) {
case _Article():
return $default(_that.id,_that.reference,_that.designation,_that.familleId,_that.typeArticle,_that.uniteId,_that.gereStock,_that.prixAchatStandard,_that.prixVenteHt,_that.tauxTvaId,_that.seuilAlerte,_that.actif);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String reference,  String designation, @JsonKey(name: 'famille_id')  String? familleId, @JsonKey(name: 'type_article')  TypeArticle typeArticle, @JsonKey(name: 'unite_id')  String uniteId, @JsonKey(name: 'gere_stock')  bool gereStock, @DecimalConverter()@JsonKey(name: 'prix_achat_standard')  Decimal prixAchatStandard, @DecimalConverter()@JsonKey(name: 'prix_vente_ht')  Decimal prixVenteHt, @JsonKey(name: 'taux_tva_id')  String tauxTvaId, @DecimalConverter()@JsonKey(name: 'seuil_alerte')  Decimal seuilAlerte,  bool actif)?  $default,) {final _that = this;
switch (_that) {
case _Article() when $default != null:
return $default(_that.id,_that.reference,_that.designation,_that.familleId,_that.typeArticle,_that.uniteId,_that.gereStock,_that.prixAchatStandard,_that.prixVenteHt,_that.tauxTvaId,_that.seuilAlerte,_that.actif);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Article implements Article {
  const _Article({this.id, required this.reference, required this.designation, @JsonKey(name: 'famille_id') this.familleId, @JsonKey(name: 'type_article') required this.typeArticle, @JsonKey(name: 'unite_id') required this.uniteId, @JsonKey(name: 'gere_stock') this.gereStock = true, @DecimalConverter()@JsonKey(name: 'prix_achat_standard') required this.prixAchatStandard, @DecimalConverter()@JsonKey(name: 'prix_vente_ht') required this.prixVenteHt, @JsonKey(name: 'taux_tva_id') required this.tauxTvaId, @DecimalConverter()@JsonKey(name: 'seuil_alerte') required this.seuilAlerte, this.actif = true});
  factory _Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

@override final  String? id;
@override final  String reference;
@override final  String designation;
@override@JsonKey(name: 'famille_id') final  String? familleId;
@override@JsonKey(name: 'type_article') final  TypeArticle typeArticle;
@override@JsonKey(name: 'unite_id') final  String uniteId;
@override@JsonKey(name: 'gere_stock') final  bool gereStock;
@override@DecimalConverter()@JsonKey(name: 'prix_achat_standard') final  Decimal prixAchatStandard;
@override@DecimalConverter()@JsonKey(name: 'prix_vente_ht') final  Decimal prixVenteHt;
@override@JsonKey(name: 'taux_tva_id') final  String tauxTvaId;
@override@DecimalConverter()@JsonKey(name: 'seuil_alerte') final  Decimal seuilAlerte;
@override@JsonKey() final  bool actif;

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleCopyWith<_Article> get copyWith => __$ArticleCopyWithImpl<_Article>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Article&&(identical(other.id, id) || other.id == id)&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.familleId, familleId) || other.familleId == familleId)&&(identical(other.typeArticle, typeArticle) || other.typeArticle == typeArticle)&&(identical(other.uniteId, uniteId) || other.uniteId == uniteId)&&(identical(other.gereStock, gereStock) || other.gereStock == gereStock)&&(identical(other.prixAchatStandard, prixAchatStandard) || other.prixAchatStandard == prixAchatStandard)&&(identical(other.prixVenteHt, prixVenteHt) || other.prixVenteHt == prixVenteHt)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.seuilAlerte, seuilAlerte) || other.seuilAlerte == seuilAlerte)&&(identical(other.actif, actif) || other.actif == actif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reference,designation,familleId,typeArticle,uniteId,gereStock,prixAchatStandard,prixVenteHt,tauxTvaId,seuilAlerte,actif);

@override
String toString() {
  return 'Article(id: $id, reference: $reference, designation: $designation, familleId: $familleId, typeArticle: $typeArticle, uniteId: $uniteId, gereStock: $gereStock, prixAchatStandard: $prixAchatStandard, prixVenteHt: $prixVenteHt, tauxTvaId: $tauxTvaId, seuilAlerte: $seuilAlerte, actif: $actif)';
}


}

/// @nodoc
abstract mixin class _$ArticleCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$ArticleCopyWith(_Article value, $Res Function(_Article) _then) = __$ArticleCopyWithImpl;
@override @useResult
$Res call({
 String? id, String reference, String designation,@JsonKey(name: 'famille_id') String? familleId,@JsonKey(name: 'type_article') TypeArticle typeArticle,@JsonKey(name: 'unite_id') String uniteId,@JsonKey(name: 'gere_stock') bool gereStock,@DecimalConverter()@JsonKey(name: 'prix_achat_standard') Decimal prixAchatStandard,@DecimalConverter()@JsonKey(name: 'prix_vente_ht') Decimal prixVenteHt,@JsonKey(name: 'taux_tva_id') String tauxTvaId,@DecimalConverter()@JsonKey(name: 'seuil_alerte') Decimal seuilAlerte, bool actif
});




}
/// @nodoc
class __$ArticleCopyWithImpl<$Res>
    implements _$ArticleCopyWith<$Res> {
  __$ArticleCopyWithImpl(this._self, this._then);

  final _Article _self;
  final $Res Function(_Article) _then;

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? reference = null,Object? designation = null,Object? familleId = freezed,Object? typeArticle = null,Object? uniteId = null,Object? gereStock = null,Object? prixAchatStandard = null,Object? prixVenteHt = null,Object? tauxTvaId = null,Object? seuilAlerte = null,Object? actif = null,}) {
  return _then(_Article(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,designation: null == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String,familleId: freezed == familleId ? _self.familleId : familleId // ignore: cast_nullable_to_non_nullable
as String?,typeArticle: null == typeArticle ? _self.typeArticle : typeArticle // ignore: cast_nullable_to_non_nullable
as TypeArticle,uniteId: null == uniteId ? _self.uniteId : uniteId // ignore: cast_nullable_to_non_nullable
as String,gereStock: null == gereStock ? _self.gereStock : gereStock // ignore: cast_nullable_to_non_nullable
as bool,prixAchatStandard: null == prixAchatStandard ? _self.prixAchatStandard : prixAchatStandard // ignore: cast_nullable_to_non_nullable
as Decimal,prixVenteHt: null == prixVenteHt ? _self.prixVenteHt : prixVenteHt // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,seuilAlerte: null == seuilAlerte ? _self.seuilAlerte : seuilAlerte // ignore: cast_nullable_to_non_nullable
as Decimal,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
