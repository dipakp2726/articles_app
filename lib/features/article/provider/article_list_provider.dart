import 'package:articles_app/features/article/model/article.dart';
import 'package:articles_app/features/article/repository/article_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_list_provider.g.dart';

@riverpod
Future<List<Article>> getArticleList(GetArticleListRef ref,
    {required int page, bool forceRefresh = false}) async {
  return ref
      .watch(articleRepositoryProvider)
      .getArticles(page: page, forceRefresh: forceRefresh);
}

@riverpod
Future<Article> getArticle(GetArticleRef ref, {required int id}) async {
  return ref.watch(articleRepositoryProvider).getArticle(
        id: id,
      );
}
