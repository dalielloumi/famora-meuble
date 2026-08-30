// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Devis {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'client_id') String get clientId;@JsonKey(name: 'date_devis') DateTime get dateDevis;@JsonKey(name: 'date_validite') DateTime? get dateValidite; StatutDocument get statut;@DecimalConverter()@JsonKey(name: 'total_ht') Decimal get totalHt;@DecimalConverter() Decimal get fodec;@DecimalConverter()@JsonKey(name: 'total_tva') Decimal get totalTva;@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal get totalTtc; String? get notes;
/// Create a copy of Devis
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevisCopyWith<Devis> get copyWith => _$DevisCopyWithImpl<Devis>(this as Devis, _$identity);

  /// Serializes this Devis to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Devis&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.dateDevis, dateDevis) || other.dateDevis == dateDevis)&&(identical(other.dateValidite, dateValidite) || other.dateValidite == dateValidite)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.fodec, fodec) || other.fodec == fodec)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,clientId,dateDevis,dateValidite,statut,totalHt,fodec,totalTva,totalTtc,notes);

@override
String toString() {
  return 'Devis(id: $id, numero: $numero, exerciceId: $exerciceId, clientId: $clientId, dateDevis: $dateDevis, dateValidite: $dateValidite, statut: $statut, totalHt: $totalHt, fodec: $fodec, totalTva: $totalTva, totalTtc: $totalTtc, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $DevisCopyWith<$Res>  {
  factory $DevisCopyWith(Devis value, $Res Function(Devis) _then) = _$DevisCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'date_devis') DateTime dateDevis,@JsonKey(name: 'date_validite') DateTime? dateValidite, StatutDocument statut,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter() Decimal fodec,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc, String? notes
});




}
/// @nodoc
class _$DevisCopyWithImpl<$Res>
    implements $DevisCopyWith<$Res> {
  _$DevisCopyWithImpl(this._self, this._then);

  final Devis _self;
  final $Res Function(Devis) _then;

/// Create a copy of Devis
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? clientId = null,Object? dateDevis = null,Object? dateValidite = freezed,Object? statut = null,Object? totalHt = null,Object? fodec = null,Object? totalTva = null,Object? totalTtc = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,dateDevis: null == dateDevis ? _self.dateDevis : dateDevis // ignore: cast_nullable_to_non_nullable
as DateTime,dateValidite: freezed == dateValidite ? _self.dateValidite : dateValidite // ignore: cast_nullable_to_non_nullable
as DateTime?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,fodec: null == fodec ? _self.fodec : fodec // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Devis].
extension DevisPatterns on Devis {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Devis value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Devis() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Devis value)  $default,){
final _that = this;
switch (_that) {
case _Devis():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Devis value)?  $default,){
final _that = this;
switch (_that) {
case _Devis() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'date_devis')  DateTime dateDevis, @JsonKey(name: 'date_validite')  DateTime? dateValidite,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Devis() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.dateDevis,_that.dateValidite,_that.statut,_that.totalHt,_that.fodec,_that.totalTva,_that.totalTtc,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'date_devis')  DateTime dateDevis, @JsonKey(name: 'date_validite')  DateTime? dateValidite,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _Devis():
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.dateDevis,_that.dateValidite,_that.statut,_that.totalHt,_that.fodec,_that.totalTva,_that.totalTtc,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'date_devis')  DateTime dateDevis, @JsonKey(name: 'date_validite')  DateTime? dateValidite,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _Devis() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.dateDevis,_that.dateValidite,_that.statut,_that.totalHt,_that.fodec,_that.totalTva,_that.totalTtc,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Devis implements Devis {
  const _Devis({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'client_id') required this.clientId, @JsonKey(name: 'date_devis') required this.dateDevis, @JsonKey(name: 'date_validite') this.dateValidite, this.statut = StatutDocument.brouillon, @DecimalConverter()@JsonKey(name: 'total_ht') required this.totalHt, @DecimalConverter() required this.fodec, @DecimalConverter()@JsonKey(name: 'total_tva') required this.totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc') required this.totalTtc, this.notes});
  factory _Devis.fromJson(Map<String, dynamic> json) => _$DevisFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'client_id') final  String clientId;
@override@JsonKey(name: 'date_devis') final  DateTime dateDevis;
@override@JsonKey(name: 'date_validite') final  DateTime? dateValidite;
@override@JsonKey() final  StatutDocument statut;
@override@DecimalConverter()@JsonKey(name: 'total_ht') final  Decimal totalHt;
@override@DecimalConverter() final  Decimal fodec;
@override@DecimalConverter()@JsonKey(name: 'total_tva') final  Decimal totalTva;
@override@DecimalConverter()@JsonKey(name: 'total_ttc') final  Decimal totalTtc;
@override final  String? notes;

/// Create a copy of Devis
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevisCopyWith<_Devis> get copyWith => __$DevisCopyWithImpl<_Devis>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DevisToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Devis&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.dateDevis, dateDevis) || other.dateDevis == dateDevis)&&(identical(other.dateValidite, dateValidite) || other.dateValidite == dateValidite)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.fodec, fodec) || other.fodec == fodec)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,clientId,dateDevis,dateValidite,statut,totalHt,fodec,totalTva,totalTtc,notes);

@override
String toString() {
  return 'Devis(id: $id, numero: $numero, exerciceId: $exerciceId, clientId: $clientId, dateDevis: $dateDevis, dateValidite: $dateValidite, statut: $statut, totalHt: $totalHt, fodec: $fodec, totalTva: $totalTva, totalTtc: $totalTtc, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$DevisCopyWith<$Res> implements $DevisCopyWith<$Res> {
  factory _$DevisCopyWith(_Devis value, $Res Function(_Devis) _then) = __$DevisCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'date_devis') DateTime dateDevis,@JsonKey(name: 'date_validite') DateTime? dateValidite, StatutDocument statut,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter() Decimal fodec,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc, String? notes
});




}
/// @nodoc
class __$DevisCopyWithImpl<$Res>
    implements _$DevisCopyWith<$Res> {
  __$DevisCopyWithImpl(this._self, this._then);

  final _Devis _self;
  final $Res Function(_Devis) _then;

/// Create a copy of Devis
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? clientId = null,Object? dateDevis = null,Object? dateValidite = freezed,Object? statut = null,Object? totalHt = null,Object? fodec = null,Object? totalTva = null,Object? totalTtc = null,Object? notes = freezed,}) {
  return _then(_Devis(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,dateDevis: null == dateDevis ? _self.dateDevis : dateDevis // ignore: cast_nullable_to_non_nullable
as DateTime,dateValidite: freezed == dateValidite ? _self.dateValidite : dateValidite // ignore: cast_nullable_to_non_nullable
as DateTime?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,fodec: null == fodec ? _self.fodec : fodec // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DevisLigne {

 String? get id;@JsonKey(name: 'devis_id') String get devisId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@DecimalConverter() Decimal get quantite;@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal get prixUnitaire;@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal get remisePct;@JsonKey(name: 'taux_tva_id') String get tauxTvaId; int get ordre;
/// Create a copy of DevisLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevisLigneCopyWith<DevisLigne> get copyWith => _$DevisLigneCopyWithImpl<DevisLigne>(this as DevisLigne, _$identity);

  /// Serializes this DevisLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DevisLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.devisId, devisId) || other.devisId == devisId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.remisePct, remisePct) || other.remisePct == remisePct)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,devisId,articleId,varianteId,quantite,prixUnitaire,remisePct,tauxTvaId,ordre);

@override
String toString() {
  return 'DevisLigne(id: $id, devisId: $devisId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, remisePct: $remisePct, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class $DevisLigneCopyWith<$Res>  {
  factory $DevisLigneCopyWith(DevisLigne value, $Res Function(DevisLigne) _then) = _$DevisLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'devis_id') String devisId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal remisePct,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class _$DevisLigneCopyWithImpl<$Res>
    implements $DevisLigneCopyWith<$Res> {
  _$DevisLigneCopyWithImpl(this._self, this._then);

  final DevisLigne _self;
  final $Res Function(DevisLigne) _then;

/// Create a copy of DevisLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? devisId = null,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? remisePct = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,devisId: null == devisId ? _self.devisId : devisId // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,remisePct: null == remisePct ? _self.remisePct : remisePct // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DevisLigne].
extension DevisLignePatterns on DevisLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DevisLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DevisLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DevisLigne value)  $default,){
final _that = this;
switch (_that) {
case _DevisLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DevisLigne value)?  $default,){
final _that = this;
switch (_that) {
case _DevisLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'devis_id')  String devisId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DevisLigne() when $default != null:
return $default(_that.id,_that.devisId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.ordre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'devis_id')  String devisId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)  $default,) {final _that = this;
switch (_that) {
case _DevisLigne():
return $default(_that.id,_that.devisId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.ordre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'devis_id')  String devisId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId,  int ordre)?  $default,) {final _that = this;
switch (_that) {
case _DevisLigne() when $default != null:
return $default(_that.id,_that.devisId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.ordre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DevisLigne implements DevisLigne {
  const _DevisLigne({this.id, @JsonKey(name: 'devis_id') required this.devisId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @DecimalConverter() required this.quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire') required this.prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct') required this.remisePct, @JsonKey(name: 'taux_tva_id') required this.tauxTvaId, this.ordre = 0});
  factory _DevisLigne.fromJson(Map<String, dynamic> json) => _$DevisLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'devis_id') final  String devisId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter()@JsonKey(name: 'prix_unitaire') final  Decimal prixUnitaire;
@override@DecimalConverter()@JsonKey(name: 'remise_pct') final  Decimal remisePct;
@override@JsonKey(name: 'taux_tva_id') final  String tauxTvaId;
@override@JsonKey() final  int ordre;

/// Create a copy of DevisLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevisLigneCopyWith<_DevisLigne> get copyWith => __$DevisLigneCopyWithImpl<_DevisLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DevisLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DevisLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.devisId, devisId) || other.devisId == devisId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.remisePct, remisePct) || other.remisePct == remisePct)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,devisId,articleId,varianteId,quantite,prixUnitaire,remisePct,tauxTvaId,ordre);

@override
String toString() {
  return 'DevisLigne(id: $id, devisId: $devisId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, remisePct: $remisePct, tauxTvaId: $tauxTvaId, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class _$DevisLigneCopyWith<$Res> implements $DevisLigneCopyWith<$Res> {
  factory _$DevisLigneCopyWith(_DevisLigne value, $Res Function(_DevisLigne) _then) = __$DevisLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'devis_id') String devisId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal remisePct,@JsonKey(name: 'taux_tva_id') String tauxTvaId, int ordre
});




}
/// @nodoc
class __$DevisLigneCopyWithImpl<$Res>
    implements _$DevisLigneCopyWith<$Res> {
  __$DevisLigneCopyWithImpl(this._self, this._then);

  final _DevisLigne _self;
  final $Res Function(_DevisLigne) _then;

/// Create a copy of DevisLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? devisId = null,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? remisePct = null,Object? tauxTvaId = null,Object? ordre = null,}) {
  return _then(_DevisLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,devisId: null == devisId ? _self.devisId : devisId // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,remisePct: null == remisePct ? _self.remisePct : remisePct // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
