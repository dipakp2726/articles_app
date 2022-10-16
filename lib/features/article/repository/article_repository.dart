import 'package:articles_app/core/services/http/http_service_provider.dart';
import 'package:articles_app/features/article/model/article.dart';
import 'package:articles_app/features/article/repository/http_articles_respository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
