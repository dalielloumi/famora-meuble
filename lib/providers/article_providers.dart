import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/article.dart';
import '../repositories/article_repository.dart';

final articleRepositoryProvider = Provider<ArticleRepository>((ref) => ArticleRepository());

class ArticlesNotifier extends AsyncNotifier<List<Article>> {
  @override
  Future<List<Article>> build() => ref.watch(articleRepositoryProvider).lister();

  Future<void> creer(Article article) async {
    await ref.read(articleRepositoryProvider).creer(article);
    ref.invalidateSelf();
    await future;
  }

  Future<void> modifier(Article article) async {
    await ref.read(articleRepositoryProvider).modifier(article);
    ref.invalidateSelf();
    await future;
  }

  Future<void> archiver(String id, {required bool actif}) async {
    await ref.read(articleRepositoryProvider).archiver(id, actif: actif);
    ref.invalidateSelf();
    await future;
  }
}

final articlesProvider = AsyncNotifierProvider<ArticlesNotifier, List<Article>>(ArticlesNotifier.new);
