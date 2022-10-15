import 'package:articles_app/core/configs/configs.dart';
import 'package:articles_app/core/widgets/app_loader.dart';
import 'package:articles_app/core/widgets/error_view.dart';
import 'package:articles_app/features/article/provider/article_list_provider.dart';
import 'package:articles_app/features/article/view/widgets/article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleList extends ConsumerWidget {
  const ArticleList(this.scrollController, {
    Key? key,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () {
        // disposes the pages previously fetched. Next read will refresh them
        ref.invalidate(getArticleListProvider);
        // keep showing the progress indicator until the first page is fetched
        return ref.read(
          getArticleListProvider(page: 1).future,
        );
      },
      child: ListView.custom(
        controller: scrollController,
        childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
            const pageSize = Configs.pageSize;

            final page = index ~/ pageSize + 1;
            final indexInPage = index % pageSize;

            final articleList = ref.watch(getArticleListProvider(page: page));

            return articleList.when(
              error: (error, stackTrace) => const ErrorView(),
              loading: () => const AppLoader(),
              data: (articles) {
                if (indexInPage >= articles.length) {
                  return null;
                }
                return ArticleCard(articles[indexInPage]);
              },
            );
          },
        ),
      ),
    );
  }
}
