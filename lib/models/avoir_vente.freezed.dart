// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avoir_vente.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvoirVente {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'client_id') String get clientId;@JsonKey(name: 'facture_vente_id') String get factureVenteId; String get motif;@JsonKey(name: 'date_avoir') DateTime get dateAvoir; StatutDocument get statut;@DecimalConverter()@JsonKey(name: 'total_ht') Decimal get totalHt;@DecimalConverter() Decimal get fodec;@DecimalConverter()@JsonKey(name: 'total_tva') Decimal get totalTva;@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal get totalTtc;
/// Create a copy of AvoirVente
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvoirVenteCopyWith<AvoirVente> get copyWith => _$AvoirVenteCopyWithImpl<AvoirVente>(this as AvoirVente, _$identity);

  /// Serializes this AvoirVente to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvoirVente&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.factureVenteId, factureVenteId) || other.factureVenteId == factureVenteId)&&(identical(other.motif, motif) || other.motif == motif)&&(identical(other.dateAvoir, dateAvoir) || other.dateAvoir == dateAvoir)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.fodec, fodec) || other.fodec == fodec)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,clientId,factureVenteId,motif,dateAvoir,statut,totalHt,fodec,totalTva,totalTtc);

@override
String toString() {
  return 'AvoirVente(id: $id, numero: $numero, exerciceId: $exerciceId, clientId: $clientId, factureVenteId: $factureVenteId, motif: $motif, dateAvoir: $dateAvoir, statut: $statut, totalHt: $totalHt, fodec: $fodec, totalTva: $totalTva, totalTtc: $totalTtc)';
}


}

/// @nodoc
abstract mixin class $AvoirVenteCopyWith<$Res>  {
  factory $AvoirVenteCopyWith(AvoirVente value, $Res Function(AvoirVente) _then) = _$AvoirVenteCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'facture_vente_id') String factureVenteId, String motif,@JsonKey(name: 'date_avoir') DateTime dateAvoir, StatutDocument statut,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter() Decimal fodec,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc
});




}
/// @nodoc
class _$AvoirVenteCopyWithImpl<$Res>
    implements $AvoirVenteCopyWith<$Res> {
  _$AvoirVenteCopyWithImpl(this._self, this._then);

  final AvoirVente _self;
  final $Res Function(AvoirVente) _then;

/// Create a copy of AvoirVente
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? clientId = null,Object? factureVenteId = null,Object? motif = null,Object? dateAvoir = null,Object? statut = null,Object? totalHt = null,Object? fodec = null,Object? totalTva = null,Object? totalTtc = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,factureVenteId: null == factureVenteId ? _self.factureVenteId : factureVenteId // ignore: cast_nullable_to_non_nullable
as String,motif: null == motif ? _self.motif : motif // ignore: cast_nullable_to_non_nullable
as String,dateAvoir: null == dateAvoir ? _self.dateAvoir : dateAvoir // ignore: cast_nullable_to_non_nullable
as DateTime,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,fodec: null == fodec ? _self.fodec : fodec // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}

}


/// Adds pattern-matching-related methods to [AvoirVente].
extension AvoirVentePatterns on AvoirVente {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvoirVente value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvoirVente() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvoirVente value)  $default,){
final _that = this;
switch (_that) {
case _AvoirVente():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvoirVente value)?  $default,){
final _that = this;
switch (_that) {
case _AvoirVente() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'facture_vente_id')  String factureVenteId,  String motif, @JsonKey(name: 'date_avoir')  DateTime dateAvoir,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvoirVente() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.factureVenteId,_that.motif,_that.dateAvoir,_that.statut,_that.totalHt,_that.fodec,_that.totalTva,_that.totalTtc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'facture_vente_id')  String factureVenteId,  String motif, @JsonKey(name: 'date_avoir')  DateTime dateAvoir,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc)  $default,) {final _that = this;
switch (_that) {
case _AvoirVente():
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.factureVenteId,_that.motif,_that.dateAvoir,_that.statut,_that.totalHt,_that.fodec,_that.totalTva,_that.totalTtc);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'facture_vente_id')  String factureVenteId,  String motif, @JsonKey(name: 'date_avoir')  DateTime dateAvoir,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc)?  $default,) {final _that = this;
switch (_that) {
case _AvoirVente() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.factureVenteId,_that.motif,_that.dateAvoir,_that.statut,_that.totalHt,_that.fodec,_that.totalTva,_that.totalTtc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvoirVente implements AvoirVente {
  const _AvoirVente({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'client_id') required this.clientId, @JsonKey(name: 'facture_vente_id') required this.factureVenteId, required this.motif, @JsonKey(name: 'date_avoir') required this.dateAvoir, this.statut = StatutDocument.brouillon, @DecimalConverter()@JsonKey(name: 'total_ht') required this.totalHt, @DecimalConverter() required this.fodec, @DecimalConverter()@JsonKey(name: 'total_tva') required this.totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc') required this.totalTtc});
  factory _AvoirVente.fromJson(Map<String, dynamic> json) => _$AvoirVenteFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'client_id') final  String clientId;
@override@JsonKey(name: 'facture_vente_id') final  String factureVenteId;
@override final  String motif;
@override@JsonKey(name: 'date_avoir') final  DateTime dateAvoir;
@override@JsonKey() final  StatutDocument statut;
@override@DecimalConverter()@JsonKey(name: 'total_ht') final  Decimal totalHt;
@override@DecimalConverter() final  Decimal fodec;
@override@DecimalConverter()@JsonKey(name: 'total_tva') final  Decimal totalTva;
@override@DecimalConverter()@JsonKey(name: 'total_ttc') final  Decimal totalTtc;

/// Create a copy of AvoirVente
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvoirVenteCopyWith<_AvoirVente> get copyWith => __$AvoirVenteCopyWithImpl<_AvoirVente>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvoirVenteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvoirVente&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.factureVenteId, factureVenteId) || other.factureVenteId == factureVenteId)&&(identical(other.motif, motif) || other.motif == motif)&&(identical(other.dateAvoir, dateAvoir) || other.dateAvoir == dateAvoir)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.fodec, fodec) || other.fodec == fodec)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,clientId,factureVenteId,motif,dateAvoir,statut,totalHt,fodec,totalTva,totalTtc);

@override
String toString() {
  return 'AvoirVente(id: $id, numero: $numero, exerciceId: $exerciceId, clientId: $clientId, factureVenteId: $factureVenteId, motif: $motif, dateAvoir: $dateAvoir, statut: $statut, totalHt: $totalHt, fodec: $fodec, totalTva: $totalTva, totalTtc: $totalTtc)';
}


}

/// @nodoc
abstract mixin class _$AvoirVenteCopyWith<$Res> implements $AvoirVenteCopyWith<$Res> {
  factory _$AvoirVenteCopyWith(_AvoirVente value, $Res Function(_AvoirVente) _then) = __$AvoirVenteCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'facture_vente_id') String factureVenteId, String motif,@JsonKey(name: 'date_avoir') DateTime dateAvoir, StatutDocument statut,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter() Decimal fodec,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc
});




}
/// @nodoc
class __$AvoirVenteCopyWithImpl<$Res>
    implements _$AvoirVenteCopyWith<$Res> {
  __$AvoirVenteCopyWithImpl(this._self, this._then);

  final _AvoirVente _self;
  final $Res Function(_AvoirVente) _then;

/// Create a copy of AvoirVente
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? clientId = null,Object? factureVenteId = null,Object? motif = null,Object? dateAvoir = null,Object? statut = null,Object? totalHt = null,Object? fodec = null,Object? totalTva = null,Object? totalTtc = null,}) {
  return _then(_AvoirVente(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,factureVenteId: null == factureVenteId ? _self.factureVenteId : factureVenteId // ignore: cast_nullable_to_non_nullable
as String,motif: null == motif ? _self.motif : motif // ignore: cast_nullable_to_non_nullable
as String,dateAvoir: null == dateAvoir ? _self.dateAvoir : dateAvoir // ignore: cast_nullable_to_non_nullable
as DateTime,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,fodec: null == fodec ? _self.fodec : fodec // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}


}


/// @nodoc
mixin _$AvoirVenteLigne {

 String? get id;@JsonKey(name: 'avoir_id') String get avoirId;@JsonKey(name: 'facture_ligne_id') String? get factureLigneId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@DecimalConverter() Decimal get quantite;@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal get prixUnitaire;@JsonKey(name: 'taux_tva_id') String get tauxTvaId; int get ordre;
/// Create a copy of AvoirVenteLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvoirVenteLigneCopyWith<AvoirVenteLigne> get copyWith => _$AvoirVenteLigneCopyWithImpl<AvoirVenteLigne>(this as AvoirVenteLigne, _$identity);

  /// Serializes this AvoirVenteLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvoirVenteLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.avoirId, avoirId) || other.avoirId == avoirId)&&(identical(other.factureLigneId, factureLigneId) || other.factureLigneId == factureLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avoirId,factureLigneId,articleId,varianteId,quantite,prixUnitaire,tauxTvaId,ordre);

@override
String toString() {
  return 'AvoirVenteLigne(id: $id, avoirId: $avoirId, factureLigneId: $factureLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class $AvoirVenteLigneCopyWith<$Res>  {
  factory $AvoirVenteLigneCopyWith(AvoirVenteLigne value, $Res Function(AvoirVenteLigne) _then) = _$AvoirVenteLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'avoir_id') String avoirId,@JsonKey(name: 'facture_ligne_id') String? factureLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class _$AvoirVenteLigneCopyWithImpl<$Res>
    implements $AvoirVenteLigneCopyWith<$Res> {
  _$AvoirVenteLigneCopyWithImpl(this._self, this._then);

  final AvoirVenteLigne _self;
  final $Res Function(AvoirVenteLigne) _then;

/// Create a copy of AvoirVenteLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? avoirId = null,Object? factureLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,avoirId: null == avoirId ? _self.avoirId : avoirId // ignore: cast_nullable_to_non_nullable
as String,factureLigneId: freezed == factureLigneId ? _self.factureLigneId : factureLigneId // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [AvoirVenteLigne].
extension AvoirVenteLignePatterns on AvoirVenteLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvoirVenteLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvoirVenteLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvoirVenteLigne value)  $default,){
final _that = this;
switch (_that) {
case _AvoirVenteLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvoirVenteLigne value)?  $default,){
final _that = this;
switch (_that) {
case _AvoirVenteLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'avoir_id')  String avoirId, @JsonKey(name: 'facture_ligne_id')  String? factureLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvoirVenteLigne() when $default != null:
return $default(_that.id,_that.avoirId,_that.factureLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.tauxTvaId,_that.ordre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'avoir_id')  String avoirId, @JsonKey(name: 'facture_ligne_id')  String? factureLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)  $default,) {final _that = this;
switch (_that) {
case _AvoirVenteLigne():
return $default(_that.id,_that.avoirId,_that.factureLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.tauxTvaId,_that.ordre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'avoir_id')  String avoirId, @JsonKey(name: 'facture_ligne_id')  String? factureLigneId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)?  $default,) {final _that = this;
switch (_that) {
case _AvoirVenteLigne() when $default != null:
return $default(_that.id,_that.avoirId,_that.factureLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.tauxTvaId,_that.ordre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvoirVenteLigne implements AvoirVenteLigne {
  const _AvoirVenteLigne({this.id, @JsonKey(name: 'avoir_id') required this.avoirId, @JsonKey(name: 'facture_ligne_id') this.factureLigneId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @DecimalConverter() required this.quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire') required this.prixUnitaire, @JsonKey(name: 'taux_tva_id') required this.tauxTvaId, this.ordre = 0});
  factory _AvoirVenteLigne.fromJson(Map<String, dynamic> json) => _$AvoirVenteLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'avoir_id') final  String avoirId;
@override@JsonKey(name: 'facture_ligne_id') final  String? factureLigneId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter()@JsonKey(name: 'prix_unitaire') final  Decimal prixUnitaire;
@override@JsonKey(name: 'taux_tva_id') final  String tauxTvaId;
@override@JsonKey() final  int ordre;

/// Create a copy of AvoirVenteLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvoirVenteLigneCopyWith<_AvoirVenteLigne> get copyWith => __$AvoirVenteLigneCopyWithImpl<_AvoirVenteLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvoirVenteLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvoirVenteLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.avoirId, avoirId) || other.avoirId == avoirId)&&(identical(other.factureLigneId, factureLigneId) || other.factureLigneId == factureLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avoirId,factureLigneId,articleId,varianteId,quantite,prixUnitaire,tauxTvaId,ordre);

@override
String toString() {
  return 'AvoirVenteLigne(id: $id, avoirId: $avoirId, factureLigneId: $factureLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class _$AvoirVenteLigneCopyWith<$Res> implements $AvoirVenteLigneCopyWith<$Res> {
  factory _$AvoirVenteLigneCopyWith(_AvoirVenteLigne value, $Res Function(_AvoirVenteLigne) _then) = __$AvoirVenteLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'avoir_id') String avoirId,@JsonKey(name: 'facture_ligne_id') String? factureLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class __$AvoirVenteLigneCopyWithImpl<$Res>
    implements _$AvoirVenteLigneCopyWith<$Res> {
  __$AvoirVenteLigneCopyWithImpl(this._self, this._then);

  final _AvoirVenteLigne _self;
  final $Res Function(_AvoirVenteLigne) _then;

/// Create a copy of AvoirVenteLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? avoirId = null,Object? factureLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_AvoirVenteLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,avoirId: null == avoirId ? _self.avoirId : avoirId // ignore: cast_nullable_to_non_nullable
as String,factureLigneId: freezed == factureLigneId ? _self.factureLigneId : factureLigneId // ignore: cast_nullable_to_non_nullable
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
