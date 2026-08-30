// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commande_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommandeClient {

 String? get id; String? get numero;@JsonKey(name: 'exercice_id') String get exerciceId;@JsonKey(name: 'client_id') String get clientId;@JsonKey(name: 'devis_id') String? get devisId;@JsonKey(name: 'date_commande') DateTime get dateCommande;@JsonKey(name: 'date_livraison_prevue') DateTime? get dateLivraisonPrevue; StatutDocument get statut;@DecimalConverter()@JsonKey(name: 'total_ht') Decimal get totalHt;@DecimalConverter() Decimal get fodec;@DecimalConverter()@JsonKey(name: 'total_tva') Decimal get totalTva;@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal get totalTtc; String? get notes;
/// Create a copy of CommandeClient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandeClientCopyWith<CommandeClient> get copyWith => _$CommandeClientCopyWithImpl<CommandeClient>(this as CommandeClient, _$identity);

  /// Serializes this CommandeClient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandeClient&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.devisId, devisId) || other.devisId == devisId)&&(identical(other.dateCommande, dateCommande) || other.dateCommande == dateCommande)&&(identical(other.dateLivraisonPrevue, dateLivraisonPrevue) || other.dateLivraisonPrevue == dateLivraisonPrevue)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.fodec, fodec) || other.fodec == fodec)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,clientId,devisId,dateCommande,dateLivraisonPrevue,statut,totalHt,fodec,totalTva,totalTtc,notes);

@override
String toString() {
  return 'CommandeClient(id: $id, numero: $numero, exerciceId: $exerciceId, clientId: $clientId, devisId: $devisId, dateCommande: $dateCommande, dateLivraisonPrevue: $dateLivraisonPrevue, statut: $statut, totalHt: $totalHt, fodec: $fodec, totalTva: $totalTva, totalTtc: $totalTtc, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CommandeClientCopyWith<$Res>  {
  factory $CommandeClientCopyWith(CommandeClient value, $Res Function(CommandeClient) _then) = _$CommandeClientCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'devis_id') String? devisId,@JsonKey(name: 'date_commande') DateTime dateCommande,@JsonKey(name: 'date_livraison_prevue') DateTime? dateLivraisonPrevue, StatutDocument statut,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter() Decimal fodec,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc, String? notes
});




}
/// @nodoc
class _$CommandeClientCopyWithImpl<$Res>
    implements $CommandeClientCopyWith<$Res> {
  _$CommandeClientCopyWithImpl(this._self, this._then);

  final CommandeClient _self;
  final $Res Function(CommandeClient) _then;

/// Create a copy of CommandeClient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? clientId = null,Object? devisId = freezed,Object? dateCommande = null,Object? dateLivraisonPrevue = freezed,Object? statut = null,Object? totalHt = null,Object? fodec = null,Object? totalTva = null,Object? totalTtc = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,devisId: freezed == devisId ? _self.devisId : devisId // ignore: cast_nullable_to_non_nullable
as String?,dateCommande: null == dateCommande ? _self.dateCommande : dateCommande // ignore: cast_nullable_to_non_nullable
as DateTime,dateLivraisonPrevue: freezed == dateLivraisonPrevue ? _self.dateLivraisonPrevue : dateLivraisonPrevue // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [CommandeClient].
extension CommandeClientPatterns on CommandeClient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommandeClient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommandeClient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommandeClient value)  $default,){
final _that = this;
switch (_that) {
case _CommandeClient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommandeClient value)?  $default,){
final _that = this;
switch (_that) {
case _CommandeClient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'devis_id')  String? devisId, @JsonKey(name: 'date_commande')  DateTime dateCommande, @JsonKey(name: 'date_livraison_prevue')  DateTime? dateLivraisonPrevue,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommandeClient() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.devisId,_that.dateCommande,_that.dateLivraisonPrevue,_that.statut,_that.totalHt,_that.fodec,_that.totalTva,_that.totalTtc,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'devis_id')  String? devisId, @JsonKey(name: 'date_commande')  DateTime dateCommande, @JsonKey(name: 'date_livraison_prevue')  DateTime? dateLivraisonPrevue,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CommandeClient():
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.devisId,_that.dateCommande,_that.dateLivraisonPrevue,_that.statut,_that.totalHt,_that.fodec,_that.totalTva,_that.totalTtc,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'exercice_id')  String exerciceId, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'devis_id')  String? devisId, @JsonKey(name: 'date_commande')  DateTime dateCommande, @JsonKey(name: 'date_livraison_prevue')  DateTime? dateLivraisonPrevue,  StatutDocument statut, @DecimalConverter()@JsonKey(name: 'total_ht')  Decimal totalHt, @DecimalConverter()  Decimal fodec, @DecimalConverter()@JsonKey(name: 'total_tva')  Decimal totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc')  Decimal totalTtc,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CommandeClient() when $default != null:
return $default(_that.id,_that.numero,_that.exerciceId,_that.clientId,_that.devisId,_that.dateCommande,_that.dateLivraisonPrevue,_that.statut,_that.totalHt,_that.fodec,_that.totalTva,_that.totalTtc,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommandeClient implements CommandeClient {
  const _CommandeClient({this.id, this.numero, @JsonKey(name: 'exercice_id') required this.exerciceId, @JsonKey(name: 'client_id') required this.clientId, @JsonKey(name: 'devis_id') this.devisId, @JsonKey(name: 'date_commande') required this.dateCommande, @JsonKey(name: 'date_livraison_prevue') this.dateLivraisonPrevue, this.statut = StatutDocument.brouillon, @DecimalConverter()@JsonKey(name: 'total_ht') required this.totalHt, @DecimalConverter() required this.fodec, @DecimalConverter()@JsonKey(name: 'total_tva') required this.totalTva, @DecimalConverter()@JsonKey(name: 'total_ttc') required this.totalTtc, this.notes});
  factory _CommandeClient.fromJson(Map<String, dynamic> json) => _$CommandeClientFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'exercice_id') final  String exerciceId;
@override@JsonKey(name: 'client_id') final  String clientId;
@override@JsonKey(name: 'devis_id') final  String? devisId;
@override@JsonKey(name: 'date_commande') final  DateTime dateCommande;
@override@JsonKey(name: 'date_livraison_prevue') final  DateTime? dateLivraisonPrevue;
@override@JsonKey() final  StatutDocument statut;
@override@DecimalConverter()@JsonKey(name: 'total_ht') final  Decimal totalHt;
@override@DecimalConverter() final  Decimal fodec;
@override@DecimalConverter()@JsonKey(name: 'total_tva') final  Decimal totalTva;
@override@DecimalConverter()@JsonKey(name: 'total_ttc') final  Decimal totalTtc;
@override final  String? notes;

/// Create a copy of CommandeClient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommandeClientCopyWith<_CommandeClient> get copyWith => __$CommandeClientCopyWithImpl<_CommandeClient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommandeClientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommandeClient&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.exerciceId, exerciceId) || other.exerciceId == exerciceId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.devisId, devisId) || other.devisId == devisId)&&(identical(other.dateCommande, dateCommande) || other.dateCommande == dateCommande)&&(identical(other.dateLivraisonPrevue, dateLivraisonPrevue) || other.dateLivraisonPrevue == dateLivraisonPrevue)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.totalHt, totalHt) || other.totalHt == totalHt)&&(identical(other.fodec, fodec) || other.fodec == fodec)&&(identical(other.totalTva, totalTva) || other.totalTva == totalTva)&&(identical(other.totalTtc, totalTtc) || other.totalTtc == totalTtc)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,exerciceId,clientId,devisId,dateCommande,dateLivraisonPrevue,statut,totalHt,fodec,totalTva,totalTtc,notes);

@override
String toString() {
  return 'CommandeClient(id: $id, numero: $numero, exerciceId: $exerciceId, clientId: $clientId, devisId: $devisId, dateCommande: $dateCommande, dateLivraisonPrevue: $dateLivraisonPrevue, statut: $statut, totalHt: $totalHt, fodec: $fodec, totalTva: $totalTva, totalTtc: $totalTtc, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CommandeClientCopyWith<$Res> implements $CommandeClientCopyWith<$Res> {
  factory _$CommandeClientCopyWith(_CommandeClient value, $Res Function(_CommandeClient) _then) = __$CommandeClientCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'exercice_id') String exerciceId,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'devis_id') String? devisId,@JsonKey(name: 'date_commande') DateTime dateCommande,@JsonKey(name: 'date_livraison_prevue') DateTime? dateLivraisonPrevue, StatutDocument statut,@DecimalConverter()@JsonKey(name: 'total_ht') Decimal totalHt,@DecimalConverter() Decimal fodec,@DecimalConverter()@JsonKey(name: 'total_tva') Decimal totalTva,@DecimalConverter()@JsonKey(name: 'total_ttc') Decimal totalTtc, String? notes
});




}
/// @nodoc
class __$CommandeClientCopyWithImpl<$Res>
    implements _$CommandeClientCopyWith<$Res> {
  __$CommandeClientCopyWithImpl(this._self, this._then);

  final _CommandeClient _self;
  final $Res Function(_CommandeClient) _then;

/// Create a copy of CommandeClient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? exerciceId = null,Object? clientId = null,Object? devisId = freezed,Object? dateCommande = null,Object? dateLivraisonPrevue = freezed,Object? statut = null,Object? totalHt = null,Object? fodec = null,Object? totalTva = null,Object? totalTtc = null,Object? notes = freezed,}) {
  return _then(_CommandeClient(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,exerciceId: null == exerciceId ? _self.exerciceId : exerciceId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,devisId: freezed == devisId ? _self.devisId : devisId // ignore: cast_nullable_to_non_nullable
as String?,dateCommande: null == dateCommande ? _self.dateCommande : dateCommande // ignore: cast_nullable_to_non_nullable
as DateTime,dateLivraisonPrevue: freezed == dateLivraisonPrevue ? _self.dateLivraisonPrevue : dateLivraisonPrevue // ignore: cast_nullable_to_non_nullable
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
mixin _$CommandeClientLigne {

 String? get id;@JsonKey(name: 'commande_id') String get commandeId;@JsonKey(name: 'article_id') String get articleId;@JsonKey(name: 'variante_id') String? get varianteId;@DecimalConverter() Decimal get quantite;@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal get prixUnitaire;@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal get remisePct;@JsonKey(name: 'taux_tva_id') String get tauxTvaId;@DecimalConverter()@JsonKey(name: 'quantite_livree') Decimal get quantiteLivree; int get ordre;
/// Create a copy of CommandeClientLigne
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommandeClientLigneCopyWith<CommandeClientLigne> get copyWith => _$CommandeClientLigneCopyWithImpl<CommandeClientLigne>(this as CommandeClientLigne, _$identity);

  /// Serializes this CommandeClientLigne to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommandeClientLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.commandeId, commandeId) || other.commandeId == commandeId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.remisePct, remisePct) || other.remisePct == remisePct)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.quantiteLivree, quantiteLivree) || other.quantiteLivree == quantiteLivree)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,commandeId,articleId,varianteId,quantite,prixUnitaire,remisePct,tauxTvaId,quantiteLivree,ordre);

@override
String toString() {
  return 'CommandeClientLigne(id: $id, commandeId: $commandeId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, remisePct: $remisePct, tauxTvaId: $tauxTvaId, quantiteLivree: $quantiteLivree, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class $CommandeClientLigneCopyWith<$Res>  {
  factory $CommandeClientLigneCopyWith(CommandeClientLigne value, $Res Function(CommandeClientLigne) _then) = _$CommandeClientLigneCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'commande_id') String commandeId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal remisePct,@JsonKey(name: 'taux_tva_id') String tauxTvaId,@DecimalConverter()@JsonKey(name: 'quantite_livree') Decimal quantiteLivree, int ordre
});




}
/// @nodoc
class _$CommandeClientLigneCopyWithImpl<$Res>
    implements $CommandeClientLigneCopyWith<$Res> {
  _$CommandeClientLigneCopyWithImpl(this._self, this._then);

  final CommandeClientLigne _self;
  final $Res Function(CommandeClientLigne) _then;

/// Create a copy of CommandeClientLigne
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? commandeId = null,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? remisePct = null,Object? tauxTvaId = null,Object? quantiteLivree = null,Object? ordre = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,commandeId: null == commandeId ? _self.commandeId : commandeId // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,remisePct: null == remisePct ? _self.remisePct : remisePct // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,quantiteLivree: null == quantiteLivree ? _self.quantiteLivree : quantiteLivree // ignore: cast_nullable_to_non_nullable
as Decimal,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CommandeClientLigne].
extension CommandeClientLignePatterns on CommandeClientLigne {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommandeClientLigne value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommandeClientLigne() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommandeClientLigne value)  $default,){
final _that = this;
switch (_that) {
case _CommandeClientLigne():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommandeClientLigne value)?  $default,){
final _that = this;
switch (_that) {
case _CommandeClientLigne() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'commande_id')  String commandeId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId, @DecimalConverter()@JsonKey(name: 'quantite_livree')  Decimal quantiteLivree,  int ordre)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommandeClientLigne() when $default != null:
return $default(_that.id,_that.commandeId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.quantiteLivree,_that.ordre);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'commande_id')  String commandeId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId, @DecimalConverter()@JsonKey(name: 'quantite_livree')  Decimal quantiteLivree,  int ordre)  $default,) {final _that = this;
switch (_that) {
case _CommandeClientLigne():
return $default(_that.id,_that.commandeId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.quantiteLivree,_that.ordre);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'commande_id')  String commandeId, @JsonKey(name: 'article_id')  String articleId, @JsonKey(name: 'variante_id')  String? varianteId, @DecimalConverter()  Decimal quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire')  Decimal prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct')  Decimal remisePct, @JsonKey(name: 'taux_tva_id')  String tauxTvaId, @DecimalConverter()@JsonKey(name: 'quantite_livree')  Decimal quantiteLivree,  int ordre)?  $default,) {final _that = this;
switch (_that) {
case _CommandeClientLigne() when $default != null:
return $default(_that.id,_that.commandeId,_that.articleId,_that.varianteId,_that.quantite,_that.prixUnitaire,_that.remisePct,_that.tauxTvaId,_that.quantiteLivree,_that.ordre);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommandeClientLigne implements CommandeClientLigne {
  const _CommandeClientLigne({this.id, @JsonKey(name: 'commande_id') required this.commandeId, @JsonKey(name: 'article_id') required this.articleId, @JsonKey(name: 'variante_id') this.varianteId, @DecimalConverter() required this.quantite, @DecimalConverter()@JsonKey(name: 'prix_unitaire') required this.prixUnitaire, @DecimalConverter()@JsonKey(name: 'remise_pct') required this.remisePct, @JsonKey(name: 'taux_tva_id') required this.tauxTvaId, @DecimalConverter()@JsonKey(name: 'quantite_livree') required this.quantiteLivree, this.ordre = 0});
  factory _CommandeClientLigne.fromJson(Map<String, dynamic> json) => _$CommandeClientLigneFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'commande_id') final  String commandeId;
@override@JsonKey(name: 'article_id') final  String articleId;
@override@JsonKey(name: 'variante_id') final  String? varianteId;
@override@DecimalConverter() final  Decimal quantite;
@override@DecimalConverter()@JsonKey(name: 'prix_unitaire') final  Decimal prixUnitaire;
@override@DecimalConverter()@JsonKey(name: 'remise_pct') final  Decimal remisePct;
@override@JsonKey(name: 'taux_tva_id') final  String tauxTvaId;
@override@DecimalConverter()@JsonKey(name: 'quantite_livree') final  Decimal quantiteLivree;
@override@JsonKey() final  int ordre;

/// Create a copy of CommandeClientLigne
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommandeClientLigneCopyWith<_CommandeClientLigne> get copyWith => __$CommandeClientLigneCopyWithImpl<_CommandeClientLigne>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommandeClientLigneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommandeClientLigne&&(identical(other.id, id) || other.id == id)&&(identical(other.commandeId, commandeId) || other.commandeId == commandeId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.varianteId, varianteId) || other.varianteId == varianteId)&&(identical(other.quantite, quantite) || other.quantite == quantite)&&(identical(other.prixUnitaire, prixUnitaire) || other.prixUnitaire == prixUnitaire)&&(identical(other.remisePct, remisePct) || other.remisePct == remisePct)&&(identical(other.tauxTvaId, tauxTvaId) || other.tauxTvaId == tauxTvaId)&&(identical(other.quantiteLivree, quantiteLivree) || other.quantiteLivree == quantiteLivree)&&(identical(other.ordre, ordre) || other.ordre == ordre));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,commandeId,articleId,varianteId,quantite,prixUnitaire,remisePct,tauxTvaId,quantiteLivree,ordre);

@override
String toString() {
  return 'CommandeClientLigne(id: $id, commandeId: $commandeId, articleId: $articleId, varianteId: $varianteId, quantite: $quantite, prixUnitaire: $prixUnitaire, remisePct: $remisePct, tauxTvaId: $tauxTvaId, quantiteLivree: $quantiteLivree, ordre: $ordre)';
}


}

/// @nodoc
abstract mixin class _$CommandeClientLigneCopyWith<$Res> implements $CommandeClientLigneCopyWith<$Res> {
  factory _$CommandeClientLigneCopyWith(_CommandeClientLigne value, $Res Function(_CommandeClientLigne) _then) = __$CommandeClientLigneCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'commande_id') String commandeId,@JsonKey(name: 'article_id') String articleId,@JsonKey(name: 'variante_id') String? varianteId,@DecimalConverter() Decimal quantite,@DecimalConverter()@JsonKey(name: 'prix_unitaire') Decimal prixUnitaire,@DecimalConverter()@JsonKey(name: 'remise_pct') Decimal remisePct,@JsonKey(name: 'taux_tva_id') String tauxTvaId,@DecimalConverter()@JsonKey(name: 'quantite_livree') Decimal quantiteLivree, int ordre
});




}
/// @nodoc
class __$CommandeClientLigneCopyWithImpl<$Res>
    implements _$CommandeClientLigneCopyWith<$Res> {
  __$CommandeClientLigneCopyWithImpl(this._self, this._then);

  final _CommandeClientLigne _self;
  final $Res Function(_CommandeClientLigne) _then;

/// Create a copy of CommandeClientLigne
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? commandeId = null,Object? articleId = null,Object? varianteId = freezed,Object? quantite = null,Object? prixUnitaire = null,Object? remisePct = null,Object? tauxTvaId = null,Object? quantiteLivree = null,Object? ordre = null,}) {
  return _then(_CommandeClientLigne(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,commandeId: null == commandeId ? _self.commandeId : commandeId // ignore: cast_nullable_to_non_nullable
as String,articleId: null == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String,varianteId: freezed == varianteId ? _self.varianteId : varianteId // ignore: cast_nullable_to_non_nullable
as String?,quantite: null == quantite ? _self.quantite : quantite // ignore: cast_nullable_to_non_nullable
as Decimal,prixUnitaire: null == prixUnitaire ? _self.prixUnitaire : prixUnitaire // ignore: cast_nullable_to_non_nullable
as Decimal,remisePct: null == remisePct ? _self.remisePct : remisePct // ignore: cast_nullable_to_non_nullable
as Decimal,tauxTvaId: null == tauxTvaId ? _self.tauxTvaId : tauxTvaId // ignore: cast_nullable_to_non_nullable
as String,quantiteLivree: null == quantiteLivree ? _self.quantiteLivree : quantiteLivree // ignore: cast_nullable_to_non_nullable
as Decimal,ordre: null == ordre ? _self.ordre : ordre // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
