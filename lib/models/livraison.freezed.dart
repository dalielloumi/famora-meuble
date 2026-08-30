// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'livraison.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TourneeLivraison {

 String? get id; String? get numero;@JsonKey(name: 'date_tournee') DateTime get dateTournee; String? get chauffeur; String? get vehicule; StatutTournee get statut; String? get notes;
/// Create a copy of TourneeLivraison
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourneeLivraisonCopyWith<TourneeLivraison> get copyWith => _$TourneeLivraisonCopyWithImpl<TourneeLivraison>(this as TourneeLivraison, _$identity);

  /// Serializes this TourneeLivraison to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourneeLivraison&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.dateTournee, dateTournee) || other.dateTournee == dateTournee)&&(identical(other.chauffeur, chauffeur) || other.chauffeur == chauffeur)&&(identical(other.vehicule, vehicule) || other.vehicule == vehicule)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,dateTournee,chauffeur,vehicule,statut,notes);

@override
String toString() {
  return 'TourneeLivraison(id: $id, numero: $numero, dateTournee: $dateTournee, chauffeur: $chauffeur, vehicule: $vehicule, statut: $statut, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $TourneeLivraisonCopyWith<$Res>  {
  factory $TourneeLivraisonCopyWith(TourneeLivraison value, $Res Function(TourneeLivraison) _then) = _$TourneeLivraisonCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'date_tournee') DateTime dateTournee, String? chauffeur, String? vehicule, StatutTournee statut, String? notes
});




}
/// @nodoc
class _$TourneeLivraisonCopyWithImpl<$Res>
    implements $TourneeLivraisonCopyWith<$Res> {
  _$TourneeLivraisonCopyWithImpl(this._self, this._then);

  final TourneeLivraison _self;
  final $Res Function(TourneeLivraison) _then;

/// Create a copy of TourneeLivraison
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? dateTournee = null,Object? chauffeur = freezed,Object? vehicule = freezed,Object? statut = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,dateTournee: null == dateTournee ? _self.dateTournee : dateTournee // ignore: cast_nullable_to_non_nullable
as DateTime,chauffeur: freezed == chauffeur ? _self.chauffeur : chauffeur // ignore: cast_nullable_to_non_nullable
as String?,vehicule: freezed == vehicule ? _self.vehicule : vehicule // ignore: cast_nullable_to_non_nullable
as String?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutTournee,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TourneeLivraison].
extension TourneeLivraisonPatterns on TourneeLivraison {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourneeLivraison value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourneeLivraison() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourneeLivraison value)  $default,){
final _that = this;
switch (_that) {
case _TourneeLivraison():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourneeLivraison value)?  $default,){
final _that = this;
switch (_that) {
case _TourneeLivraison() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'date_tournee')  DateTime dateTournee,  String? chauffeur,  String? vehicule,  StatutTournee statut,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourneeLivraison() when $default != null:
return $default(_that.id,_that.numero,_that.dateTournee,_that.chauffeur,_that.vehicule,_that.statut,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'date_tournee')  DateTime dateTournee,  String? chauffeur,  String? vehicule,  StatutTournee statut,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _TourneeLivraison():
return $default(_that.id,_that.numero,_that.dateTournee,_that.chauffeur,_that.vehicule,_that.statut,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'date_tournee')  DateTime dateTournee,  String? chauffeur,  String? vehicule,  StatutTournee statut,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _TourneeLivraison() when $default != null:
return $default(_that.id,_that.numero,_that.dateTournee,_that.chauffeur,_that.vehicule,_that.statut,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourneeLivraison implements TourneeLivraison {
  const _TourneeLivraison({this.id, this.numero, @JsonKey(name: 'date_tournee') required this.dateTournee, this.chauffeur, this.vehicule, this.statut = StatutTournee.prevue, this.notes});
  factory _TourneeLivraison.fromJson(Map<String, dynamic> json) => _$TourneeLivraisonFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'date_tournee') final  DateTime dateTournee;
@override final  String? chauffeur;
@override final  String? vehicule;
@override@JsonKey() final  StatutTournee statut;
@override final  String? notes;

/// Create a copy of TourneeLivraison
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourneeLivraisonCopyWith<_TourneeLivraison> get copyWith => __$TourneeLivraisonCopyWithImpl<_TourneeLivraison>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourneeLivraisonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourneeLivraison&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.dateTournee, dateTournee) || other.dateTournee == dateTournee)&&(identical(other.chauffeur, chauffeur) || other.chauffeur == chauffeur)&&(identical(other.vehicule, vehicule) || other.vehicule == vehicule)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,dateTournee,chauffeur,vehicule,statut,notes);

@override
String toString() {
  return 'TourneeLivraison(id: $id, numero: $numero, dateTournee: $dateTournee, chauffeur: $chauffeur, vehicule: $vehicule, statut: $statut, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$TourneeLivraisonCopyWith<$Res> implements $TourneeLivraisonCopyWith<$Res> {
  factory _$TourneeLivraisonCopyWith(_TourneeLivraison value, $Res Function(_TourneeLivraison) _then) = __$TourneeLivraisonCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'date_tournee') DateTime dateTournee, String? chauffeur, String? vehicule, StatutTournee statut, String? notes
});




}
/// @nodoc
class __$TourneeLivraisonCopyWithImpl<$Res>
    implements _$TourneeLivraisonCopyWith<$Res> {
  __$TourneeLivraisonCopyWithImpl(this._self, this._then);

  final _TourneeLivraison _self;
  final $Res Function(_TourneeLivraison) _then;

/// Create a copy of TourneeLivraison
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? dateTournee = null,Object? chauffeur = freezed,Object? vehicule = freezed,Object? statut = null,Object? notes = freezed,}) {
  return _then(_TourneeLivraison(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,dateTournee: null == dateTournee ? _self.dateTournee : dateTournee // ignore: cast_nullable_to_non_nullable
as DateTime,chauffeur: freezed == chauffeur ? _self.chauffeur : chauffeur // ignore: cast_nullable_to_non_nullable
as String?,vehicule: freezed == vehicule ? _self.vehicule : vehicule // ignore: cast_nullable_to_non_nullable
as String?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutTournee,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TourneeLivraisonLigne {

 String? get id;@JsonKey(name: 'tournee_id') String get tourneeId;@JsonKey(name: 'bl_id') String get blId; int get ordre; StatutLivraisonLigne get statut; String? get commentaire;
/// Create a copy of TourneeLivraisonLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TourneeLivraisonLigneCopyWith<TourneeLivraisonLigne> get copyWith => _$TourneeLivraisonLigneCopyWithImpl<TourneeLivraisonLigne>(this as TourneeLivraisonLigne, _$identity);

  /// Serializes this TourneeLivraisonLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TourneeLivraisonLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.tourneeId, tourneeId) || other.tourneeId == tourneeId)&&(identical(other.blId, blId) || other.blId == blId)&&(identical(other.ordre, ordre) || other.ordre == ordre)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.commentaire, commentaire) || other.commentaire == commentaire));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourneeId,blId,ordre,statut,commentaire);

@override
String toString() {
  return 'TourneeLivraisonLigne(id: $id, tourneeId: $tourneeId, blId: $blId, ordre: $ordre, statut: $statut, commentaire: $commentaire)';
}


}

/// @nodoc
abstract mixin class $TourneeLivraisonLigneCopyWith<$Res>  {
  factory $TourneeLivraisonLigneCopyWith(TourneeLivraisonLigne value, $Res Function(TourneeLivraisonLigne) _then) = _$TourneeLivraisonLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'tournee_id') String tourneeId,@JsonKey(name: 'bl_id') String blId, int ordre, StatutLivraisonLigne statut, String? commentaire
});




}
/// @nodoc
class _$TourneeLivraisonLigneCopyWithImpl<$Res>
    implements $TourneeLivraisonLigneCopyWith<$Res> {
  _$TourneeLivraisonLigneCopyWithImpl(this._self, this._then);

  final TourneeLivraisonLigne _self;
  final $Res Function(TourneeLivraisonLigne) _then;

/// Create a copy of TourneeLivraisonLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tourneeId = null,Object? blId = null,Object? ordre = null,Object? statut = null,Object? commentaire = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourneeId: null == tourneeId ? _self.tourneeId : tourneeId // ignore: cast_nullable_to_non_nullable
as String,blId: null == blId ? _self.blId : blId // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutLivraisonLigne,commentaire: freezed == commentaire ? _self.commentaire : commentaire // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TourneeLivraisonLigne].
extension TourneeLivraisonLignePatterns on TourneeLivraisonLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TourneeLivraisonLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TourneeLivraisonLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TourneeLivraisonLigne value)  $default,){
final _that = this;
switch (_that) {
case _TourneeLivraisonLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TourneeLivraisonLigne value)?  $default,){
final _that = this;
switch (_that) {
case _TourneeLivraisonLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tournee_id')  String tourneeId, @JsonKey(name: 'bl_id')  String blId,  int ordre,  StatutLivraisonLigne statut,  String? commentaire)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TourneeLivraisonLigne() when $default != null:
return $default(_that.id,_that.tourneeId,_that.blId,_that.ordre,_that.statut,_that.commentaire);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'tournee_id')  String tourneeId, @JsonKey(name: 'bl_id')  String blId,  int ordre,  StatutLivraisonLigne statut,  String? commentaire)  $default,) {final _that = this;
switch (_that) {
case _TourneeLivraisonLigne():
return $default(_that.id,_that.tourneeId,_that.blId,_that.ordre,_that.statut,_that.commentaire);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'tournee_id')  String tourneeId, @JsonKey(name: 'bl_id')  String blId,  int ordre,  StatutLivraisonLigne statut,  String? commentaire)?  $default,) {final _that = this;
switch (_that) {
case _TourneeLivraisonLigne() when $default != null:
return $default(_that.id,_that.tourneeId,_that.blId,_that.ordre,_that.statut,_that.commentaire);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TourneeLivraisonLigne implements TourneeLivraisonLigne {
  const _TourneeLivraisonLigne({this.id, @JsonKey(name: 'tournee_id') required this.tourneeId, @JsonKey(name: 'bl_id') required this.blId, this.ordre = 0, this.statut = StatutLivraisonLigne.prevue, this.commentaire});
  factory _TourneeLivraisonLigne.fromJson(Map<String, dynamic> json) => _$TourneeLivraisonLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'tournee_id') final  String tourneeId;
@override@JsonKey(name: 'bl_id') final  String blId;
@override@JsonKey() final  int ordre;
@override@JsonKey() final  StatutLivraisonLigne statut;
@override final  String? commentaire;

/// Create a copy of TourneeLivraisonLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TourneeLivraisonLigneCopyWith<_TourneeLivraisonLigne> get copyWith => __$TourneeLivraisonLigneCopyWithImpl<_TourneeLivraisonLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TourneeLivraisonLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TourneeLivraisonLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.tourneeId, tourneeId) || other.tourneeId == tourneeId)&&(identical(other.blId, blId) || other.blId == blId)&&(identical(other.ordre, ordre) || other.ordre == ordre)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.commentaire, commentaire) || other.commentaire == commentaire));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tourneeId,blId,ordre,statut,commentaire);

@override
String toString() {
  return 'TourneeLivraisonLigne(id: $id, tourneeId: $tourneeId, blId: $blId, ordre: $ordre, statut: $statut, commentaire: $commentaire)';
}


}

/// @nodoc
abstract mixin class _$TourneeLivraisonLigneCopyWith<$Res> implements $TourneeLivraisonLigneCopyWith<$Res> {
  factory _$TourneeLivraisonLigneCopyWith(_TourneeLivraisonLigne value, $Res Function(_TourneeLivraisonLigne) _then) = __$TourneeLivraisonLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'tournee_id') String tourneeId,@JsonKey(name: 'bl_id') String blId, int ordre, StatutLivraisonLigne statut, String? commentaire
});




}
/// @nodoc
class __$TourneeLivraisonLigneCopyWithImpl<$Res>
    implements _$TourneeLivraisonLigneCopyWith<$Res> {
  __$TourneeLivraisonLigneCopyWithImpl(this._self, this._then);

  final _TourneeLivraisonLigne _self;
  final $Res Function(_TourneeLivraisonLigne) _then;

/// Create a copy of TourneeLivraisonLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tourneeId = null,Object? blId = null,Object? ordre = null,Object? statut = null,Object? commentaire = freezed,}) {
  return _then(_TourneeLivraisonLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,tourneeId: null == tourneeId ? _self.tourneeId : tourneeId // ignore: cast_nullable_to_non_nullable
as String,blId: null == blId ? _self.blId : blId // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutLivraisonLigne,commentaire: freezed == commentaire ? _self.commentaire : commentaire // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
