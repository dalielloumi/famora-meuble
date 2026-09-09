import 'package:freezed_annotation/freezed_annotation.dart';

part 'utilisateur_profil.freezed.dart';
part 'utilisateur_profil.g.dart';

@freezed
abstract class UtilisateurProfil with _$UtilisateurProfil {
  const factory UtilisateurProfil({
    required String id,
    @JsonKey(name: 'societe_id') required String societeId,
    required String nom,
    required String prenom,
    @JsonKey(name: 'role_id') required String roleId,
    required bool actif,
  }) = _UtilisateurProfil;

  factory UtilisateurProfil.fromJson(Map<String, dynamic> json) => _$UtilisateurProfilFromJson(json);
}
