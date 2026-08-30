import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text.dart';
import '../../providers/auth_providers.dart';
import '../../providers/societe_providers.dart';
import 'articles/articles_page.dart';
import 'depots/depots_page.dart';
import 'tiers/tiers_page.dart';

class ParametresPage extends StatelessWidget {
  const ParametresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const Material(
            color: AppColors.surface,
            child: TabBar(
              isScrollable: true,
              labelColor: AppColors.accent,
              unselectedLabelColor: AppColors.texte,
              indicatorColor: AppColors.accent,
              tabs: [
                Tab(text: 'Profil'),
                Tab(text: 'Articles'),
                Tab(text: 'Tiers'),
                Tab(text: 'Dépôts'),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.bordure),
          const Expanded(
            child: TabBarView(
              children: [_ProfilTab(), ArticlesPage(), TiersPage(), DepotsPage()],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfilTab extends ConsumerWidget {
  const _ProfilTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profil = ref.watch(profilCourantProvider);
    final societe = ref.watch(societeProvider);
    final email = ref.watch(authRepositoryProvider).utilisateurCourant?.email ?? '—';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Utilisateur connecté', style: AppText.sousTitre),
                    const SizedBox(height: 8),
                    profil.when(
                      data: (p) => Text(
                        p == null ? 'Profil non provisionné' : '${p.prenom} ${p.nom}\n$email',
                        style: AppText.corps,
                      ),
                      loading: () => const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      error: (e, _) => Text('Erreur : $e', style: AppText.corps.copyWith(color: AppColors.alerte)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Société', style: AppText.sousTitre),
                    const SizedBox(height: 8),
                    societe.when(
                      data: (s) => Text(
                        '${s.raisonSociale}\nMF : ${s.matriculeFiscal}\n${s.adresse}',
                        style: AppText.corps,
                      ),
                      loading: () => const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      error: (e, _) => Text('Erreur : $e', style: AppText.corps.copyWith(color: AppColors.alerte)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Card(
              child: Padding(padding: EdgeInsets.all(16), child: _LogoSection()),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () => ref.read(authRepositoryProvider).deconnecter(),
              icon: const Icon(Icons.logout, size: 18),
              label: const Text('Se déconnecter'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Logo imprimé sur les devis et factures (PDF, section « en-tête »).
/// Téléversé dans Supabase Storage (bucket privé `logos`, migration 019).
class _LogoSection extends ConsumerStatefulWidget {
  const _LogoSection();

  @override
  ConsumerState<_LogoSection> createState() => _LogoSectionState();
}

class _LogoSectionState extends ConsumerState<_LogoSection> {
  bool _enCours = false;
  String? _erreur;

  static const _typesContenu = {
    'png': 'image/png',
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'webp': 'image/webp',
    'gif': 'image/gif',
  };

  Future<void> _choisirLogo() async {
    final resultat = await FilePicker.pickFiles(type: FileType.image, withData: true);
    final fichier = resultat?.files.firstOrNull;
    final octets = fichier?.bytes;
    if (fichier == null || octets == null) return;

    setState(() {
      _enCours = true;
      _erreur = null;
    });

    try {
      final extension = (fichier.extension ?? 'png').toLowerCase();
      final typeContenu = _typesContenu[extension] ?? 'image/png';
      await ref.read(societeRepositoryProvider).televerserLogo(octets, typeContenu: typeContenu);
      ref.invalidate(societeProvider);
      ref.invalidate(logoOctetsProvider);
    } catch (e) {
      setState(() => _erreur = 'Téléversement impossible : $e');
    } finally {
      if (mounted) setState(() => _enCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final logoAsync = ref.watch(logoOctetsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Logo (devis et factures)', style: AppText.sousTitre),
        const SizedBox(height: 8),
        Container(
          width: 160,
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: AppColors.bordure)),
          alignment: Alignment.center,
          child: logoAsync.when(
            data: (octets) => octets == null
                ? Text('Aucun logo', style: AppText.corps.copyWith(fontSize: 11))
                : Image.memory(octets, fit: BoxFit.contain),
            loading: () => const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            error: (e, _) => Text('Erreur : $e', style: AppText.corps.copyWith(color: AppColors.alerte, fontSize: 10)),
          ),
        ),
        if (_erreur != null) ...[
          const SizedBox(height: 8),
          Text(_erreur!, style: AppText.corps.copyWith(color: AppColors.alerte)),
        ],
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: _enCours ? null : _choisirLogo,
          icon: _enCours
              ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
              : const Icon(Icons.image_outlined, size: 18),
          label: const Text('Changer le logo'),
        ),
      ],
    );
  }
}
