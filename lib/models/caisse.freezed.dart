// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'caisse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Caisse {

 String? get id; String get libelle;@DecimalConverter() Decimal get solde; bool get actif;
/// Create a copy of Caisse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaisseCopyWith<Caisse> get copyWith => _$CaisseCopyWithImpl<Caisse>(this as Caisse, _$identity);

  /// Serializes this Caisse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Caisse&&(identical(other.id, id) || other.id == id)&&(identical(other.libelle, libelle) || other.libelle == libelle)&&(identical(other.solde, solde) || other.solde == solde)&&(identical(other.actif, actif) || other.actif == actif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,libelle,solde,actif);

@override
String toString() {
  return 'Caisse(id: $id, libelle: $libelle, solde: $solde, actif: $actif)';
}


}

/// @nodoc
abstract mixin class $CaisseCopyWith<$Res>  {
  factory $CaisseCopyWith(Caisse value, $Res Function(Caisse) _then) = _$CaisseCopyWithImpl;
@useResult
$Res call({
 String? id, String libelle,@DecimalConverter() Decimal solde, bool actif
});




}
/// @nodoc
class _$CaisseCopyWithImpl<$Res>
    implements $CaisseCopyWith<$Res> {
  _$CaisseCopyWithImpl(this._self, this._then);

  final Caisse _self;
  final $Res Function(Caisse) _then;

/// Create a copy of Caisse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? libelle = null,Object? solde = null,Object? actif = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,solde: null == solde ? _self.solde : solde // ignore: cast_nullable_to_non_nullable
as Decimal,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Caisse].
extension CaissePatterns on Caisse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Caisse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Caisse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Caisse value)  $default,){
final _that = this;
switch (_that) {
case _Caisse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Caisse value)?  $default,){
final _that = this;
switch (_that) {
case _Caisse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String libelle, @DecimalConverter()  Decimal solde,  bool actif)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Caisse() when $default != null:
return $default(_that.id,_that.libelle,_that.solde,_that.actif);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String libelle, @DecimalConverter()  Decimal solde,  bool actif)  $default,) {final _that = this;
switch (_that) {
case _Caisse():
return $default(_that.id,_that.libelle,_that.solde,_that.actif);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String libelle, @DecimalConverter()  Decimal solde,  bool actif)?  $default,) {final _that = this;
switch (_that) {
case _Caisse() when $default != null:
return $default(_that.id,_that.libelle,_that.solde,_that.actif);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Caisse implements Caisse {
  const _Caisse({this.id, required this.libelle, @DecimalConverter() required this.solde, this.actif = true});
  factory _Caisse.fromJson(Map<String, dynamic> json) => _$CaisseFromJson(json);

@override final  String? id;
@override final  String libelle;
@override@DecimalConverter() final  Decimal solde;
@override@JsonKey() final  bool actif;

/// Create a copy of Caisse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaisseCopyWith<_Caisse> get copyWith => __$CaisseCopyWithImpl<_Caisse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaisseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Caisse&&(identical(other.id, id) || other.id == id)&&(identical(other.libelle, libelle) || other.libelle == libelle)&&(identical(other.solde, solde) || other.solde == solde)&&(identical(other.actif, actif) || other.actif == actif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,libelle,solde,actif);

@override
String toString() {
  return 'Caisse(id: $id, libelle: $libelle, solde: $solde, actif: $actif)';
}


}

/// @nodoc
abstract mixin class _$CaisseCopyWith<$Res> implements $CaisseCopyWith<$Res> {
  factory _$CaisseCopyWith(_Caisse value, $Res Function(_Caisse) _then) = __$CaisseCopyWithImpl;
@override @useResult
$Res call({
 String? id, String libelle,@DecimalConverter() Decimal solde, bool actif
});




}
/// @nodoc
class __$CaisseCopyWithImpl<$Res>
    implements _$CaisseCopyWith<$Res> {
  __$CaisseCopyWithImpl(this._self, this._then);

  final _Caisse _self;
  final $Res Function(_Caisse) _then;

/// Create a copy of Caisse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? libelle = null,Object? solde = null,Object? actif = null,}) {
  return _then(_Caisse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,solde: null == solde ? _self.solde : solde // ignore: cast_nullable_to_non_nullable
as Decimal,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$CaisseOperation {

 String? get id;@JsonKey(name: 'caisse_id') String get caisseId; SensReglement get sens;@DecimalConverter() Decimal get montant;@JsonKey(name: 'date_operation') DateTime get dateOperation;@JsonKey(name: 'reglement_id') String? get reglementId; String get libelle;
/// Create a copy of CaisseOperation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaisseOperationCopyWith<CaisseOperation> get copyWith => _$CaisseOperationCopyWithImpl<CaisseOperation>(this as CaisseOperation, _$identity);

  /// Serializes this CaisseOperation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaisseOperation&&(identical(other.id, id) || other.id == id)&&(identical(other.caisseId, caisseId) || other.caisseId == caisseId)&&(identical(other.sens, sens) || other.sens == sens)&&(identical(other.montant, montant) || other.montant == montant)&&(identical(other.dateOperation, dateOperation) || other.dateOperation == dateOperation)&&(identical(other.reglementId, reglementId) || other.reglementId == reglementId)&&(identical(other.libelle, libelle) || other.libelle == libelle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,caisseId,sens,montant,dateOperation,reglementId,libelle);

@override
String toString() {
  return 'CaisseOperation(id: $id, caisseId: $caisseId, sens: $sens, montant: $montant, dateOperation: $dateOperation, reglementId: $reglementId, libelle: $libelle)';
}


}

/// @nodoc
abstract mixin class $CaisseOperationCopyWith<$Res>  {
  factory $CaisseOperationCopyWith(CaisseOperation value, $Res Function(CaisseOperation) _then) = _$CaisseOperationCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'caisse_id') String caisseId, SensReglement sens,@DecimalConverter() Decimal montant,@JsonKey(name: 'date_operation') DateTime dateOperation,@JsonKey(name: 'reglement_id') String? reglementId, String libelle
});




}
/// @nodoc
class _$CaisseOperationCopyWithImpl<$Res>
    implements $CaisseOperationCopyWith<$Res> {
  _$CaisseOperationCopyWithImpl(this._self, this._then);

  final CaisseOperation _self;
  final $Res Function(CaisseOperation) _then;

/// Create a copy of CaisseOperation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? caisseId = null,Object? sens = null,Object? montant = null,Object? dateOperation = null,Object? reglementId = freezed,Object? libelle = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,caisseId: null == caisseId ? _self.caisseId : caisseId // ignore: cast_nullable_to_non_nullable
as String,sens: null == sens ? _self.sens : sens // ignore: cast_nullable_to_non_nullable
as SensReglement,montant: null == montant ? _self.montant : montant // ignore: cast_nullable_to_non_nullable
as Decimal,dateOperation: null == dateOperation ? _self.dateOperation : dateOperation // ignore: cast_nullable_to_non_nullable
as DateTime,reglementId: freezed == reglementId ? _self.reglementId : reglementId // ignore: cast_nullable_to_non_nullable
as String?,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CaisseOperation].
extension CaisseOperationPatterns on CaisseOperation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaisseOperation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaisseOperation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaisseOperation value)  $default,){
final _that = this;
switch (_that) {
case _CaisseOperation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaisseOperation value)?  $default,){
final _that = this;
switch (_that) {
case _CaisseOperation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'caisse_id')  String caisseId,  SensReglement sens, @DecimalConverter()  Decimal montant, @JsonKey(name: 'date_operation')  DateTime dateOperation, @JsonKey(name: 'reglement_id')  String? reglementId,  String libelle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaisseOperation() when $default != null:
return $default(_that.id,_that.caisseId,_that.sens,_that.montant,_that.dateOperation,_that.reglementId,_that.libelle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'caisse_id')  String caisseId,  SensReglement sens, @DecimalConverter()  Decimal montant, @JsonKey(name: 'date_operation')  DateTime dateOperation, @JsonKey(name: 'reglement_id')  String? reglementId,  String libelle)  $default,) {final _that = this;
switch (_that) {
case _CaisseOperation():
return $default(_that.id,_that.caisseId,_that.sens,_that.montant,_that.dateOperation,_that.reglementId,_that.libelle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'caisse_id')  String caisseId,  SensReglement sens, @DecimalConverter()  Decimal montant, @JsonKey(name: 'date_operation')  DateTime dateOperation, @JsonKey(name: 'reglement_id')  String? reglementId,  String libelle)?  $default,) {final _that = this;
switch (_that) {
case _CaisseOperation() when $default != null:
return $default(_that.id,_that.caisseId,_that.sens,_that.montant,_that.dateOperation,_that.reglementId,_that.libelle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CaisseOperation implements CaisseOperation {
  const _CaisseOperation({this.id, @JsonKey(name: 'caisse_id') required this.caisseId, required this.sens, @DecimalConverter() required this.montant, @JsonKey(name: 'date_operation') required this.dateOperation, @JsonKey(name: 'reglement_id') this.reglementId, required this.libelle});
  factory _CaisseOperation.fromJson(Map<String, dynamic> json) => _$CaisseOperationFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'caisse_id') final  String caisseId;
@override final  SensReglement sens;
@override@DecimalConverter() final  Decimal montant;
@override@JsonKey(name: 'date_operation') final  DateTime dateOperation;
@override@JsonKey(name: 'reglement_id') final  String? reglementId;
@override final  String libelle;

/// Create a copy of CaisseOperation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaisseOperationCopyWith<_CaisseOperation> get copyWith => __$CaisseOperationCopyWithImpl<_CaisseOperation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaisseOperationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaisseOperation&&(identical(other.id, id) || other.id == id)&&(identical(other.caisseId, caisseId) || other.caisseId == caisseId)&&(identical(other.sens, sens) || other.sens == sens)&&(identical(other.montant, montant) || other.montant == montant)&&(identical(other.dateOperation, dateOperation) || other.dateOperation == dateOperation)&&(identical(other.reglementId, reglementId) || other.reglementId == reglementId)&&(identical(other.libelle, libelle) || other.libelle == libelle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,caisseId,sens,montant,dateOperation,reglementId,libelle);

@override
String toString() {
  return 'CaisseOperation(id: $id, caisseId: $caisseId, sens: $sens, montant: $montant, dateOperation: $dateOperation, reglementId: $reglementId, libelle: $libelle)';
}


}

/// @nodoc
abstract mixin class _$CaisseOperationCopyWith<$Res> implements $CaisseOperationCopyWith<$Res> {
  factory _$CaisseOperationCopyWith(_CaisseOperation value, $Res Function(_CaisseOperation) _then) = __$CaisseOperationCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'caisse_id') String caisseId, SensReglement sens,@DecimalConverter() Decimal montant,@JsonKey(name: 'date_operation') DateTime dateOperation,@JsonKey(name: 'reglement_id') String? reglementId, String libelle
});




}
/// @nodoc
class __$CaisseOperationCopyWithImpl<$Res>
    implements _$CaisseOperationCopyWith<$Res> {
  __$CaisseOperationCopyWithImpl(this._self, this._then);

  final _CaisseOperation _self;
  final $Res Function(_CaisseOperation) _then;

/// Create a copy of CaisseOperation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? caisseId = null,Object? sens = null,Object? montant = null,Object? dateOperation = null,Object? reglementId = freezed,Object? libelle = null,}) {
  return _then(_CaisseOperation(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,caisseId: null == caisseId ? _self.caisseId : caisseId // ignore: cast_nullable_to_non_nullable
as String,sens: null == sens ? _self.sens : sens // ignore: cast_nullable_to_non_nullable
as SensReglement,montant: null == montant ? _self.montant : montant // ignore: cast_nullable_to_non_nullable
as Decimal,dateOperation: null == dateOperation ? _self.dateOperation : dateOperation // ignore: cast_nullable_to_non_nullable
as DateTime,reglementId: freezed == reglementId ? _self.reglementId : reglementId // ignore: cast_nullable_to_non_nullable
as String?,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
