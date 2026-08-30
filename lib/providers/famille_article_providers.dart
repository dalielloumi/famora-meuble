import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/famille_article.dart';
import '../repositories/famille_article_repository.dart';

final familleArticleRepositoryProvider = Provider<FamilleArticleRepository>((ref) => FamilleArticleRepository());

class FamillesArticleNotifier extends AsyncNotifier<List<FamilleArticle>> {
  @override
  Future<List<FamilleArticle>> build() => ref.watch(familleArticleRepositoryProvider).lister();

  Future<void> rafraichir() async {
    ref.invalidateSelf();
    await future;
  }
}

final famillesArticleProvider = AsyncNotifierProvider<FamillesArticleNotifier, List<FamilleArticle>>(
  FamillesArticleNotifier.new,
);
