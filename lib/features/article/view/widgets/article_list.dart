import 'dart:developer';

import 'package:articles_app/core/widgets/app_loader.dart';
import 'package:articles_app/core/widgets/error_view.dart';
import 'package:articles_app/features/article/provider/article_list_provider.dart';
import 'package:articles_app/features/article/view/widgets/article_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleList extends ConsumerWidget {
  const ArticleList(
    this.scrollController, {
    Key? key,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(getArticleListProvider);

    return articles.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          controller: scrollController,
          itemBuilder: (context, index) {
            final article = data[index];

            return ArticleCard(article);
          },
        );
      },
      error: (error, stackTrace) {
        log('Error fetching article list');
        log(error.toString());
        return const ErrorView();
      },
      loading: () => const AppLoader(),
    );
  }
}
