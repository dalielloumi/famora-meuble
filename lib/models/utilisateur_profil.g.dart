// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utilisateur_profil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UtilisateurProfil _$UtilisateurProfilFromJson(Map<String, dynamic> json) =>
    _UtilisateurProfil(
      id: json['id'] as String,
      societeId: json['societe_id'] as String,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      roleId: json['role_id'] as String,
      actif: json['actif'] as bool,
    );

Map<String, dynamic> _$UtilisateurProfilToJson(_UtilisateurProfil instance) =>
    <String, dynamic>{
      'id': instance.id,
      'societe_id': instance.societeId,
      'nom': instance.nom,
      'prenom': instance.prenom,
      'role_id': instance.roleId,
      'actif': instance.actif,
    };
