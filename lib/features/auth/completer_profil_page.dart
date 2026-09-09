import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text.dart';
import '../../providers/auth_providers.dart';

/// Première connexion : le compte existe dans Supabase Auth mais aucune
/// entreprise n'a encore été créée côté application. Cet écran crée
/// l'espace de l'entreprise (isolé de toute autre entreprise utilisant
/// l'application) et provisionne l'utilisateur en rôle ADMIN de celle-ci,
/// via la RPC provisionner_nouvelle_entreprise.
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
          .provisionnerNouvelleEntreprise(
            userId: userId,
            nom: etat.value['nom'] as String,
            prenom: etat.value['prenom'] as String,
            raisonSociale: etat.value['raison_sociale'] as String,
            matriculeFiscal: etat.value['matricule_fiscal'] as String,
            adresse: etat.value['adresse'] as String,
          );
      ref.invalidate(profilCourantProvider);
    } catch (e) {
      setState(() => _erreur = 'Impossible de créer votre espace : $e');
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
          child: SingleChildScrollView(
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
                    'Première connexion : créez votre espace.',
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
                  const SizedBox(height: 20),
                  Text('Votre entreprise', style: AppText.sousTitre),
                  const SizedBox(height: 12),
                  FormBuilderTextField(
                    name: 'raison_sociale',
                    decoration: const InputDecoration(labelText: 'Raison sociale'),
                    validator: FormBuilderValidators.required(errorText: 'Champ requis'),
                  ),
                  const SizedBox(height: 12),
                  FormBuilderTextField(
                    name: 'matricule_fiscal',
                    decoration: const InputDecoration(labelText: 'Matricule fiscal'),
                    validator: FormBuilderValidators.required(errorText: 'Champ requis'),
                  ),
                  const SizedBox(height: 12),
                  FormBuilderTextField(
                    name: 'adresse',
                    decoration: const InputDecoration(labelText: 'Adresse'),
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
