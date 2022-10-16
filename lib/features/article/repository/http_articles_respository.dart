import 'package:articles_app/core/services/http/http_service.dart';
import 'package:articles_app/features/article/model/article.dart';
import 'package:articles_app/features/article/repository/article_repository.dart';

class HttpArticleRepository implements ArticleRepository {
  HttpArticleRepository(this.httpService);

  final HttpService httpService;

  bool isOffline = false;

  @override
  Future<List<Article>> getArticles({
    List<String>? tags,
    String? username,
    required int page,
    bool forceRefresh = false,
  }) async {
    final queryParameters = <String, dynamic>{};
    if (username != null) {
      queryParameters['username'] = username;
    } else {
      // Only add tags query param if the username is null
      // Because specifying the username with the tags gives priority to the
      // tags
      // and doesn't return only the username's articles
      queryParameters['tag'] = tags?.join(', ');
    }
    queryParameters['page'] = page;

    final response = await httpService.get(
      'articles',
      queryParameters: queryParameters,
      forceRefresh: forceRefresh,
    );

    return List<Article>.from(
      (response as List<Map<String, dynamic>>).map(Article.fromJson),
    );
  }

  @override
  Future<Article> getArticle({
    required int id,
    bool forceRefresh = false,
  }) async {
    final response = await httpService.get(
      'articles/$id',
      forceRefresh: forceRefresh,
    );

    return Article.fromJson(response as Map<String, dynamic>);
  }
}
