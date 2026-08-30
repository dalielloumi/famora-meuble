import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text.dart';
import '../../providers/auth_providers.dart';

class ConnexionPage extends ConsumerStatefulWidget {
  const ConnexionPage({super.key});

  @override
  ConsumerState<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends ConsumerState<ConnexionPage> {
  final _cleFormulaire = GlobalKey<FormBuilderState>();
  bool _enCours = false;
  String? _erreur;

  Future<void> _connecter() async {
    final etat = _cleFormulaire.currentState;
    if (etat == null || !etat.saveAndValidate()) return;

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    try {
      await ref
          .read(authRepositoryProvider)
          .connecter(
            email: etat.value['email'] as String,
            motDePasse: etat.value['mot_de_passe'] as String,
          );
    } on AuthException catch (e) {
      setState(() => _erreur = 'Connexion impossible : ${e.message}');
    } catch (e) {
      setState(() => _erreur = 'Connexion impossible : $e');
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
                  Text('Gestion Meuble', style: AppText.titre, textAlign: TextAlign.center),
                  const SizedBox(height: 4),
                  Text(
                    'Connexion',
                    style: AppText.corps.copyWith(color: AppColors.texte.withValues(alpha: 0.6)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: 'Champ requis'),
                      FormBuilderValidators.email(errorText: 'Email invalide'),
                    ]),
                    onSubmitted: (_) => _connecter(),
                  ),
                  const SizedBox(height: 12),
                  FormBuilderTextField(
                    name: 'mot_de_passe',
                    decoration: const InputDecoration(labelText: 'Mot de passe'),
                    obscureText: true,
                    autofillHints: const [AutofillHints.password],
                    validator: FormBuilderValidators.required(errorText: 'Champ requis'),
                    onSubmitted: (_) => _connecter(),
                  ),
                  if (_erreur != null) ...[
                    const SizedBox(height: 12),
                    Text(_erreur!, style: AppText.corps.copyWith(color: AppColors.alerte)),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _enCours ? null : _connecter,
                    child: _enCours
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : const Text('Se connecter'),
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
