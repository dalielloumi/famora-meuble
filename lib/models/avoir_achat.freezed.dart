// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avoir_achat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvoirAchat {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'fournisseur_id') String get fournisseurId;@JsonKey(name: 'facture_achat_id') String get factureAchatId; String get motif;@JsonKey(name: 'date_avoir') DateTime get dateAvoir; StatutDocument get statut;@DecimalConverter()@JsonKey(name: 'total_ht') Decimal get totalHt;@DecimalConverter()@JsonKey(name: 'total_tva') Decimal get totalTva;@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal get totalTtc;
/// Create a copy of AvoirAchat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvoirAchatCopyWith<AvoirAchat> get copyWith => _$AvoirAchatCopyWithImpl<AvoirAchat>(this as AvoirAchat, _$identity);

  /// Serializes this AvoirAchat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvoirAchat&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.fournisseurId, fournisseurId) || other.fournisseurId == fournisseurId)&&(identical(other.factureAchatId, factureAchatId) || other.factureAchatId == factureAchatId)&&(identical(other.motif, motif) || other.motif == motif)&&(identical(other.dateAvoir, dateAvoir) || other.dateAvoir == dateAvoir)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,fournisseurId,factureAchatId,motif,dateAvoir,statut,totalHt,totalTva,totalTtc);

@override
String toString() {
  return 'AvoirAchat(id: $id, numero: $numero, exerciceId: $exerciceId, fournisseurId: $fournisseurId, factureAchatId: $factureAchatId, motif: $motif, dateAvoir: $dateAvoir, statut: $statut, totalHt: $totalHt, totalTva: $totalTva, totalTtc: $totalTtc)';
}


}

/// @nodoc
abstract mixin class $AvoirAchatCopyWith<$Res>  {
  factory $AvoirAchatCopyWith(AvoirAchat value, $Res Function(AvoirAchat) _then) = _$AvoirAchatCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'fournisseur_id') String fournisseurId,@JsonKey(name: 'facture_achat_id') String factureAchatId, String motif,@JsonKey(name: 'date_avoir') DateTime dateAvoir, StatutDocument statut,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc
});




}
/// @nodoc
class _$AvoirAchatCopyWithImpl<$Res>
    implements $AvoirAchatCopyWith<$Res> {
  _$AvoirAchatCopyWithImpl(this._self, this._then);

  final AvoirAchat _self;
  final $Res Function(AvoirAchat) _then;

/// Create a copy of AvoirAchat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? fournisseurId = null,Object? factureAchatId = null,Object? motif = null,Object? dateAvoir = null,Object? statut = null,Object? totalHt = null,Object? totalTva = null,Object? totalTtc = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,fournisseurId: null == fournisseurId ? _self.fournisseurId : fournisseurId // ignore: cast_nullable_to_non_nullable
as String,factureAchatId: null == factureAchatId ? _self.factureAchatId : factureAchatId // ignore: cast_nullable_to_non_nullable
as String,motif: null == motif ? _self.motif : motif // ignore: cast_nullable_to_non_nullable
as String,dateAvoir: null == dateAvoir ? _self.dateAvoir : dateAvoir // ignore: cast_nullable_to_non_nullable
as DateTime,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}

}


/// Adds pattern-matching-related methods to [AvoirAchat].
extension AvoirAchatPatterns on AvoirAchat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvoirAchat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvoirAchat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvoirAchat value)  $default,){
final _that = this;
switch (_that) {
case _AvoirAchat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvoirAchat value)?  $default,){
final _that = this;
switch (_that) {
case _AvoirAchat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'facture_achat_id')  String factureAchatId,  String motif, @JsonKey(name: 'date_avoir')  DateTime dateAvoir,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvoirAchat() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.fournisseurId,_that.factureAchatId,_that.motif,_that.dateAvoir,_that.statut,_that.totalHt,_that.totalTva,_that.totalTtc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'facture_achat_id')  String factureAchatId,  String motif, @JsonKey(name: 'date_avoir')  DateTime dateAvoir,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc)  $default,) {final _that = this;
switch (_that) {
case _AvoirAchat():
return $default(_that.id,_that.numero,_that.exerciceId,_that.fournisseurId,_that.factureAchatId,_that.motif,_that.dateAvoir,_that.statut,_that.totalHt,_that.totalTva,_that.totalTtc);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'facture_achat_id')  String factureAchatId,  String motif, @JsonKey(name: 'date_avoir')  DateTime dateAvoir,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc)?  $default,) {final _that = this;
switch (_that) {
case _AvoirAchat() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.fournisseurId,_that.factureAchatId,_that.motif,_that.dateAvoir,_that.statut,_that.totalHt,_that.totalTva,_that.totalTtc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvoirAchat implements AvoirAchat {
  const _AvoirAchat({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'fournisseur_id') required this.fournisseurId, @JsonKey(name: 'facture_achat_id') required this.factureAchatId, required this.motif, @JsonKey(name: 'date_avoir') required this.dateAvoir, this.statut = StatutDocument.brouillon, @DecimalConverter()@JsonKey(name: 'total_ht') required this.totalHt, @DecimalConverter()@JsonKey(name: 'total_tva') required this.totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc') required this.totalTtc});
  factory _AvoirAchat.fromJson(Map<String, dynamic> json) => _$AvoirAchatFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'fournisseur_id') final  String fournisseurId;
@override@JsonKey(name: 'facture_achat_id') final  String factureAchatId;
@override final  String motif;
@override@JsonKey(name: 'date_avoir') final  DateTime dateAvoir;
@override@JsonKey() final  StatutDocument statut;
@override@DecimalConverter()@JsonKey(name: 'total_ht') final  Decimal totalHt;
@override@DecimalConverter()@JsonKey(name: 'total_tva') final  Decimal totalTva;
@override@DecimalConverter()@JsonKey(name: 'total_ttc') final  Decimal totalTtc;

/// Create a copy of AvoirAchat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvoirAchatCopyWith<_AvoirAchat> get copyWith => __$AvoirAchatCopyWithImpl<_AvoirAchat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvoirAchatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvoirAchat&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.fournisseurId, fournisseurId) || other.fournisseurId == fournisseurId)&&(identical(other.factureAchatId, factureAchatId) || other.factureAchatId == factureAchatId)&&(identical(other.motif, motif) || other.motif == motif)&&(identical(other.dateAvoir, dateAvoir) || other.dateAvoir == dateAvoir)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,fournisseurId,factureAchatId,motif,dateAvoir,statut,totalHt,totalTva,totalTtc);

@override
String toString() {
  return 'AvoirAchat(id: $id, numero: $numero, exerciceId: $exerciceId, fournisseurId: $fournisseurId, factureAchatId: $factureAchatId, motif: $motif, dateAvoir: $dateAvoir, statut: $statut, totalHt: $totalHt, totalTva: $totalTva, totalTtc: $totalTtc)';
}


}

/// @nodoc
abstract mixin class _$AvoirAchatCopyWith<$Res> implements $AvoirAchatCopyWith<$Res> {
  factory _$AvoirAchatCopyWith(_AvoirAchat value, $Res Function(_AvoirAchat) _then) = __$AvoirAchatCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'fournisseur_id') String fournisseurId,@JsonKey(name: 'facture_achat_id') String factureAchatId, String motif,@JsonKey(name: 'date_avoir') DateTime dateAvoir, StatutDocument statut,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc
});




}
/// @nodoc
class __$AvoirAchatCopyWithImpl<$Res>
    implements _$AvoirAchatCopyWith<$Res> {
  __$AvoirAchatCopyWithImpl(this._self, this._then);

  final _AvoirAchat _self;
  final $Res Function(_AvoirAchat) _then;

/// Create a copy of AvoirAchat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? fournisseurId = null,Object? factureAchatId = null,Object? motif = null,Object? dateAvoir = null,Object? statut = null,Object? totalHt = null,Object? totalTva = null,Object? totalTtc = null,}) {
  return _then(_AvoirAchat(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,fournisseurId: null == fournisseurId ? _self.fournisseurId : fournisseurId // ignore: cast_nullable_to_non_nullable
as String,factureAchatId: null == factureAchatId ? _self.factureAchatId : factureAchatId // ignore: cast_nullable_to_non_nullable
as String,motif: null == motif ? _self.motif : motif // ignore: cast_nullable_to_non_nullable
as String,dateAvoir: null == dateAvoir ? _self.dateAvoir : dateAvoir // ignore: cast_nullable_to_non_nullable
as DateTime,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}


}


/// @nodoc
mixin _$AvoirAchatLigne {

 String? get id;@JsonKey(name: 'avoir_id') String get avoirId;@JsonKey(name: 'facture_ligne_id') String? get factureLigneId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@DecimalConverter() Decimal get quantite;@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal get prixUnitaire;@JsonKey(name: 'taux_tva_id') String get tauxTvaId; int get ordre;
/// Create a copy of AvoirAchatLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvoirAchatLigneCopyWith<AvoirAchatLigne> get copyWith => _$AvoirAchatLigneCopyWithImpl<AvoirAchatLigne>(this as AvoirAchatLigne, _$identity);

  /// Serializes this AvoirAchatLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvoirAchatLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.avoirId, avoirId) || other.avoirId == avoirId)&&(identical(other.factureLigneId, factureLigneId) || other.factureLigneId == factureLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avoirId,factureLigneId,articleId,varianteId,quantite,prixUnitaire,tauxTvaId,ordre);

@override
String toString() {
  return 'AvoirAchatLigne(id: $id, avoirId: $avoirId, factureLigneId: $factureLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class $AvoirAchatLigneCopyWith<$Res>  {
  factory $AvoirAchatLigneCopyWith(AvoirAchatLigne value, $Res Function(AvoirAchatLigne) _then) = _$AvoirAchatLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'avoir_id') String avoirId,@JsonKey(name: 'facture_ligne_id') String? factureLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class _$AvoirAchatLigneCopyWithImpl<$Res>
    implements $AvoirAchatLigneCopyWith<$Res> {
  _$AvoirAchatLigneCopyWithImpl(this._self, this._then);

  final AvoirAchatLigne _self;
  final $Res Function(AvoirAchatLigne) _then;

/// Create a copy of AvoirAchatLigne
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


/// Adds pattern-matching-related methods to [AvoirAchatLigne].
extension AvoirAchatLignePatterns on AvoirAchatLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvoirAchatLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvoirAchatLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvoirAchatLigne value)  $default,){
final _that = this;
switch (_that) {
case _AvoirAchatLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvoirAchatLigne value)?  $default,){
final _that = this;
switch (_that) {
case _AvoirAchatLigne() when $default != null:
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
case _AvoirAchatLigne() when $default != null:
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
case _AvoirAchatLigne():
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
case _AvoirAchatLigne() when $default != null:
return $default(_that.id,_that.avoirId,_that.factureLigneId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.tauxTvaId,_that.ordre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvoirAchatLigne implements AvoirAchatLigne {
  const _AvoirAchatLigne({this.id, @JsonKey(name: 'avoir_id') required this.avoirId, @JsonKey(name: 'facture_ligne_id') this.factureLigneId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @DecimalConverter() required this.quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire') required this.prixUnitaire, @JsonKey(name: 'taux_tva_id') required this.tauxTvaId, this.ordre = 0});
  factory _AvoirAchatLigne.fromJson(Map<String, dynamic> json) => _$AvoirAchatLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'avoir_id') final  String avoirId;
@override@JsonKey(name: 'facture_ligne_id') final  String? factureLigneId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter()@JsonKey(name: 'prix_unitaire') final  Decimal prixUnitaire;
@override@JsonKey(name: 'taux_tva_id') final  String tauxTvaId;
@override@JsonKey() final  int ordre;

/// Create a copy of AvoirAchatLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvoirAchatLigneCopyWith<_AvoirAchatLigne> get copyWith => __$AvoirAchatLigneCopyWithImpl<_AvoirAchatLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvoirAchatLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvoirAchatLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.avoirId, avoirId) || other.avoirId == avoirId)&&(identical(other.factureLigneId, factureLigneId) || other.factureLigneId == factureLigneId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,avoirId,factureLigneId,articleId,varianteId,quantite,prixUnitaire,tauxTvaId,ordre);

@override
String toString() {
  return 'AvoirAchatLigne(id: $id, avoirId: $avoirId, factureLigneId: $factureLigneId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class _$AvoirAchatLigneCopyWith<$Res> implements $AvoirAchatLigneCopyWith<$Res> {
  factory _$AvoirAchatLigneCopyWith(_AvoirAchatLigne value, $Res Function(_AvoirAchatLigne) _then) = __$AvoirAchatLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'avoir_id') String avoirId,@JsonKey(name: 'facture_ligne_id') String? factureLigneId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class __$AvoirAchatLigneCopyWithImpl<$Res>
    implements _$AvoirAchatLigneCopyWith<$Res> {
  __$AvoirAchatLigneCopyWithImpl(this._self, this._then);

  final _AvoirAchatLigne _self;
  final $Res Function(_AvoirAchatLigne) _then;

/// Create a copy of AvoirAchatLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? avoirId = null,Object? factureLigneId = freezed,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_AvoirAchatLigne(
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
