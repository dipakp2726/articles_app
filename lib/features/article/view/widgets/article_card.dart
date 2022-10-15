import 'package:articles_app/features/article/model/article.dart';
import 'package:flutter/material.dart';

import 'article_cover_image.dart';
import 'article_info.dart';
import 'article_tags.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.coverImage != null)
            ArticleCoverImage(article.coverImage!),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(article.description),
              ],
            ),
          ),
          ArticleTags(tags: article.tags),
          const SizedBox(height: 10),
          ArticleInfo(
            article,
            isMin: true,
          ),
        ],
      ),
    );
  }
}
