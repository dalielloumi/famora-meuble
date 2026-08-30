// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sav.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sav {

 String? get id; String? get numero;@JsonKey(name: 'client_id') String get clientId;@JsonKey(name: 'article_id') String? get articleId;@JsonKey(name: 'facture_vente_id') String? get factureVenteId;@JsonKey(name: 'bl_id') String? get blId;@JsonKey(name: 'date_ouverture') DateTime get dateOuverture;@JsonKey(name: 'description_probleme') String get descriptionProbleme;@JsonKey(name: 'type_intervention') TypeInterventionSav? get typeIntervention; StatutSav get statut;@JsonKey(name: 'date_cloture') DateTime? get dateCloture;@DecimalConverter() Decimal get cout;
/// Create a copy of Sav
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavCopyWith<Sav> get copyWith => _$SavCopyWithImpl<Sav>(this as Sav, _$identity);

  /// Serializes this Sav to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sav&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.factureVenteId, factureVenteId) || other.factureVenteId == factureVenteId)&&(identical(other.blId, blId) || other.blId == blId)&&(identical(other.dateOuverture, dateOuverture) || other.dateOuverture == dateOuverture)&&(identical(other.descriptionProbleme, descriptionProbleme) || other.descriptionProbleme == descriptionProbleme)&&(identical(other.typeIntervention, typeIntervention) || other.typeIntervention == typeIntervention)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.dateCloture, dateCloture) || other.dateCloture == dateCloture)&&(identical(other.cout, cout) || other.cout == cout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,clientId,articleId,factureVenteId,blId,dateOuverture,descriptionProbleme,typeIntervention,statut,dateCloture,cout);

@override
String toString() {
  return 'Sav(id: $id, numero: $numero, clientId: $clientId, articleId: $articleId, factureVenteId: $factureVenteId, blId: $blId, dateOuverture: $dateOuverture, descriptionProbleme: $descriptionProbleme, typeIntervention: $typeIntervention, statut: $statut, dateCloture: $dateCloture, cout: $cout)';
}


}

/// @nodoc
abstract mixin class $SavCopyWith<$Res>  {
  factory $SavCopyWith(Sav value, $Res Function(Sav) _then) = _$SavCopyWithImpl;
@useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'article_id') String? articleId,@JsonKey(name: 'facture_vente_id') String? factureVenteId,@JsonKey(name: 'bl_id') String? blId,@JsonKey(name: 'date_ouverture') DateTime dateOuverture,@JsonKey(name: 'description_probleme') String descriptionProbleme,@JsonKey(name: 'type_intervention') TypeInterventionSav? typeIntervention, StatutSav statut,@JsonKey(name: 'date_cloture') DateTime? dateCloture,@DecimalConverter() Decimal cout
});




}
/// @nodoc
class _$SavCopyWithImpl<$Res>
    implements $SavCopyWith<$Res> {
  _$SavCopyWithImpl(this._self, this._then);

  final Sav _self;
  final $Res Function(Sav) _then;

/// Create a copy of Sav
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? numero = freezed,Object? clientId = null,Object? articleId = freezed,Object? factureVenteId = freezed,Object? blId = freezed,Object? dateOuverture = null,Object? descriptionProbleme = null,Object? typeIntervention = freezed,Object? statut = null,Object? dateCloture = freezed,Object? cout = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,articleId: freezed == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String?,factureVenteId: freezed == factureVenteId ? _self.factureVenteId : factureVenteId // ignore: cast_nullable_to_non_nullable
as String?,blId: freezed == blId ? _self.blId : blId // ignore: cast_nullable_to_non_nullable
as String?,dateOuverture: null == dateOuverture ? _self.dateOuverture : dateOuverture // ignore: cast_nullable_to_non_nullable
as DateTime,descriptionProbleme: null == descriptionProbleme ? _self.descriptionProbleme : descriptionProbleme // ignore: cast_nullable_to_non_nullable
as String,typeIntervention: freezed == typeIntervention ? _self.typeIntervention : typeIntervention // ignore: cast_nullable_to_non_nullable
as TypeInterventionSav?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutSav,dateCloture: freezed == dateCloture ? _self.dateCloture : dateCloture // ignore: cast_nullable_to_non_nullable
as DateTime?,cout: null == cout ? _self.cout : cout // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}

}


/// Adds pattern-matching-related methods to [Sav].
extension SavPatterns on Sav {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sav value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sav() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sav value)  $default,){
final _that = this;
switch (_that) {
case _Sav():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sav value)?  $default,){
final _that = this;
switch (_that) {
case _Sav() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'article_id')  String? articleId, @JsonKey(name: 'facture_vente_id')  String? factureVenteId, @JsonKey(name: 'bl_id')  String? blId, @JsonKey(name: 'date_ouverture')  DateTime dateOuverture, @JsonKey(name: 'description_probleme')  String descriptionProbleme, @JsonKey(name: 'type_intervention')  TypeInterventionSav? typeIntervention,  StatutSav statut, @JsonKey(name: 'date_cloture')  DateTime? dateCloture, @DecimalConverter()  Decimal cout)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sav() when $default != null:
return $default(_that.id,_that.numero,_that.clientId,_that.articleId,_that.factureVenteId,_that.blId,_that.dateOuverture,_that.descriptionProbleme,_that.typeIntervention,_that.statut,_that.dateCloture,_that.cout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? numero, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'article_id')  String? articleId, @JsonKey(name: 'facture_vente_id')  String? factureVenteId, @JsonKey(name: 'bl_id')  String? blId, @JsonKey(name: 'date_ouverture')  DateTime dateOuverture, @JsonKey(name: 'description_probleme')  String descriptionProbleme, @JsonKey(name: 'type_intervention')  TypeInterventionSav? typeIntervention,  StatutSav statut, @JsonKey(name: 'date_cloture')  DateTime? dateCloture, @DecimalConverter()  Decimal cout)  $default,) {final _that = this;
switch (_that) {
case _Sav():
return $default(_that.id,_that.numero,_that.clientId,_that.articleId,_that.factureVenteId,_that.blId,_that.dateOuverture,_that.descriptionProbleme,_that.typeIntervention,_that.statut,_that.dateCloture,_that.cout);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? numero, @JsonKey(name: 'client_id')  String clientId, @JsonKey(name: 'article_id')  String? articleId, @JsonKey(name: 'facture_vente_id')  String? factureVenteId, @JsonKey(name: 'bl_id')  String? blId, @JsonKey(name: 'date_ouverture')  DateTime dateOuverture, @JsonKey(name: 'description_probleme')  String descriptionProbleme, @JsonKey(name: 'type_intervention')  TypeInterventionSav? typeIntervention,  StatutSav statut, @JsonKey(name: 'date_cloture')  DateTime? dateCloture, @DecimalConverter()  Decimal cout)?  $default,) {final _that = this;
switch (_that) {
case _Sav() when $default != null:
return $default(_that.id,_that.numero,_that.clientId,_that.articleId,_that.factureVenteId,_that.blId,_that.dateOuverture,_that.descriptionProbleme,_that.typeIntervention,_that.statut,_that.dateCloture,_that.cout);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sav implements Sav {
  const _Sav({this.id, this.numero, @JsonKey(name: 'client_id') required this.clientId, @JsonKey(name: 'article_id') this.articleId, @JsonKey(name: 'facture_vente_id') this.factureVenteId, @JsonKey(name: 'bl_id') this.blId, @JsonKey(name: 'date_ouverture') required this.dateOuverture, @JsonKey(name: 'description_probleme') required this.descriptionProbleme, @JsonKey(name: 'type_intervention') this.typeIntervention, this.statut = StatutSav.ouvert, @JsonKey(name: 'date_cloture') this.dateCloture, @DecimalConverter() required this.cout});
  factory _Sav.fromJson(Map<String, dynamic> json) => _$SavFromJson(json);

@override final  String? id;
@override final  String? numero;
@override@JsonKey(name: 'client_id') final  String clientId;
@override@JsonKey(name: 'article_id') final  String? articleId;
@override@JsonKey(name: 'facture_vente_id') final  String? factureVenteId;
@override@JsonKey(name: 'bl_id') final  String? blId;
@override@JsonKey(name: 'date_ouverture') final  DateTime dateOuverture;
@override@JsonKey(name: 'description_probleme') final  String descriptionProbleme;
@override@JsonKey(name: 'type_intervention') final  TypeInterventionSav? typeIntervention;
@override@JsonKey() final  StatutSav statut;
@override@JsonKey(name: 'date_cloture') final  DateTime? dateCloture;
@override@DecimalConverter() final  Decimal cout;

/// Create a copy of Sav
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavCopyWith<_Sav> get copyWith => __$SavCopyWithImpl<_Sav>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sav&&(identical(other.id, id) || other.id == id)&&(identical(other.numero, numero) || other.numero == numero)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.articleId, articleId) || other.articleId == articleId)&&(identical(other.factureVenteId, factureVenteId) || other.factureVenteId == factureVenteId)&&(identical(other.blId, blId) || other.blId == blId)&&(identical(other.dateOuverture, dateOuverture) || other.dateOuverture == dateOuverture)&&(identical(other.descriptionProbleme, descriptionProbleme) || other.descriptionProbleme == descriptionProbleme)&&(identical(other.typeIntervention, typeIntervention) || other.typeIntervention == typeIntervention)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.dateCloture, dateCloture) || other.dateCloture == dateCloture)&&(identical(other.cout, cout) || other.cout == cout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numero,clientId,articleId,factureVenteId,blId,dateOuverture,descriptionProbleme,typeIntervention,statut,dateCloture,cout);

@override
String toString() {
  return 'Sav(id: $id, numero: $numero, clientId: $clientId, articleId: $articleId, factureVenteId: $factureVenteId, blId: $blId, dateOuverture: $dateOuverture, descriptionProbleme: $descriptionProbleme, typeIntervention: $typeIntervention, statut: $statut, dateCloture: $dateCloture, cout: $cout)';
}


}

/// @nodoc
abstract mixin class _$SavCopyWith<$Res> implements $SavCopyWith<$Res> {
  factory _$SavCopyWith(_Sav value, $Res Function(_Sav) _then) = __$SavCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? numero,@JsonKey(name: 'client_id') String clientId,@JsonKey(name: 'article_id') String? articleId,@JsonKey(name: 'facture_vente_id') String? factureVenteId,@JsonKey(name: 'bl_id') String? blId,@JsonKey(name: 'date_ouverture') DateTime dateOuverture,@JsonKey(name: 'description_probleme') String descriptionProbleme,@JsonKey(name: 'type_intervention') TypeInterventionSav? typeIntervention, StatutSav statut,@JsonKey(name: 'date_cloture') DateTime? dateCloture,@DecimalConverter() Decimal cout
});




}
/// @nodoc
class __$SavCopyWithImpl<$Res>
    implements _$SavCopyWith<$Res> {
  __$SavCopyWithImpl(this._self, this._then);

  final _Sav _self;
  final $Res Function(_Sav) _then;

/// Create a copy of Sav
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? numero = freezed,Object? clientId = null,Object? articleId = freezed,Object? factureVenteId = freezed,Object? blId = freezed,Object? dateOuverture = null,Object? descriptionProbleme = null,Object? typeIntervention = freezed,Object? statut = null,Object? dateCloture = freezed,Object? cout = null,}) {
  return _then(_Sav(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,numero: freezed == numero ? _self.numero : numero // ignore: cast_nullable_to_non_nullable
as String?,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,articleId: freezed == articleId ? _self.articleId : articleId // ignore: cast_nullable_to_non_nullable
as String?,factureVenteId: freezed == factureVenteId ? _self.factureVenteId : factureVenteId // ignore: cast_nullable_to_non_nullable
as String?,blId: freezed == blId ? _self.blId : blId // ignore: cast_nullable_to_non_nullable
as String?,dateOuverture: null == dateOuverture ? _self.dateOuverture : dateOuverture // ignore: cast_nullable_to_non_nullable
as DateTime,descriptionProbleme: null == descriptionProbleme ? _self.descriptionProbleme : descriptionProbleme // ignore: cast_nullable_to_non_nullable
as String,typeIntervention: freezed == typeIntervention ? _self.typeIntervention : typeIntervention // ignore: cast_nullable_to_non_nullable
as TypeInterventionSav?,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutSav,dateCloture: freezed == dateCloture ? _self.dateCloture : dateCloture // ignore: cast_nullable_to_non_nullable
as DateTime?,cout: null == cout ? _self.cout : cout // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}


}


/// @nodoc
mixin _$SavIntervention {

 String? get id;@JsonKey(name: 'sav_id') String get savId;@JsonKey(name: 'date_intervention') DateTime get dateIntervention; String get description;@DecimalConverter() Decimal get cout;
/// Create a copy of SavIntervention
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavInterventionCopyWith<SavIntervention> get copyWith => _$SavInterventionCopyWithImpl<SavIntervention>(this as SavIntervention, _$identity);

  /// Serializes this SavIntervention to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavIntervention&&(identical(other.id, id) || other.id == id)&&(identical(other.savId, savId) || other.savId == savId)&&(identical(other.dateIntervention, dateIntervention) || other.dateIntervention == dateIntervention)&&(identical(other.description, description) || other.description == description)&&(identical(other.cout, cout) || other.cout == cout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,savId,dateIntervention,description,cout);

@override
String toString() {
  return 'SavIntervention(id: $id, savId: $savId, dateIntervention: $dateIntervention, description: $description, cout: $cout)';
}


}

/// @nodoc
abstract mixin class $SavInterventionCopyWith<$Res>  {
  factory $SavInterventionCopyWith(SavIntervention value, $Res Function(SavIntervention) _then) = _$SavInterventionCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'sav_id') String savId,@JsonKey(name: 'date_intervention') DateTime dateIntervention, String description,@DecimalConverter() Decimal cout
});




}
/// @nodoc
class _$SavInterventionCopyWithImpl<$Res>
    implements $SavInterventionCopyWith<$Res> {
  _$SavInterventionCopyWithImpl(this._self, this._then);

  final SavIntervention _self;
  final $Res Function(SavIntervention) _then;

/// Create a copy of SavIntervention
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? savId = null,Object? dateIntervention = null,Object? description = null,Object? cout = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,savId: null == savId ? _self.savId : savId // ignore: cast_nullable_to_non_nullable
as String,dateIntervention: null == dateIntervention ? _self.dateIntervention : dateIntervention // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cout: null == cout ? _self.cout : cout // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}

}


/// Adds pattern-matching-related methods to [SavIntervention].
extension SavInterventionPatterns on SavIntervention {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavIntervention value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavIntervention() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavIntervention value)  $default,){
final _that = this;
switch (_that) {
case _SavIntervention():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavIntervention value)?  $default,){
final _that = this;
switch (_that) {
case _SavIntervention() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'sav_id')  String savId, @JsonKey(name: 'date_intervention')  DateTime dateIntervention,  String description, @DecimalConverter()  Decimal cout)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavIntervention() when $default != null:
return $default(_that.id,_that.savId,_that.dateIntervention,_that.description,_that.cout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'sav_id')  String savId, @JsonKey(name: 'date_intervention')  DateTime dateIntervention,  String description, @DecimalConverter()  Decimal cout)  $default,) {final _that = this;
switch (_that) {
case _SavIntervention():
return $default(_that.id,_that.savId,_that.dateIntervention,_that.description,_that.cout);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'sav_id')  String savId, @JsonKey(name: 'date_intervention')  DateTime dateIntervention,  String description, @DecimalConverter()  Decimal cout)?  $default,) {final _that = this;
switch (_that) {
case _SavIntervention() when $default != null:
return $default(_that.id,_that.savId,_that.dateIntervention,_that.description,_that.cout);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavIntervention implements SavIntervention {
  const _SavIntervention({this.id, @JsonKey(name: 'sav_id') required this.savId, @JsonKey(name: 'date_intervention') required this.dateIntervention, required this.description, @DecimalConverter() required this.cout});
  factory _SavIntervention.fromJson(Map<String, dynamic> json) => _$SavInterventionFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'sav_id') final  String savId;
@override@JsonKey(name: 'date_intervention') final  DateTime dateIntervention;
@override final  String description;
@override@DecimalConverter() final  Decimal cout;

/// Create a copy of SavIntervention
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavInterventionCopyWith<_SavIntervention> get copyWith => __$SavInterventionCopyWithImpl<_SavIntervention>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavInterventionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavIntervention&&(identical(other.id, id) || other.id == id)&&(identical(other.savId, savId) || other.savId == savId)&&(identical(other.dateIntervention, dateIntervention) || other.dateIntervention == dateIntervention)&&(identical(other.description, description) || other.description == description)&&(identical(other.cout, cout) || other.cout == cout));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,savId,dateIntervention,description,cout);

@override
String toString() {
  return 'SavIntervention(id: $id, savId: $savId, dateIntervention: $dateIntervention, description: $description, cout: $cout)';
}


}

/// @nodoc
abstract mixin class _$SavInterventionCopyWith<$Res> implements $SavInterventionCopyWith<$Res> {
  factory _$SavInterventionCopyWith(_SavIntervention value, $Res Function(_SavIntervention) _then) = __$SavInterventionCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'sav_id') String savId,@JsonKey(name: 'date_intervention') DateTime dateIntervention, String description,@DecimalConverter() Decimal cout
});




}
/// @nodoc
class __$SavInterventionCopyWithImpl<$Res>
    implements _$SavInterventionCopyWith<$Res> {
  __$SavInterventionCopyWithImpl(this._self, this._then);

  final _SavIntervention _self;
  final $Res Function(_SavIntervention) _then;

/// Create a copy of SavIntervention
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? savId = null,Object? dateIntervention = null,Object? description = null,Object? cout = null,}) {
  return _then(_SavIntervention(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,savId: null == savId ? _self.savId : savId // ignore: cast_nullable_to_non_nullable
as String,dateIntervention: null == dateIntervention ? _self.dateIntervention : dateIntervention // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cout: null == cout ? _self.cout : cout // ignore: cast_nullable_to_non_nullable
as Decimal,
  ));
}


}

// dart format on
