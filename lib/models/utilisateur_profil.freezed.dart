// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utilisateur_profil.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UtilisateurProfil {

 String get id; String get nom; String get prenom;@JsonKey(name: 'role_id') String get roleId; bool get actif;
/// Create a copy of UtilisateurProfil
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UtilisateurProfilCopyWith<UtilisateurProfil> get copyWith => _$UtilisateurProfilCopyWithImpl<UtilisateurProfil>(this as UtilisateurProfil, _$identity);

  /// Serializes this UtilisateurProfil to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UtilisateurProfil&&(identical(other.id, id) || other.id == id)&&(identical(other.nom, nom) || other.nom == nom)&&(identical(other.prenom, prenom) || other.prenom == prenom)&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.actif, actif) || other.actif == actif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nom,prenom,roleId,actif);

@override
String toString() {
  return 'UtilisateurProfil(id: $id, nom: $nom, prenom: $prenom, roleId: $roleId, actif: $actif)';
}


}

/// @nodoc
abstract mixin class $UtilisateurProfilCopyWith<$Res>  {
  factory $UtilisateurProfilCopyWith(UtilisateurProfil value, $Res Function(UtilisateurProfil) _then) = _$UtilisateurProfilCopyWithImpl;
@useResult
$Res call({
 String id, String nom, String prenom,@JsonKey(name: 'role_id') String roleId, bool actif
});




}
/// @nodoc
class _$UtilisateurProfilCopyWithImpl<$Res>
    implements $UtilisateurProfilCopyWith<$Res> {
  _$UtilisateurProfilCopyWithImpl(this._self, this._then);

  final UtilisateurProfil _self;
  final $Res Function(UtilisateurProfil) _then;

/// Create a copy of UtilisateurProfil
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? nom = null,Object? prenom = null,Object? roleId = null,Object? actif = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nom: null == nom ? _self.nom : nom // ignore: cast_nullable_to_non_nullable
as String,prenom: null == prenom ? _self.prenom : prenom // ignore: cast_nullable_to_non_nullable
as String,roleId: null == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as String,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UtilisateurProfil].
extension UtilisateurProfilPatterns on UtilisateurProfil {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UtilisateurProfil value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UtilisateurProfil() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UtilisateurProfil value)  $default,){
final _that = this;
switch (_that) {
case _UtilisateurProfil():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UtilisateurProfil value)?  $default,){
final _that = this;
switch (_that) {
case _UtilisateurProfil() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String nom,  String prenom, @JsonKey(name: 'role_id')  String roleId,  bool actif)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UtilisateurProfil() when $default != null:
return $default(_that.id,_that.nom,_that.prenom,_that.roleId,_that.actif);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String nom,  String prenom, @JsonKey(name: 'role_id')  String roleId,  bool actif)  $default,) {final _that = this;
switch (_that) {
case _UtilisateurProfil():
return $default(_that.id,_that.nom,_that.prenom,_that.roleId,_that.actif);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String nom,  String prenom, @JsonKey(name: 'role_id')  String roleId,  bool actif)?  $default,) {final _that = this;
switch (_that) {
case _UtilisateurProfil() when $default != null:
return $default(_that.id,_that.nom,_that.prenom,_that.roleId,_that.actif);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UtilisateurProfil implements UtilisateurProfil {
  const _UtilisateurProfil({required this.id, required this.nom, required this.prenom, @JsonKey(name: 'role_id') required this.roleId, required this.actif});
  factory _UtilisateurProfil.fromJson(Map<String, dynamic> json) => _$UtilisateurProfilFromJson(json);

@override final  String id;
@override final  String nom;
@override final  String prenom;
@override@JsonKey(name: 'role_id') final  String roleId;
@override final  bool actif;

/// Create a copy of UtilisateurProfil
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UtilisateurProfilCopyWith<_UtilisateurProfil> get copyWith => __$UtilisateurProfilCopyWithImpl<_UtilisateurProfil>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UtilisateurProfilToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UtilisateurProfil&&(identical(other.id, id) || other.id == id)&&(identical(other.nom, nom) || other.nom == nom)&&(identical(other.prenom, prenom) || other.prenom == prenom)&&(identical(other.roleId, roleId) || other.roleId == roleId)&&(identical(other.actif, actif) || other.actif == actif));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nom,prenom,roleId,actif);

@override
String toString() {
  return 'UtilisateurProfil(id: $id, nom: $nom, prenom: $prenom, roleId: $roleId, actif: $actif)';
}


}

/// @nodoc
abstract mixin class _$UtilisateurProfilCopyWith<$Res> implements $UtilisateurProfilCopyWith<$Res> {
  factory _$UtilisateurProfilCopyWith(_UtilisateurProfil value, $Res Function(_UtilisateurProfil) _then) = __$UtilisateurProfilCopyWithImpl;
@override @useResult
$Res call({
 String id, String nom, String prenom,@JsonKey(name: 'role_id') String roleId, bool actif
});




}
/// @nodoc
class __$UtilisateurProfilCopyWithImpl<$Res>
    implements _$UtilisateurProfilCopyWith<$Res> {
  __$UtilisateurProfilCopyWithImpl(this._self, this._then);

  final _UtilisateurProfil _self;
  final $Res Function(_UtilisateurProfil) _then;

/// Create a copy of UtilisateurProfil
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? nom = null,Object? prenom = null,Object? roleId = null,Object? actif = null,}) {
  return _then(_UtilisateurProfil(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,nom: null == nom ? _self.nom : nom // ignore: cast_nullable_to_non_nullable
as String,prenom: null == prenom ? _self.prenom : prenom // ignore: cast_nullable_to_non_nullable
as String,roleId: null == roleId ? _self.roleId : roleId // ignore: cast_nullable_to_non_nullable
as String,actif: null == actif ? _self.actif : actif // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
