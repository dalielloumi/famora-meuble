// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ordre_fabrication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrdreFabrication {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'nomenclature_id') String get nomenclatureId;@JsonKey(name: 'commande_client_ligne_id') String? get commandeClientLigneId;@DecimalConverter()@JsonKey(name: 'quantite_prevue') Decimal get quantitePrevue;@DecimalConverter()@JsonKey(name: 'quantite_produite') Decimal get quantiteProduite;@JsonKey(name: 'depot_source_id') String get depotSourceId;@JsonKey(name: 'depot_destination_id') String get depotDestinationId; StatutOf get statut;@JsonKey(name: 'date_lancement') DateTime? get dateLancement;@JsonKey(name: 'date_cloture') DateTime? get dateCloture;@DecimalConverter()@JsonKey(name: 'cout_matiere') Decimal get coutMatiere; String? get notes;
/// Create a copy of OrdreFabrication
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdreFabricationCopyWith<OrdreFabrication> get copyWith => _$OrdreFabricationCopyWithImpl<OrdreFabrication>(this as OrdreFabrication, _$identity);

  /// Serializes this OrdreFabrication to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdreFabrication&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.nomenclatureId, nomenclatureId) || other.nomenclatureId == nomenclatureId)&&(identical(other.commandeClientLigneId, commandeClientLigneId) || other.commandeClientLigneId == commandeClientLigneId)&&(identical(other.quantitePrevue, quantitePrevue) || other.quantitePrevue == quantitePrevue)&&(identical(other.quantiteProduite, quantiteProduite) || other.quantiteProduite == quantiteProduite)&&(identical(other.depotSourceId, depotSourceId) || other.depotSourceId == depotSourceId)&&(identical(other.depotDestinationId, depotDestinationId) || other.depotDestinationId == depotDestinationId)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.dateLancement, dateLancement) || other.dateLancement == dateLancement)&&(identical(other.dateCloture, dateCloture) || other.dateCloture == dateCloture)&&(identical(other.coutMatiere, coutMatiere) || other.coutMatiere == coutMatiere)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,articleId,nomenclatureId,commandeClientLigneId,quantitePrevue,quantiteProduite,depotSourceId,depotDestinationId,statut,dateLancement,dateCloture,coutMatiere,notes);

@override
String toString() {
  return 'OrdreFabrication(id: $id, numero: $numero, exerciceId: $exerciceId, articleId: $articleId, nomenclatureId: $nomenclatureId, commandeClientLigneId: $commandeClientLigneId, quantitePrevue: $quantitePrevue, quantiteProduite: $quantiteProduite, depotSourceId: $depotSourceId, depotDestinationId: $depotDestinationId, statut: $statut, dateLancement: $dateLancement, dateCloture: $dateCloture, coutMatiere: $coutMatiere, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $OrdreFabricationCopyWith<$Res>  {
  factory $OrdreFabricationCopyWith(OrdreFabrication value, $Res Function(OrdreFabrication) _then) = _$OrdreFabricationCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'nomenclature_id') String nomenclatureId,@JsonKey(name: 'commande_client_ligne_id') String? commandeClientLigneId,@DecimalConverter()@JsonKey(name: 'quantite_prevue') Decimal quantitePrevue,@DecimalConverter()@JsonKey(name: 'quantite_produite') Decimal quantiteProduite,@JsonKey(name: 'depot_source_id') String depotSourceId,@JsonKey(name: 'depot_destination_id') String depotDestinationId, StatutOf statut,@JsonKey(name: 'date_lancement') DateTime? dateLancement,@JsonKey(name: 'date_cloture') DateTime? dateCloture,@DecimalConverter()@JsonKey(name: 'cout_matiere') Decimal coutMatiere, String? notes
});




}
/// @nodoc
class _$OrdreFabricationCopyWithImpl<$Res>
    implements $OrdreFabricationCopyWith<$Res> {
  _$OrdreFabricationCopyWithImpl(this._self, this._then);

  final OrdreFabrication _self;
  final $Res Function(OrdreFabrication) _then;

/// Create a copy of OrdreFabrication
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? articleId = null,Object? nomenclatureId = null,Object? commandeClientLigneId = freezed,Object? quantitePrevue = null,Object? quantiteProduite = null,Object? depotSourceId = null,Object? depotDestinationId = null,Object? statut = null,Object? dateLancement = freezed,Object? dateCloture = freezed,Object? coutMatiere = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,nomenclatureId: null == nomenclatureId ? _self.nomenclatureId : nomenclatureId // ignore: cast_nullable_to_non_nullable
as String,commandeClientLigneId: freezed == commandeClientLigneId ? _self.commandeClientLigneId : commandeClientLigneId // ignore: cast_nullable_to_non_nullable
as String?,quantitePrevue: null == quantitePrevue ? _self.quantitePrevue : quantitePrevue // ignore: cast_nullable_to_non_nullable
as Decimal,quantiteProduite: null == quantiteProduite ? _self.quantiteProduite : quantiteProduite // ignore: cast_nullable_to_non_nullable
as Decimal,depotSourceId: null == depotSourceId ? _self.depotSourceId : depotSourceId // ignore: cast_nullable_to_non_nullable
as String,depotDestinationId: null == depotDestinationId ? _self.depotDestinationId : depotDestinationId // ignore: cast_nullable_to_non_nullable
as String,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutOf,dateLancement: freezed == dateLancement ? _self.dateLancement : dateLancement // ignore: cast_nullable_to_non_nullable
as DateTime?,dateCloture: freezed == dateCloture ? _self.dateCloture : dateCloture // ignore: cast_nullable_to_non_nullable
as DateTime?,coutMatiere: null == coutMatiere ? _self.coutMatiere : coutMatiere // ignore: cast_nullable_to_non_nullable
as Decimal,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdreFabrication].
extension OrdreFabricationPatterns on OrdreFabrication {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdreFabrication value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdreFabrication() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdreFabrication value)  $default,){
final _that = this;
switch (_that) {
case _OrdreFabrication():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdreFabrication value)?  $default,){
final _that = this;
switch (_that) {
case _OrdreFabrication() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'nomenclature_id')  String nomenclatureId, @JsonKey(name: 'commande_client_ligne_id')  String? commandeClientLigneId, @DecimalConverter()@JsonKey(name: 'quantite_prevue')  Decimal quantitePrevue, @DecimalConverter()@JsonKey(name: 'quantite_produite')  Decimal quantiteProduite, @JsonKey(name: 'depot_source_id')  String depotSourceId, @JsonKey(name: 'depot_destination_id')  String depotDestinationId,  StatutOf statut, @JsonKey(name: 'date_lancement')  DateTime? dateLancement, @JsonKey(name: 'date_cloture')  DateTime? dateCloture, @DecimalConverter()@JsonKey(name: 'cout_matiere')  Decimal coutMatiere,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdreFabrication() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.articleId,_that.nomenclatureId,_that.commandeClientLigneId,_that.quantitePrevue,_that.quantiteProduite,_that.depotSourceId,_that.depotDestinationId,_that.statut,_that.dateLancement,_that.dateCloture,_that.coutMatiere,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'nomenclature_id')  String nomenclatureId, @JsonKey(name: 'commande_client_ligne_id')  String? commandeClientLigneId, @DecimalConverter()@JsonKey(name: 'quantite_prevue')  Decimal quantitePrevue, @DecimalConverter()@JsonKey(name: 'quantite_produite')  Decimal quantiteProduite, @JsonKey(name: 'depot_source_id')  String depotSourceId, @JsonKey(name: 'depot_destination_id')  String depotDestinationId,  StatutOf statut, @JsonKey(name: 'date_lancement')  DateTime? dateLancement, @JsonKey(name: 'date_cloture')  DateTime? dateCloture, @DecimalConverter()@JsonKey(name: 'cout_matiere')  Decimal coutMatiere,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _OrdreFabrication():
return $default(_that.id,_that.numero,_that.exerciceId,_that.articleId,_that.nomenclatureId,_that.commandeClientLigneId,_that.quantitePrevue,_that.quantiteProduite,_that.depotSourceId,_that.depotDestinationId,_that.statut,_that.dateLancement,_that.dateCloture,_that.coutMatiere,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'nomenclature_id')  String nomenclatureId, @JsonKey(name: 'commande_client_ligne_id')  String? commandeClientLigneId, @DecimalConverter()@JsonKey(name: 'quantite_prevue')  Decimal quantitePrevue, @DecimalConverter()@JsonKey(name: 'quantite_produite')  Decimal quantiteProduite, @JsonKey(name: 'depot_source_id')  String depotSourceId, @JsonKey(name: 'depot_destination_id')  String depotDestinationId,  StatutOf statut, @JsonKey(name: 'date_lancement')  DateTime? dateLancement, @JsonKey(name: 'date_cloture')  DateTime? dateCloture, @DecimalConverter()@JsonKey(name: 'cout_matiere')  Decimal coutMatiere,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _OrdreFabrication() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.articleId,_that.nomenclatureId,_that.commandeClientLigneId,_that.quantitePrevue,_that.quantiteProduite,_that.depotSourceId,_that.depotDestinationId,_that.statut,_that.dateLancement,_that.dateCloture,_that.coutMatiere,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdreFabrication implements OrdreFabrication {
  const _OrdreFabrication({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'nomenclature_id') required this.nomenclatureId, @JsonKey(name: 'commande_client_ligne_id') this.commandeClientLigneId, @DecimalConverter()@JsonKey(name: 'quantite_prevue') required this.quantitePrevue, @DecimalConverter()@JsonKey(name: 'quantite_produite') required this.quantiteProduite, @JsonKey(name: 'depot_source_id') required this.depotSourceId, @JsonKey(name: 'depot_destination_id') required this.depotDestinationId, this.statut = StatutOf.brouillon, @JsonKey(name: 'date_lancement') this.dateLancement, @JsonKey(name: 'date_cloture') this.dateCloture, @DecimalConverter()@JsonKey(name: 'cout_matiere') required this.coutMatiere, this.notes});
  factory _OrdreFabrication.fromJson(Map<String, dynamic> json) => _$OrdreFabricationFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'nomenclature_id') final  String nomenclatureId;
@override@JsonKey(name: 'commande_client_ligne_id') final  String? commandeClientLigneId;
@override@DecimalConverter()@JsonKey(name: 'quantite_prevue') final  Decimal quantitePrevue;
@override@DecimalConverter()@JsonKey(name: 'quantite_produite') final  Decimal quantiteProduite;
@override@JsonKey(name: 'depot_source_id') final  String depotSourceId;
@override@JsonKey(name: 'depot_destination_id') final  String depotDestinationId;
@override@JsonKey() final  StatutOf statut;
@override@JsonKey(name: 'date_lancement') final  DateTime? dateLancement;
@override@JsonKey(name: 'date_cloture') final  DateTime? dateCloture;
@override@DecimalConverter()@JsonKey(name: 'cout_matiere') final  Decimal coutMatiere;
@override final  String? notes;

/// Create a copy of OrdreFabrication
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdreFabricationCopyWith<_OrdreFabrication> get copyWith => __$OrdreFabricationCopyWithImpl<_OrdreFabrication>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrdreFabricationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdreFabrication&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.nomenclatureId, nomenclatureId) || other.nomenclatureId == nomenclatureId)&&(identical(other.commandeClientLigneId, commandeClientLigneId) || other.commandeClientLigneId == commandeClientLigneId)&&(identical(other.quantitePrevue, quantitePrevue) || other.quantitePrevue == quantitePrevue)&&(identical(other.quantiteProduite, quantiteProduite) || other.quantiteProduite == quantiteProduite)&&(identical(other.depotSourceId, depotSourceId) || other.depotSourceId == depotSourceId)&&(identical(other.depotDestinationId, depotDestinationId) || other.depotDestinationId == depotDestinationId)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.dateLancement, dateLancement) || other.dateLancement == dateLancement)&&(identical(other.dateCloture, dateCloture) || other.dateCloture == dateCloture)&&(identical(other.coutMatiere, coutMatiere) || other.coutMatiere == coutMatiere)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,articleId,nomenclatureId,commandeClientLigneId,quantitePrevue,quantiteProduite,depotSourceId,depotDestinationId,statut,dateLancement,dateCloture,coutMatiere,notes);

@override
String toString() {
  return 'OrdreFabrication(id: $id, numero: $numero, exerciceId: $exerciceId, articleId: $articleId, nomenclatureId: $nomenclatureId, commandeClientLigneId: $commandeClientLigneId, quantitePrevue: $quantitePrevue, quantiteProduite: $quantiteProduite, depotSourceId: $depotSourceId, depotDestinationId: $depotDestinationId, statut: $statut, dateLancement: $dateLancement, dateCloture: $dateCloture, coutMatiere: $coutMatiere, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$OrdreFabricationCopyWith<$Res> implements $OrdreFabricationCopyWith<$Res> {
  factory _$OrdreFabricationCopyWith(_OrdreFabrication value, $Res Function(_OrdreFabrication) _then) = __$OrdreFabricationCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'nomenclature_id') String nomenclatureId,@JsonKey(name: 'commande_client_ligne_id') String? commandeClientLigneId,@DecimalConverter()@JsonKey(name: 'quantite_prevue') Decimal quantitePrevue,@DecimalConverter()@JsonKey(name: 'quantite_produite') Decimal quantiteProduite,@JsonKey(name: 'depot_source_id') String depotSourceId,@JsonKey(name: 'depot_destination_id') String depotDestinationId, StatutOf statut,@JsonKey(name: 'date_lancement') DateTime? dateLancement,@JsonKey(name: 'date_cloture') DateTime? dateCloture,@DecimalConverter()@JsonKey(name: 'cout_matiere') Decimal coutMatiere, String? notes
});




}
/// @nodoc
class __$OrdreFabricationCopyWithImpl<$Res>
    implements _$OrdreFabricationCopyWith<$Res> {
  __$OrdreFabricationCopyWithImpl(this._self, this._then);

  final _OrdreFabrication _self;
  final $Res Function(_OrdreFabrication) _then;

/// Create a copy of OrdreFabrication
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? articleId = null,Object? nomenclatureId = null,Object? commandeClientLigneId = freezed,Object? quantitePrevue = null,Object? quantiteProduite = null,Object? depotSourceId = null,Object? depotDestinationId = null,Object? statut = null,Object? dateLancement = freezed,Object? dateCloture = freezed,Object? coutMatiere = null,Object? notes = freezed,}) {
  return _then(_OrdreFabrication(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,nomenclatureId: null == nomenclatureId ? _self.nomenclatureId : nomenclatureId // ignore: cast_nullable_to_non_nullable
as String,commandeClientLigneId: freezed == commandeClientLigneId ? _self.commandeClientLigneId : commandeClientLigneId // ignore: cast_nullable_to_non_nullable
as String?,quantitePrevue: null == quantitePrevue ? _self.quantitePrevue : quantitePrevue // ignore: cast_nullable_to_non_nullable
as Decimal,quantiteProduite: null == quantiteProduite ? _self.quantiteProduite : quantiteProduite // ignore: cast_nullable_to_non_nullable
as Decimal,depotSourceId: null == depotSourceId ? _self.depotSourceId : depotSourceId // ignore: cast_nullable_to_non_nullable
as String,depotDestinationId: null == depotDestinationId ? _self.depotDestinationId : depotDestinationId // ignore: cast_nullable_to_non_nullable
as String,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutOf,dateLancement: freezed == dateLancement ? _self.dateLancement : dateLancement // ignore: cast_nullable_to_non_nullable
as DateTime?,dateCloture: freezed == dateCloture ? _self.dateCloture : dateCloture // ignore: cast_nullable_to_non_nullable
as DateTime?,coutMatiere: null == coutMatiere ? _self.coutMatiere : coutMatiere // ignore: cast_nullable_to_non_nullable
as Decimal,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
