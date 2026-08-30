// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventaire.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Inventaire {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'depot_id') String get depotId;@JsonKey(name: 'date_inventaire') DateTime get dateInventaire; StatutDocument get statut; String? get notes;
/// Create a copy of Inventaire
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventaireCopyWith<Inventaire> get copyWith => _$InventaireCopyWithImpl<Inventaire>(this as Inventaire, _$identity);

  /// Serializes this Inventaire to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Inventaire&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.dateInventaire, dateInventaire) || other.dateInventaire == dateInventaire)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,depotId,dateInventaire,statut,notes);

@override
String toString() {
  return 'Inventaire(id: $id, numero: $numero, exerciceId: $exerciceId, depotId: $depotId, dateInventaire: $dateInventaire, statut: $statut, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $InventaireCopyWith<$Res>  {
  factory $InventaireCopyWith(Inventaire value, $Res Function(Inventaire) _then) = _$InventaireCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'depot_id') String depotId,@JsonKey(name: 'date_inventaire') DateTime dateInventaire, StatutDocument statut, String? notes
});




}
/// @nodoc
class _$InventaireCopyWithImpl<$Res>
    implements $InventaireCopyWith<$Res> {
  _$InventaireCopyWithImpl(this._self, this._then);

  final Inventaire _self;
  final $Res Function(Inventaire) _then;

/// Create a copy of Inventaire
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? depotId = null,Object? dateInventaire = null,Object? statut = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,dateInventaire: null == dateInventaire ? _self.dateInventaire : dateInventaire // ignore: cast_nullable_to_non_nullable
as DateTime,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Inventaire].
extension InventairePatterns on Inventaire {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Inventaire value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Inventaire() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Inventaire value)  $default,){
final _that = this;
switch (_that) {
case _Inventaire():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Inventaire value)?  $default,){
final _that = this;
switch (_that) {
case _Inventaire() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_inventaire')  DateTime dateInventaire,  StatutDocument statut,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Inventaire() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.depotId,_that.dateInventaire,_that.statut,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_inventaire')  DateTime dateInventaire,  StatutDocument statut,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Inventaire():
return $default(_that.id,_that.numero,_that.exerciceId,_that.depotId,_that.dateInventaire,_that.statut,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_inventaire')  DateTime dateInventaire,  StatutDocument statut,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Inventaire() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.depotId,_that.dateInventaire,_that.statut,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Inventaire implements Inventaire {
  const _Inventaire({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'depot_id') required this.depotId, @JsonKey(name: 'date_inventaire') required this.dateInventaire, this.statut = StatutDocument.brouillon, this.notes});
  factory _Inventaire.fromJson(Map<String, dynamic> json) => _$InventaireFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'depot_id') final  String depotId;
@override@JsonKey(name: 'date_inventaire') final  DateTime dateInventaire;
@override@JsonKey() final  StatutDocument statut;
@override final  String? notes;

/// Create a copy of Inventaire
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventaireCopyWith<_Inventaire> get copyWith => __$InventaireCopyWithImpl<_Inventaire>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventaireToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Inventaire&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.dateInventaire, dateInventaire) || other.dateInventaire == dateInventaire)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,depotId,dateInventaire,statut,notes);

@override
String toString() {
  return 'Inventaire(id: $id, numero: $numero, exerciceId: $exerciceId, depotId: $depotId, dateInventaire: $dateInventaire, statut: $statut, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$InventaireCopyWith<$Res> implements $InventaireCopyWith<$Res> {
  factory _$InventaireCopyWith(_Inventaire value, $Res Function(_Inventaire) _then) = __$InventaireCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'depot_id') String depotId,@JsonKey(name: 'date_inventaire') DateTime dateInventaire, StatutDocument statut, String? notes
});




}
/// @nodoc
class __$InventaireCopyWithImpl<$Res>
    implements _$InventaireCopyWith<$Res> {
  __$InventaireCopyWithImpl(this._self, this._then);

  final _Inventaire _self;
  final $Res Function(_Inventaire) _then;

/// Create a copy of Inventaire
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? depotId = null,Object? dateInventaire = null,Object? statut = null,Object? notes = freezed,}) {
  return _then(_Inventaire(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,dateInventaire: null == dateInventaire ? _self.dateInventaire : dateInventaire // ignore: cast_nullable_to_non_nullable
as DateTime,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$InventaireLigne {

 String? get id;@JsonKey(name: 'inventaire_id') String get inventaireId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@DecimalConverter()@JsonKey(name: 'quantite_theorique') Decimal get quantiteTheorique;@DecimalConverter()@JsonKey(name: 'quantite_comptee') Decimal? get quantiteComptee;@DecimalConverter() Decimal get ecart;
/// Create a copy of InventaireLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventaireLigneCopyWith<InventaireLigne> get copyWith => _$InventaireLigneCopyWithImpl<InventaireLigne>(this as InventaireLigne, _$identity);

  /// Serializes this InventaireLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventaireLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.inventaireId, inventaireId) || other.inventaireId == inventaireId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantiteTheorique, quantiteTheorique) || other.quantiteTheorique == quantiteTheorique)&&(identical(other.quantiteComptee, quantiteComptee) || other.quantiteComptee == quantiteComptee)&&(identical(other.ecart, ecart) || other.ecart == ecart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,inventaireId,articleId,varianteId,quantiteTheorique,quantiteComptee,ecart);

@override
String toString() {
  return 'InventaireLigne(id: $id, inventaireId: $inventaireId, articleId: $articleId, varianteId: $varianteId, quantiteTheorique: $quantiteTheorique, quantiteComptee: $quantiteComptee, ecart: $ecart)';
}


}

/// @nodoc
abstract mixin class $InventaireLigneCopyWith<$Res>  {
  factory $InventaireLigneCopyWith(InventaireLigne value, $Res Function(InventaireLigne) _then) = _$InventaireLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'inventaire_id') String inventaireId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter()@JsonKey(name: 'quantite_theorique') Decimal quantiteTheorique,@DecimalConverter()@JsonKey(name: 'quantite_comptee') Decimal? quantiteComptee,@DecimalConverter() Decimal ecart
});




}
/// @nodoc
class _$InventaireLigneCopyWithImpl<$Res>
    implements $InventaireLigneCopyWith<$Res> {
  _$InventaireLigneCopyWithImpl(this._self, this._then);

  final InventaireLigne _self;
  final $Res Function(InventaireLigne) _then;

/// Create a copy of InventaireLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? inventaireId = null,Object? articleId = null,Object? varianteId = freezed,Object? quantiteTheorique = null,Object? quantiteComptee = freezed,Object? ecart = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,inventaireId: null == inventaireId ? _self.inventaireId : inventaireId // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantiteTheorique: null == quantiteTheorique ? _self.quantiteTheorique : quantiteTheorique // ignore: cast_nullable_to_non_nullable
as Decimal,quantiteComptee: freezed == quantiteComptee ? _self.quantiteComptee : quantiteComptee // ignore: cast_nullable_to_non_nullable
as Decimal?,ecart: null == ecart ? _self.ecart : ecart // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}

}


/// Adds pattern-matching-related methods to [InventaireLigne].
extension InventaireLignePatterns on InventaireLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventaireLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventaireLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventaireLigne value)  $default,){
final _that = this;
switch (_that) {
case _InventaireLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventaireLigne value)?  $default,){
final _that = this;
switch (_that) {
case _InventaireLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'inventaire_id')  String inventaireId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()@JsonKey(name: 'quantite_theorique')  Decimal quantiteTheorique, @DecimalConverter()@JsonKey(name: 'quantite_comptee')  Decimal? quantiteComptee, @DecimalConverter()  Decimal ecart)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventaireLigne() when $default != null:
return $default(_that.id,_that.inventaireId,_that.articleId,_that.varianteId,_that.quantiteTheorique,_that.quantiteComptee,_that.ecart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'inventaire_id')  String inventaireId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()@JsonKey(name: 'quantite_theorique')  Decimal quantiteTheorique, @DecimalConverter()@JsonKey(name: 'quantite_comptee')  Decimal? quantiteComptee, @DecimalConverter()  Decimal ecart)  $default,) {final _that = this;
switch (_that) {
case _InventaireLigne():
return $default(_that.id,_that.inventaireId,_that.articleId,_that.varianteId,_that.quantiteTheorique,_that.quantiteComptee,_that.ecart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'inventaire_id')  String inventaireId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()@JsonKey(name: 'quantite_theorique')  Decimal quantiteTheorique, @DecimalConverter()@JsonKey(name: 'quantite_comptee')  Decimal? quantiteComptee, @DecimalConverter()  Decimal ecart)?  $default,) {final _that = this;
switch (_that) {
case _InventaireLigne() when $default != null:
return $default(_that.id,_that.inventaireId,_that.articleId,_that.varianteId,_that.quantiteTheorique,_that.quantiteComptee,_that.ecart);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventaireLigne implements InventaireLigne {
  const _InventaireLigne({this.id, @JsonKey(name: 'inventaire_id') required this.inventaireId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @DecimalConverter()@JsonKey(name: 'quantite_theorique') required this.quantiteTheorique, @DecimalConverter()@JsonKey(name: 'quantite_comptee') this.quantiteComptee, @DecimalConverter() required this.ecart});
  factory _InventaireLigne.fromJson(Map<String, dynamic> json) => _$InventaireLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'inventaire_id') final  String inventaireId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@DecimalConverter()@JsonKey(name: 'quantite_theorique') final  Decimal quantiteTheorique;
@override@DecimalConverter()@JsonKey(name: 'quantite_comptee') final  Decimal? quantiteComptee;
@override@DecimalConverter() final  Decimal ecart;

/// Create a copy of InventaireLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventaireLigneCopyWith<_InventaireLigne> get copyWith => __$InventaireLigneCopyWithImpl<_InventaireLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventaireLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventaireLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.inventaireId, inventaireId) || other.inventaireId == inventaireId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantiteTheorique, quantiteTheorique) || other.quantiteTheorique == quantiteTheorique)&&(identical(other.quantiteComptee, quantiteComptee) || other.quantiteComptee == quantiteComptee)&&(identical(other.ecart, ecart) || other.ecart == ecart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,inventaireId,articleId,varianteId,quantiteTheorique,quantiteComptee,ecart);

@override
String toString() {
  return 'InventaireLigne(id: $id, inventaireId: $inventaireId, articleId: $articleId, varianteId: $varianteId, quantiteTheorique: $quantiteTheorique, quantiteComptee: $quantiteComptee, ecart: $ecart)';
}


}

/// @nodoc
abstract mixin class _$InventaireLigneCopyWith<$Res> implements $InventaireLigneCopyWith<$Res> {
  factory _$InventaireLigneCopyWith(_InventaireLigne value, $Res Function(_InventaireLigne) _then) = __$InventaireLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'inventaire_id') String inventaireId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter()@JsonKey(name: 'quantite_theorique') Decimal quantiteTheorique,@DecimalConverter()@JsonKey(name: 'quantite_comptee') Decimal? quantiteComptee,@DecimalConverter() Decimal ecart
});




}
/// @nodoc
class __$InventaireLigneCopyWithImpl<$Res>
    implements _$InventaireLigneCopyWith<$Res> {
  __$InventaireLigneCopyWithImpl(this._self, this._then);

  final _InventaireLigne _self;
  final $Res Function(_InventaireLigne) _then;

/// Create a copy of InventaireLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? inventaireId = null,Object? articleId = null,Object? varianteId = freezed,Object? quantiteTheorique = null,Object? quantiteComptee = freezed,Object? ecart = null,}) {
  return _then(_InventaireLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,inventaireId: null == inventaireId ? _self.inventaireId : inventaireId // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantiteTheorique: null == quantiteTheorique ? _self.quantiteTheorique : quantiteTheorique // ignore: cast_nullable_to_non_nullable
as Decimal,quantiteComptee: freezed == quantiteComptee ? _self.quantiteComptee : quantiteComptee // ignore: cast_nullable_to_non_nullable
as Decimal?,ecart: null == ecart ? _self.ecart : ecart // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}


}

// dart format on
