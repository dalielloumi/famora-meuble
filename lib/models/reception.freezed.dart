// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reception {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'commande_fournisseur_id') String? get commandeFournisseurId;@JsonKey(name: 'fournisseur_id') String get fournisseurId;@JsonKey(name: 'depot_id') String get depotId;@JsonKey(name: 'date_reception') DateTime get dateReception; StatutDocument get statut; String? get notes;
/// Create a copy of Reception
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceptionCopyWith<Reception> get copyWith => _$ReceptionCopyWithImpl<Reception>(this as Reception, _$identity);

  /// Serializes this Reception to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reception&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.commandeFournisseurId, commandeFournisseurId) || other.commandeFournisseurId == commandeFournisseurId)&&(identical(other.fournisseurId, fournisseurId) || other.fournisseurId == fournisseurId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.dateReception, dateReception) || other.dateReception == dateReception)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,commandeFournisseurId,fournisseurId,depotId,dateReception,statut,notes);

@override
String toString() {
  return 'Reception(id: $id, numero: $numero, exerciceId: $exerciceId, commandeFournisseurId: $commandeFournisseurId, fournisseurId: $fournisseurId, depotId: $depotId, dateReception: $dateReception, statut: $statut, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $ReceptionCopyWith<$Res>  {
  factory $ReceptionCopyWith(Reception value, $Res Function(Reception) _then) = _$ReceptionCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'commande_fournisseur_id') String? commandeFournisseurId,@JsonKey(name: 'fournisseur_id') String fournisseurId,@JsonKey(name: 'depot_id') String depotId,@JsonKey(name: 'date_reception') DateTime dateReception, StatutDocument statut, String? notes
});




}
/// @nodoc
class _$ReceptionCopyWithImpl<$Res>
    implements $ReceptionCopyWith<$Res> {
  _$ReceptionCopyWithImpl(this._self, this._then);

  final Reception _self;
  final $Res Function(Reception) _then;

/// Create a copy of Reception
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? commandeFournisseurId = freezed,Object? fournisseurId = null,Object? depotId = null,Object? dateReception = null,Object? statut = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,commandeFournisseurId: freezed == commandeFournisseurId ? _self.commandeFournisseurId : commandeFournisseurId // ignore: cast_nullable_to_non_nullable
as String?,fournisseurId: null == fournisseurId ? _self.fournisseurId : fournisseurId // ignore: cast_nullable_to_non_nullable
as String,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,dateReception: null == dateReception ? _self.dateReception : dateReception // ignore: cast_nullable_to_non_nullable
as DateTime,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Reception].
extension ReceptionPatterns on Reception {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reception value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reception() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reception value)  $default,){
final _that = this;
switch (_that) {
case _Reception():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reception value)?  $default,){
final _that = this;
switch (_that) {
case _Reception() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'commande_fournisseur_id')  String? commandeFournisseurId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_reception')  DateTime dateReception,  StatutDocument statut,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reception() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.commandeFournisseurId,_that.fournisseurId,_that.depotId,_that.dateReception,_that.statut,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'commande_fournisseur_id')  String? commandeFournisseurId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_reception')  DateTime dateReception,  StatutDocument statut,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Reception():
return $default(_that.id,_that.numero,_that.exerciceId,_that.commandeFournisseurId,_that.fournisseurId,_that.depotId,_that.dateReception,_that.statut,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'commande_fournisseur_id')  String? commandeFournisseurId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_reception')  DateTime dateReception,  StatutDocument statut,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Reception() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.commandeFournisseurId,_that.fournisseurId,_that.depotId,_that.dateReception,_that.statut,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reception implements Reception {
  const _Reception({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'commande_fournisseur_id') this.commandeFournisseurId, @JsonKey(name: 'fournisseur_id') required this.fournisseurId, @JsonKey(name: 'depot_id') required this.depotId, @JsonKey(name: 'date_reception') required this.dateReception, this.statut = StatutDocument.brouillon, this.notes});
  factory _Reception.fromJson(Map<String, dynamic> json) => _$ReceptionFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'commande_fournisseur_id') final  String? commandeFournisseurId;
@override@JsonKey(name: 'fournisseur_id') final  String fournisseurId;
@override@JsonKey(name: 'depot_id') final  String depotId;
@override@JsonKey(name: 'date_reception') final  DateTime dateReception;
@override@JsonKey() final  StatutDocument statut;
@override final  String? notes;

/// Create a copy of Reception
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceptionCopyWith<_Reception> get copyWith => __$ReceptionCopyWithImpl<_Reception>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reception&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.commandeFournisseurId, commandeFournisseurId) || other.commandeFournisseurId == commandeFournisseurId)&&(identical(other.fournisseurId, fournisseurId) || other.fournisseurId == fournisseurId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.dateReception, dateReception) || other.dateReception == dateReception)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,commandeFournisseurId,fournisseurId,depotId,dateReception,statut,notes);

@override
String toString() {
  return 'Reception(id: $id, numero: $numero, exerciceId: $exerciceId, commandeFournisseurId: $commandeFournisseurId, fournisseurId: $fournisseurId, depotId: $depotId, dateReception: $dateReception, statut: $statut, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ReceptionCopyWith<$Res> implements $ReceptionCopyWith<$Res> {
  factory _$ReceptionCopyWith(_Reception value, $Res Function(_Reception) _then) = __$ReceptionCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'commande_fournisseur_id') String? commandeFournisseurId,@JsonKey(name: 'fournisseur_id') String fournisseurId,@JsonKey(name: 'depot_id') String depotId,@JsonKey(name: 'date_reception') DateTime dateReception, StatutDocument statut, String? notes
});




}
/// @nodoc
class __$ReceptionCopyWithImpl<$Res>
    implements _$ReceptionCopyWith<$Res> {
  __$ReceptionCopyWithImpl(this._self, this._then);

  final _Reception _self;
  final $Res Function(_Reception) _then;

/// Create a copy of Reception
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? commandeFournisseurId = freezed,Object? fournisseurId = null,Object? depotId = null,Object? dateReception = null,Object? statut = null,Object? notes = freezed,}) {
  return _then(_Reception(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,commandeFournisseurId: freezed == commandeFournisseurId ? _self.commandeFournisseurId : commandeFournisseurId // ignore: cast_nullable_to_non_nullable
as String?,fournisseurId: null == fournisseurId ? _self.fournisseurId : fournisseurId // ignore: cast_nullable_to_non_nullable
as String,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,dateReception: null == dateReception ? _self.dateReception : dateReception // ignore: cast_nullable_to_non_nullable
as DateTime,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ReceptionLigne {

 String? get id;@JsonKey(name: 'reception_id') String get receptionId;@JsonKey(name: 'commande_ligne_id') String? get commandeLigneId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@DecimalConverter() Decimal get quantite;@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal get prixUnitaire; int get ordre;
/// Create a copy of ReceptionLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceptionLigneCopyWith<ReceptionLigne> get copyWith => _$ReceptionLigneCopyWithImpl<ReceptionLigne>(this as ReceptionLigne, _$identity);

  /// Serializes this ReceptionLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceptionLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.receptionId, receptionId) || other.receptionId == receptionId)&&(identical(other.commandeLigneId, commandeLigneId) || other.commandeLigneId == commandeLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,receptionId,commandeLigneId,articleId,varianteId,quantite,prixUnitaire,ordre);

@override
String toString() {
  return 'ReceptionLigne(id: $id, receptionId: $receptionId, commandeLigneId: $commandeLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class $ReceptionLigneCopyWith<$Res>  {
  factory $ReceptionLigneCopyWith(ReceptionLigne value, $Res Function(ReceptionLigne) _then) = _$ReceptionLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'reception_id') String receptionId,@JsonKey(name: 'commande_ligne_id') String? commandeLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire, int ordre
});




}
/// @nodoc
class _$ReceptionLigneCopyWithImpl<$Res>
    implements $ReceptionLigneCopyWith<$Res> {
  _$ReceptionLigneCopyWithImpl(this._self, this._then);

  final ReceptionLigne _self;
  final $Res Function(ReceptionLigne) _then;

/// Create a copy of ReceptionLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? receptionId = null,Object? commandeLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? ordre = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,receptionId: null == receptionId ? _self.receptionId : receptionId // ignore: cast_nullable_to_non_nullable
as String,commandeLigneId: freezed == commandeLigneId ? _self.commandeLigneId : commandeLigneId // ignore: cast_nullable_to_non_nullable
as String?,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReceptionLigne].
extension ReceptionLignePatterns on ReceptionLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReceptionLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReceptionLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReceptionLigne value)  $default,){
final _that = this;
switch (_that) {
case _ReceptionLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReceptionLigne value)?  $default,){
final _that = this;
switch (_that) {
case _ReceptionLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'reception_id')  String receptionId, @JsonKey(name: 'commande_ligne_id')  String? commandeLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire,  int ordre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReceptionLigne() when $default != null:
return $default(_that.id,_that.receptionId,_that.commandeLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.ordre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'reception_id')  String receptionId, @JsonKey(name: 'commande_ligne_id')  String? commandeLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire,  int ordre)  $default,) {final _that = this;
switch (_that) {
case _ReceptionLigne():
return $default(_that.id,_that.receptionId,_that.commandeLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.ordre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'reception_id')  String receptionId, @JsonKey(name: 'commande_ligne_id')  String? commandeLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire,  int ordre)?  $default,) {final _that = this;
switch (_that) {
case _ReceptionLigne() when $default != null:
return $default(_that.id,_that.receptionId,_that.commandeLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.ordre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReceptionLigne implements ReceptionLigne {
  const _ReceptionLigne({this.id, @JsonKey(name: 'reception_id') required this.receptionId, @JsonKey(name: 'commande_ligne_id') this.commandeLigneId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @DecimalConverter() required this.quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire') required this.prixUnitaire, this.ordre = 0});
  factory _ReceptionLigne.fromJson(Map<String, dynamic> json) => _$ReceptionLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'reception_id') final  String receptionId;
@override@JsonKey(name: 'commande_ligne_id') final  String? commandeLigneId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter()@JsonKey(name: 'prix_unitaire') final  Decimal prixUnitaire;
@override@JsonKey() final  int ordre;

/// Create a copy of ReceptionLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceptionLigneCopyWith<_ReceptionLigne> get copyWith => __$ReceptionLigneCopyWithImpl<_ReceptionLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceptionLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceptionLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.receptionId, receptionId) || other.receptionId == receptionId)&&(identical(other.commandeLigneId, commandeLigneId) || other.commandeLigneId == commandeLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,receptionId,commandeLigneId,articleId,varianteId,quantite,prixUnitaire,ordre);

@override
String toString() {
  return 'ReceptionLigne(id: $id, receptionId: $receptionId, commandeLigneId: $commandeLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class _$ReceptionLigneCopyWith<$Res> implements $ReceptionLigneCopyWith<$Res> {
  factory _$ReceptionLigneCopyWith(_ReceptionLigne value, $Res Function(_ReceptionLigne) _then) = __$ReceptionLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'reception_id') String receptionId,@JsonKey(name: 'commande_ligne_id') String? commandeLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire, int ordre
});




}
/// @nodoc
class __$ReceptionLigneCopyWithImpl<$Res>
    implements _$ReceptionLigneCopyWith<$Res> {
  __$ReceptionLigneCopyWithImpl(this._self, this._then);

  final _ReceptionLigne _self;
  final $Res Function(_ReceptionLigne) _then;

/// Create a copy of ReceptionLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? receptionId = null,Object? commandeLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? ordre = null,}) {
  return _then(_ReceptionLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,receptionId: null == receptionId ? _self.receptionId : receptionId // ignore: cast_nullable_to_non_nullable
as String,commandeLigneId: freezed == commandeLigneId ? _self.commandeLigneId : commandeLigneId // ignore: cast_nullable_to_non_nullable
as String?,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
