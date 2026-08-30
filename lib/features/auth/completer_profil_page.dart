import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text.dart';
import '../../providers/auth_providers.dart';

/// Première connexion : le compte existe dans Supabase Auth mais aucun profil
/// n'a encore été créé côté application. Auto-provisioning en rôle ADMIN
/// (seul rôle existant, voir PROJET.md section 3) via la RPC
/// provisionner_utilisateur_admin.
class CompleterProfilPage extends ConsumerStatefulWidget {
  const CompleterProfilPage({super.key});

  @override
  ConsumerState<CompleterProfilPage> createState() => _CompleterProfilPageState();
}

class _CompleterProfilPageState extends ConsumerState<CompleterProfilPage> {
  final _cleFormulaire = GlobalKey<FormBuilderState>();
  bool _enCours = false;
  String? _erreur;

  Future<void> _valider() async {
    final etat = _cleFormulaire.currentState;
    if (etat == null || !etat.saveAndValidate()) return;

    final userId = ref.read(authRepositoryProvider).utilisateurCourant?.id;
    if (userId == null) return;

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    try {
      await ref
          .read(utilisateurRepositoryProvider)
          .provisionnerAdmin(
            userId: userId,
            nom: etat.value['nom'] as String,
            prenom: etat.value['prenom'] as String,
          );
      ref.invalidate(profilCourantProvider);
    } catch (e) {
      setState(() => _erreur = 'Impossible de créer le profil : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: FormBuilder(
              key: _cleFormulaire,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Bienvenue', style: AppText.titre, textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Text(
                    'Première connexion : complétez votre profil.',
                    style: AppText.corps.copyWith(color: AppColors.texte.withValues(alpha: 0.6)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  FormBuilderTextField(
                    name: 'prenom',
                    decoration: const InputDecoration(labelText: 'Prénom'),
                    validator: FormBuilderValidators.required(errorText: 'Champ requis'),
                  ),
                  const SizedBox(height: 12),
                  FormBuilderTextField(
                    name: 'nom',
                    decoration: const InputDecoration(labelText: 'Nom'),
                    validator: FormBuilderValidators.required(errorText: 'Champ requis'),
                  ),
                  if (_erreur != null) ...[
                    const SizedBox(height: 12),
                    Text(_erreur!, style: AppText.corps.copyWith(color: AppColors.alerte)),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _enCours ? null : _valider,
                    child: _enCours
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : const Text('Continuer'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
