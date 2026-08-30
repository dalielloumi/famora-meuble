// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commande_fournisseur.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommandeFournisseur {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'fournisseur_id') String get fournisseurId;@JsonKey(name: 'depot_id') String get depotId;@JsonKey(name: 'date_commande') DateTime get dateCommande;@JsonKey(name: 'date_livraison_prevue') DateTime? get dateLivraisonPrevue; StatutDocument get statut;@DecimalConverter()@JsonKey(name: 'total_ht') Decimal get totalHt;@DecimalConverter()@JsonKey(name: 'total_tva') Decimal get totalTva;@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal get totalTtc; String? get notes;
/// Create a copy of CommandeFournisseur
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandeFournisseurCopyWith<CommandeFournisseur> get copyWith => _$CommandeFournisseurCopyWithImpl<CommandeFournisseur>(this as CommandeFournisseur, _$identity);

  /// Serializes this CommandeFournisseur to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandeFournisseur&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.fournisseurId, fournisseurId) || other.fournisseurId == fournisseurId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.dateCommande, dateCommande) || other.dateCommande == dateCommande)&&(identical(other.dateLivraisonPrevue, dateLivraisonPrevue) || other.dateLivraisonPrevue == dateLivraisonPrevue)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,fournisseurId,depotId,dateCommande,dateLivraisonPrevue,statut,totalHt,totalTva,totalTtc,notes);

@override
String toString() {
  return 'CommandeFournisseur(id: $id, numero: $numero, exerciceId: $exerciceId, fournisseurId: $fournisseurId, depotId: $depotId, dateCommande: $dateCommande, dateLivraisonPrevue: $dateLivraisonPrevue, statut: $statut, totalHt: $totalHt, totalTva: $totalTva, totalTtc: $totalTtc, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CommandeFournisseurCopyWith<$Res>  {
  factory $CommandeFournisseurCopyWith(CommandeFournisseur value, $Res Function(CommandeFournisseur) _then) = _$CommandeFournisseurCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'fournisseur_id') String fournisseurId,@JsonKey(name: 'depot_id') String depotId,@JsonKey(name: 'date_commande') DateTime dateCommande,@JsonKey(name: 'date_livraison_prevue') DateTime? dateLivraisonPrevue, StatutDocument statut,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc, String? notes
});




}
/// @nodoc
class _$CommandeFournisseurCopyWithImpl<$Res>
    implements $CommandeFournisseurCopyWith<$Res> {
  _$CommandeFournisseurCopyWithImpl(this._self, this._then);

  final CommandeFournisseur _self;
  final $Res Function(CommandeFournisseur) _then;

/// Create a copy of CommandeFournisseur
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? fournisseurId = null,Object? depotId = null,Object? dateCommande = null,Object? dateLivraisonPrevue = freezed,Object? statut = null,Object? totalHt = null,Object? totalTva = null,Object? totalTtc = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,fournisseurId: null == fournisseurId ? _self.fournisseurId : fournisseurId // ignore: cast_nullable_to_non_nullable
as String,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,dateCommande: null == dateCommande ? _self.dateCommande : dateCommande // ignore: cast_nullable_to_non_nullable
as DateTime,dateLivraisonPrevue: freezed == dateLivraisonPrevue ? _self.dateLivraisonPrevue : dateLivraisonPrevue // ignore: cast_nullable_to_non_nullable
as DateTime?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommandeFournisseur].
extension CommandeFournisseurPatterns on CommandeFournisseur {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommandeFournisseur value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommandeFournisseur() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommandeFournisseur value)  $default,){
final _that = this;
switch (_that) {
case _CommandeFournisseur():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommandeFournisseur value)?  $default,){
final _that = this;
switch (_that) {
case _CommandeFournisseur() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_commande')  DateTime dateCommande, @JsonKey(name: 'date_livraison_prevue')  DateTime? dateLivraisonPrevue,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommandeFournisseur() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.fournisseurId,_that.depotId,_that.dateCommande,_that.dateLivraisonPrevue,_that.statut,_that.totalHt,_that.totalTva,_that.totalTtc,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_commande')  DateTime dateCommande, @JsonKey(name: 'date_livraison_prevue')  DateTime? dateLivraisonPrevue,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CommandeFournisseur():
return $default(_that.id,_that.numero,_that.exerciceId,_that.fournisseurId,_that.depotId,_that.dateCommande,_that.dateLivraisonPrevue,_that.statut,_that.totalHt,_that.totalTva,_that.totalTtc,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'fournisseur_id')  String fournisseurId, @JsonKey(name: 'depot_id')  String depotId, @JsonKey(name: 'date_commande')  DateTime dateCommande, @JsonKey(name: 'date_livraison_prevue')  DateTime? dateLivraisonPrevue,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CommandeFournisseur() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.fournisseurId,_that.depotId,_that.dateCommande,_that.dateLivraisonPrevue,_that.statut,_that.totalHt,_that.totalTva,_that.totalTtc,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommandeFournisseur implements CommandeFournisseur {
  const _CommandeFournisseur({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'fournisseur_id') required this.fournisseurId, @JsonKey(name: 'depot_id') required this.depotId, @JsonKey(name: 'date_commande') required this.dateCommande, @JsonKey(name: 'date_livraison_prevue') this.dateLivraisonPrevue, this.statut = StatutDocument.brouillon, @DecimalConverter()@JsonKey(name: 'total_ht') required this.totalHt, @DecimalConverter()@JsonKey(name: 'total_tva') required this.totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc') required this.totalTtc, this.notes});
  factory _CommandeFournisseur.fromJson(Map<String, dynamic> json) => _$CommandeFournisseurFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'fournisseur_id') final  String fournisseurId;
@override@JsonKey(name: 'depot_id') final  String depotId;
@override@JsonKey(name: 'date_commande') final  DateTime dateCommande;
@override@JsonKey(name: 'date_livraison_prevue') final  DateTime? dateLivraisonPrevue;
@override@JsonKey() final  StatutDocument statut;
@override@DecimalConverter()@JsonKey(name: 'total_ht') final  Decimal totalHt;
@override@DecimalConverter()@JsonKey(name: 'total_tva') final  Decimal totalTva;
@override@DecimalConverter()@JsonKey(name: 'total_ttc') final  Decimal totalTtc;
@override final  String? notes;

/// Create a copy of CommandeFournisseur
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommandeFournisseurCopyWith<_CommandeFournisseur> get copyWith => __$CommandeFournisseurCopyWithImpl<_CommandeFournisseur>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommandeFournisseurToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommandeFournisseur&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.fournisseurId, fournisseurId) || other.fournisseurId == fournisseurId)&&(identical(other.depotId, depotId) || other.depotId == depotId)&&(identical(other.dateCommande, dateCommande) || other.dateCommande == dateCommande)&&(identical(other.dateLivraisonPrevue, dateLivraisonPrevue) || other.dateLivraisonPrevue == dateLivraisonPrevue)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,fournisseurId,depotId,dateCommande,dateLivraisonPrevue,statut,totalHt,totalTva,totalTtc,notes);

@override
String toString() {
  return 'CommandeFournisseur(id: $id, numero: $numero, exerciceId: $exerciceId, fournisseurId: $fournisseurId, depotId: $depotId, dateCommande: $dateCommande, dateLivraisonPrevue: $dateLivraisonPrevue, statut: $statut, totalHt: $totalHt, totalTva: $totalTva, totalTtc: $totalTtc, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CommandeFournisseurCopyWith<$Res> implements $CommandeFournisseurCopyWith<$Res> {
  factory _$CommandeFournisseurCopyWith(_CommandeFournisseur value, $Res Function(_CommandeFournisseur) _then) = __$CommandeFournisseurCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'fournisseur_id') String fournisseurId,@JsonKey(name: 'depot_id') String depotId,@JsonKey(name: 'date_commande') DateTime dateCommande,@JsonKey(name: 'date_livraison_prevue') DateTime? dateLivraisonPrevue, StatutDocument statut,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc, String? notes
});




}
/// @nodoc
class __$CommandeFournisseurCopyWithImpl<$Res>
    implements _$CommandeFournisseurCopyWith<$Res> {
  __$CommandeFournisseurCopyWithImpl(this._self, this._then);

  final _CommandeFournisseur _self;
  final $Res Function(_CommandeFournisseur) _then;

/// Create a copy of CommandeFournisseur
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? fournisseurId = null,Object? depotId = null,Object? dateCommande = null,Object? dateLivraisonPrevue = freezed,Object? statut = null,Object? totalHt = null,Object? totalTva = null,Object? totalTtc = null,Object? notes = freezed,}) {
  return _then(_CommandeFournisseur(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,fournisseurId: null == fournisseurId ? _self.fournisseurId : fournisseurId // ignore: cast_nullable_to_non_nullable
as String,depotId: null == depotId ? _self.depotId : depotId // ignore: cast_nullable_to_non_nullable
as String,dateCommande: null == dateCommande ? _self.dateCommande : dateCommande // ignore: cast_nullable_to_non_nullable
as DateTime,dateLivraisonPrevue: freezed == dateLivraisonPrevue ? _self.dateLivraisonPrevue : dateLivraisonPrevue // ignore: cast_nullable_to_non_nullable
as DateTime?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutDocument,totalHt: null == totalHt ? _self.totalHt : totalHt // ignore: cast_nullable_to_non_nullable
as Decimal,totalTva: null == totalTva ? _self.totalTva : totalTva // ignore: cast_nullable_to_non_nullable
as Decimal,totalTtc: null == totalTtc ? _self.totalTtc : totalTtc // ignore: cast_nullable_to_non_nullable
as Decimal,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CommandeFournisseurLigne {

 String? get id;@JsonKey(name: 'commande_id') String get commandeId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@DecimalConverter() Decimal get quantite;@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal get prixUnitaire;@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal get remisePct;@JsonKey(name: 'taux_tva_id') String get tauxTvaId;@DecimalConverter()@JsonKey(name: 'quantite_recue') Decimal get quantiteRecue; int get ordre;
/// Create a copy of CommandeFournisseurLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandeFournisseurLigneCopyWith<CommandeFournisseurLigne> get copyWith => _$CommandeFournisseurLigneCopyWithImpl<CommandeFournisseurLigne>(this as CommandeFournisseurLigne, _$identity);

  /// Serializes this CommandeFournisseurLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandeFournisseurLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.commandeId, commandeId) || other.commandeId == commandeId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.remisePct, remisePct) || other.remisePct == remisePct)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.quantiteRecue, quantiteRecue) || other.quantiteRecue == quantiteRecue)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,commandeId,articleId,varianteId,quantite,prixUnitaire,remisePct,tauxTvaId,quantiteRecue,ordre);

@override
String toString() {
  return 'CommandeFournisseurLigne(id: $id, commandeId: $commandeId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, remisePct: $remisePct, tauxTvaId: $tauxTvaId, quantiteRecue: $quantiteRecue, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class $CommandeFournisseurLigneCopyWith<$Res>  {
  factory $CommandeFournisseurLigneCopyWith(CommandeFournisseurLigne value, $Res Function(CommandeFournisseurLigne) _then) = _$CommandeFournisseurLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'commande_id') String commandeId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal remisePct,@JsonKey(name: 'taux_tva_id') String tauxTvaId,@DecimalConverter()@JsonKey(name: 'quantite_recue') Decimal quantiteRecue, int ordre
});




}
/// @nodoc
class _$CommandeFournisseurLigneCopyWithImpl<$Res>
    implements $CommandeFournisseurLigneCopyWith<$Res> {
  _$CommandeFournisseurLigneCopyWithImpl(this._self, this._then);

  final CommandeFournisseurLigne _self;
  final $Res Function(CommandeFournisseurLigne) _then;

/// Create a copy of CommandeFournisseurLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? commandeId = null,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? remisePct = null,Object? tauxTvaId = null,Object? quantiteRecue = null,Object? ordre = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,commandeId: null == commandeId ? _self.commandeId : commandeId // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,remisePct: null == remisePct ? _self.remisePct : remisePct // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,quantiteRecue: null == quantiteRecue ? _self.quantiteRecue : quantiteRecue // ignore: cast_nullable_to_non_nullable
as Decimal,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CommandeFournisseurLigne].
extension CommandeFournisseurLignePatterns on CommandeFournisseurLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommandeFournisseurLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommandeFournisseurLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommandeFournisseurLigne value)  $default,){
final _that = this;
switch (_that) {
case _CommandeFournisseurLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommandeFournisseurLigne value)?  $default,){
final _that = this;
switch (_that) {
case _CommandeFournisseurLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'commande_id')  String commandeId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId, @DecimalConverter()@JsonKey(name: 'quantite_recue')  Decimal quantiteRecue,  int ordre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommandeFournisseurLigne() when $default != null:
return $default(_that.id,_that.commandeId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.quantiteRecue,_that.ordre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'commande_id')  String commandeId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId, @DecimalConverter()@JsonKey(name: 'quantite_recue')  Decimal quantiteRecue,  int ordre)  $default,) {final _that = this;
switch (_that) {
case _CommandeFournisseurLigne():
return $default(_that.id,_that.commandeId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.quantiteRecue,_that.ordre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'commande_id')  String commandeId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId, @DecimalConverter()@JsonKey(name: 'quantite_recue')  Decimal quantiteRecue,  int ordre)?  $default,) {final _that = this;
switch (_that) {
case _CommandeFournisseurLigne() when $default != null:
return $default(_that.id,_that.commandeId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.quantiteRecue,_that.ordre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommandeFournisseurLigne implements CommandeFournisseurLigne {
  const _CommandeFournisseurLigne({this.id, @JsonKey(name: 'commande_id') required this.commandeId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @DecimalConverter() required this.quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire') required this.prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct') required this.remisePct, @JsonKey(name: 'taux_tva_id') required this.tauxTvaId, @DecimalConverter()@JsonKey(name: 'quantite_recue') required this.quantiteRecue, this.ordre = 0});
  factory _CommandeFournisseurLigne.fromJson(Map<String, dynamic> json) => _$CommandeFournisseurLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'commande_id') final  String commandeId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter()@JsonKey(name: 'prix_unitaire') final  Decimal prixUnitaire;
@override@DecimalConverter()@JsonKey(name: 'remise_pct') final  Decimal remisePct;
@override@JsonKey(name: 'taux_tva_id') final  String tauxTvaId;
@override@DecimalConverter()@JsonKey(name: 'quantite_recue') final  Decimal quantiteRecue;
@override@JsonKey() final  int ordre;

/// Create a copy of CommandeFournisseurLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommandeFournisseurLigneCopyWith<_CommandeFournisseurLigne> get copyWith => __$CommandeFournisseurLigneCopyWithImpl<_CommandeFournisseurLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommandeFournisseurLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommandeFournisseurLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.commandeId, commandeId) || other.commandeId == commandeId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.remisePct, remisePct) || other.remisePct == remisePct)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.quantiteRecue, quantiteRecue) || other.quantiteRecue == quantiteRecue)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,commandeId,articleId,varianteId,quantite,prixUnitaire,remisePct,tauxTvaId,quantiteRecue,ordre);

@override
String toString() {
  return 'CommandeFournisseurLigne(id: $id, commandeId: $commandeId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, remisePct: $remisePct, tauxTvaId: $tauxTvaId, quantiteRecue: $quantiteRecue, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class _$CommandeFournisseurLigneCopyWith<$Res> implements $CommandeFournisseurLigneCopyWith<$Res> {
  factory _$CommandeFournisseurLigneCopyWith(_CommandeFournisseurLigne value, $Res Function(_CommandeFournisseurLigne) _then) = __$CommandeFournisseurLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'commande_id') String commandeId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal remisePct,@JsonKey(name: 'taux_tva_id') String tauxTvaId,@DecimalConverter()@JsonKey(name: 'quantite_recue') Decimal quantiteRecue, int ordre
});




}
/// @nodoc
class __$CommandeFournisseurLigneCopyWithImpl<$Res>
    implements _$CommandeFournisseurLigneCopyWith<$Res> {
  __$CommandeFournisseurLigneCopyWithImpl(this._self, this._then);

  final _CommandeFournisseurLigne _self;
  final $Res Function(_CommandeFournisseurLigne) _then;

/// Create a copy of CommandeFournisseurLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? commandeId = null,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? remisePct = null,Object? tauxTvaId = null,Object? quantiteRecue = null,Object? ordre = null,}) {
  return _then(_CommandeFournisseurLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,commandeId: null == commandeId ? _self.commandeId : commandeId // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,remisePct: null == remisePct ? _self.remisePct : remisePct // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,quantiteRecue: null == quantiteRecue ? _self.quantiteRecue : quantiteRecue // ignore: cast_nullable_to_non_nullable
as Decimal,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
