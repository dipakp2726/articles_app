import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/http/http_service_provider.dart';
import '../model/article.dart';
import 'http_articles_respository.dart';

part 'article_repository.g.dart';

@riverpod
ArticleRepository articleRepository(ArticleRepositoryRef ref) {
  final httpService = ref.watch(httpServiceProvider);

  return HttpArticleRepository(httpService);
}

abstract class ArticleRepository {
  Future<List<Article>> getArticles({
    List<String>? tags,
    String? username,
    required int page,
    bool forceRefresh = false,
  });

  Future<Article> getArticle({required int id});
}
