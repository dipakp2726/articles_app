import 'dart:developer';

import 'package:articles_app/core/widgets/app_html.dart';
import 'package:articles_app/core/widgets/app_loader.dart';
import 'package:articles_app/core/widgets/error_view.dart';
import 'package:articles_app/features/article/model/article.dart';
import 'package:articles_app/features/article/provider/article_list_provider.dart';
import 'package:articles_app/features/article/view/widgets/article_author.dart';
import 'package:articles_app/features/article/view/widgets/article_cover_image.dart';
import 'package:articles_app/features/article/view/widgets/article_info.dart';
import 'package:articles_app/features/article/view/widgets/article_tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlePage extends ConsumerWidget {
  const ArticlePage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final article = ref.watch(getArticleProvider(id: id));

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: article.when(
          data: (data) => _ArticleDetails(article: data),
          error: (error, stackTrace) {
            log('Error fetching Article');
            log(error.toString());
            return const ErrorView();
          },
          loading: () => const AppLoader(),
        ),
      ),
    );
  }
}

class _ArticleDetails extends StatelessWidget {
  const _ArticleDetails({
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (article.coverImage != null)
            ArticleCoverImage(article.coverImage!),
          ArticleInfo(article, isMin: true),
          ArticleAuthor(article),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
            child: Text(
              article.title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.start,
            ),
          ),
          ArticleTags(tags: article.tags),
          AppHtml(data: article.bodyHtml),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
