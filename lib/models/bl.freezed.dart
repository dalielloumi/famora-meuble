// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bl {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'client_id') String get clientId;@JsonKey(name: 'commande_client_id') String? get commandeClientId;@JsonKey(name: 'depot_id') String get depotId;@JsonKey(name: 'date_bl') DateTime get dateBl;@JsonKey(name: 'adresse_livraison') String? get adresseLivraison; StatutDocument get statut; String? get notes;
/// Create a copy of Bl
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlCopyWith<Bl> get copyWith => _$BlCopyWithImpl<Bl>(this as Bl, _$identity);

  /// Serializes this Bl to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bl&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.commandeClientId, commandeClientId) || other.commandeClientId == commandeClientId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.dateBl, dateBl) || other.dateBl == dateBl)&&(identical(other.adresseLivraison, adresseLivraison) || other.adresseLivraison == adresseLivraison)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,clientId,commandeClientId,depotId,dateBl,adresseLivraison,statut,notes);

@override
String toString() {
  return 'Bl(id: $id, numero: $numero, exerciceId: $exerciceId, clientId: $clientId, commandeClientId: $commandeClientId, depotId: $depotId, dateBl: $dateBl, adresseLivraison: $adresseLivraison, statut: $statut, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $BlCopyWith<$Res>  {
  factory $BlCopyWith(Bl value, $Res Function(Bl) _then) = _$BlCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'commande_client_id') String? commandeClientId,@JsonKey(name: 'depot_id') String depotId,@JsonKey(name: 'date_bl') DateTime dateBl,@JsonKey(name: 'adresse_livraison') String? adresseLivraison, StatutDocument statut, String? notes
});




}
/// @nodoc
class _$BlCopyWithImpl<$Res>
    implements $BlCopyWith<$Res> {
  _$BlCopyWithImpl(this._self, this._then);

  final Bl _self;
  final $Res Function(Bl) _then;

/// Create a copy of Bl
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? clientId = null,Object? commandeClientId = freezed,Object? depotId = null,Object? dateBl = null,Object? adresseLivraison = freezed,Object? statut = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,commandeClientId: freezed == commandeClientId ? _self.commandeClientId : commandeClientId // ignore: cast_nullable_to_non_nullable
as String?,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,dateBl: null == dateBl ? _self.dateBl : dateBl // ignore: cast_nullable_to_non_nullable
as DateTime,adresseLivraison: freezed == adresseLivraison ? _self.adresseLivraison : adresseLivraison // ignore: cast_nullable_to_non_nullable
as String?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Bl].
extension BlPatterns on Bl {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bl value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bl() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bl value)  $default,){
final _that = this;
switch (_that) {
case _Bl():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bl value)?  $default,){
final _that = this;
switch (_that) {
case _Bl() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'commande_client_id')  String? commandeClientId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_bl')  DateTime dateBl, @JsonKey(name: 'adresse_livraison')  String? adresseLivraison,  StatutDocument statut,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bl() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.commandeClientId,_that.depotId,_that.dateBl,_that.adresseLivraison,_that.statut,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'commande_client_id')  String? commandeClientId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_bl')  DateTime dateBl, @JsonKey(name: 'adresse_livraison')  String? adresseLivraison,  StatutDocument statut,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Bl():
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.commandeClientId,_that.depotId,_that.dateBl,_that.adresseLivraison,_that.statut,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'commande_client_id')  String? commandeClientId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_bl')  DateTime dateBl, @JsonKey(name: 'adresse_livraison')  String? adresseLivraison,  StatutDocument statut,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Bl() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.commandeClientId,_that.depotId,_that.dateBl,_that.adresseLivraison,_that.statut,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Bl implements Bl {
  const _Bl({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'client_id') required this.clientId, @JsonKey(name: 'commande_client_id') this.commandeClientId, @JsonKey(name: 'depot_id') required this.depotId, @JsonKey(name: 'date_bl') required this.dateBl, @JsonKey(name: 'adresse_livraison') this.adresseLivraison, this.statut = StatutDocument.brouillon, this.notes});
  factory _Bl.fromJson(Map<String, dynamic> json) => _$BlFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'client_id') final  String clientId;
@override@JsonKey(name: 'commande_client_id') final  String? commandeClientId;
@override@JsonKey(name: 'depot_id') final  String depotId;
@override@JsonKey(name: 'date_bl') final  DateTime dateBl;
@override@JsonKey(name: 'adresse_livraison') final  String? adresseLivraison;
@override@JsonKey() final  StatutDocument statut;
@override final  String? notes;

/// Create a copy of Bl
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlCopyWith<_Bl> get copyWith => __$BlCopyWithImpl<_Bl>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bl&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.commandeClientId, commandeClientId) || other.commandeClientId == commandeClientId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.dateBl, dateBl) || other.dateBl == dateBl)&&(identical(other.adresseLivraison, adresseLivraison) || other.adresseLivraison == adresseLivraison)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,clientId,commandeClientId,depotId,dateBl,adresseLivraison,statut,notes);

@override
String toString() {
  return 'Bl(id: $id, numero: $numero, exerciceId: $exerciceId, clientId: $clientId, commandeClientId: $commandeClientId, depotId: $depotId, dateBl: $dateBl, adresseLivraison: $adresseLivraison, statut: $statut, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$BlCopyWith<$Res> implements $BlCopyWith<$Res> {
  factory _$BlCopyWith(_Bl value, $Res Function(_Bl) _then) = __$BlCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'commande_client_id') String? commandeClientId,@JsonKey(name: 'depot_id') String depotId,@JsonKey(name: 'date_bl') DateTime dateBl,@JsonKey(name: 'adresse_livraison') String? adresseLivraison, StatutDocument statut, String? notes
});




}
/// @nodoc
class __$BlCopyWithImpl<$Res>
    implements _$BlCopyWith<$Res> {
  __$BlCopyWithImpl(this._self, this._then);

  final _Bl _self;
  final $Res Function(_Bl) _then;

/// Create a copy of Bl
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? clientId = null,Object? commandeClientId = freezed,Object? depotId = null,Object? dateBl = null,Object? adresseLivraison = freezed,Object? statut = null,Object? notes = freezed,}) {
  return _then(_Bl(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,commandeClientId: freezed == commandeClientId ? _self.commandeClientId : commandeClientId // ignore: cast_nullable_to_non_nullable
as String?,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,dateBl: null == dateBl ? _self.dateBl : dateBl // ignore: cast_nullable_to_non_nullable
as DateTime,adresseLivraison: freezed == adresseLivraison ? _self.adresseLivraison : adresseLivraison // ignore: cast_nullable_to_non_nullable
as String?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BlLigne {

 String? get id;@JsonKey(name: 'bl_id') String get blId;@JsonKey(name: 'commande_ligne_id') String? get commandeLigneId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@DecimalConverter() Decimal get quantite;@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal get prixUnitaire;@JsonKey(name: 'taux_tva_id') String get tauxTvaId; int get ordre;
/// Create a copy of BlLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlLigneCopyWith<BlLigne> get copyWith => _$BlLigneCopyWithImpl<BlLigne>(this as BlLigne, _$identity);

  /// Serializes this BlLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.blId, blId) || other.blId == blId)&&(identical(other.commandeLigneId, commandeLigneId) || other.commandeLigneId == commandeLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,blId,commandeLigneId,articleId,varianteId,quantite,prixUnitaire,tauxTvaId,ordre);

@override
String toString() {
  return 'BlLigne(id: $id, blId: $blId, commandeLigneId: $commandeLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class $BlLigneCopyWith<$Res>  {
  factory $BlLigneCopyWith(BlLigne value, $Res Function(BlLigne) _then) = _$BlLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'bl_id') String blId,@JsonKey(name: 'commande_ligne_id') String? commandeLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class _$BlLigneCopyWithImpl<$Res>
    implements $BlLigneCopyWith<$Res> {
  _$BlLigneCopyWithImpl(this._self, this._then);

  final BlLigne _self;
  final $Res Function(BlLigne) _then;

/// Create a copy of BlLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? blId = null,Object? commandeLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,blId: null == blId ? _self.blId : blId // ignore: cast_nullable_to_non_nullable
as String,commandeLigneId: freezed == commandeLigneId ? _self.commandeLigneId : commandeLigneId // ignore: cast_nullable_to_non_nullable
as String?,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BlLigne].
extension BlLignePatterns on BlLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlLigne value)  $default,){
final _that = this;
switch (_that) {
case _BlLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlLigne value)?  $default,){
final _that = this;
switch (_that) {
case _BlLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'bl_id')  String blId, @JsonKey(name: 'commande_ligne_id')  String? commandeLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlLigne() when $default != null:
return $default(_that.id,_that.blId,_that.commandeLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.tauxTvaId,_that.ordre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'bl_id')  String blId, @JsonKey(name: 'commande_ligne_id')  String? commandeLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)  $default,) {final _that = this;
switch (_that) {
case _BlLigne():
return $default(_that.id,_that.blId,_that.commandeLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.tauxTvaId,_that.ordre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'bl_id')  String blId, @JsonKey(name: 'commande_ligne_id')  String? commandeLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)?  $default,) {final _that = this;
switch (_that) {
case _BlLigne() when $default != null:
return $default(_that.id,_that.blId,_that.commandeLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.tauxTvaId,_that.ordre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BlLigne implements BlLigne {
  const _BlLigne({this.id, @JsonKey(name: 'bl_id') required this.blId, @JsonKey(name: 'commande_ligne_id') this.commandeLigneId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @DecimalConverter() required this.quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire') required this.prixUnitaire, @JsonKey(name: 'taux_tva_id') required this.tauxTvaId, this.ordre = 0});
  factory _BlLigne.fromJson(Map<String, dynamic> json) => _$BlLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'bl_id') final  String blId;
@override@JsonKey(name: 'commande_ligne_id') final  String? commandeLigneId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter()@JsonKey(name: 'prix_unitaire') final  Decimal prixUnitaire;
@override@JsonKey(name: 'taux_tva_id') final  String tauxTvaId;
@override@JsonKey() final  int ordre;

/// Create a copy of BlLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlLigneCopyWith<_BlLigne> get copyWith => __$BlLigneCopyWithImpl<_BlLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.blId, blId) || other.blId == blId)&&(identical(other.commandeLigneId, commandeLigneId) || other.commandeLigneId == commandeLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,blId,commandeLigneId,articleId,varianteId,quantite,prixUnitaire,tauxTvaId,ordre);

@override
String toString() {
  return 'BlLigne(id: $id, blId: $blId, commandeLigneId: $commandeLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class _$BlLigneCopyWith<$Res> implements $BlLigneCopyWith<$Res> {
  factory _$BlLigneCopyWith(_BlLigne value, $Res Function(_BlLigne) _then) = __$BlLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'bl_id') String blId,@JsonKey(name: 'commande_ligne_id') String? commandeLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class __$BlLigneCopyWithImpl<$Res>
    implements _$BlLigneCopyWith<$Res> {
  __$BlLigneCopyWithImpl(this._self, this._then);

  final _BlLigne _self;
  final $Res Function(_BlLigne) _then;

/// Create a copy of BlLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? blId = null,Object? commandeLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_BlLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,blId: null == blId ? _self.blId : blId // ignore: cast_nullable_to_non_nullable
as String,commandeLigneId: freezed == commandeLigneId ? _self.commandeLigneId : commandeLigneId // ignore: cast_nullable_to_non_nullable
as String?,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
