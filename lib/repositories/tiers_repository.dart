import '../core/supabase_client.dart';
import '../models/tiers.dart';

class TiersRepository {
  Future<List<Tiers>> lister() async {
    final lignes = await supabase.from('tiers').select().order('raison_sociale');
    return lignes.map(Tiers.fromJson).toList();
  }

  /// Nombre de tiers déjà rattachés à ce type — sert de base à la génération
  /// automatique du code (PREFIXE + compteur), même principe que les
  /// articles (voir ArticleRepository.compterParFamille).
  Future<int> compterParType(TypeTiers type) async {
    const valeurs = {TypeTiers.client: 'CLIENT', TypeTiers.fournisseur: 'FOURNISSEUR', TypeTiers.lesDeux: 'LES_DEUX'};
    final lignes = await supabase.from('tiers').select('id').eq('type', valeurs[type]!);
    return lignes.length;
  }

  Future<Tiers> creer(Tiers tiers) async {
    final donnees = tiers.toJson()..remove('id')..remove('solde');
    final ligne = await supabase.from('tiers').insert(donnees).select().single();
    return Tiers.fromJson(ligne);
  }

  Future<Tiers> modifier(Tiers tiers) async {
    final donnees = tiers.toJson()..remove('id')..remove('solde');
    final ligne = await supabase.from('tiers').update(donnees).eq('id', tiers.id!).select().single();
    return Tiers.fromJson(ligne);
  }

  Future<void> archiver(String id, {required bool actif}) async {
    await supabase.from('tiers').update({'actif': actif}).eq('id', id);
  }

  /// Suppression définitive. Échoue si ce tiers est encore référencé par des
  /// documents existants (devis, factures...) — préférer archiver() dans ce
  /// cas plutôt que de forcer la suppression.
  Future<void> supprimer(String id) async {
    await supabase.from('tiers').delete().eq('id', id);
  }
}
