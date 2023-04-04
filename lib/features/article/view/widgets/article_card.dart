import 'package:articles_app/features/article/model/article.dart';
import 'package:articles_app/features/article/view/pages/article_page.dart';
import 'package:articles_app/features/article/view/widgets/article_author.dart';
import 'package:articles_app/features/article/view/widgets/article_cover_image.dart';
import 'package:articles_app/features/article/view/widgets/article_info.dart';
import 'package:articles_app/features/article/view/widgets/article_tags.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard(this.article, {super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<dynamic>(
            builder: (context) => ArticlePage(id: article.id),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArticleAuthor(article),
          if (article.coverImage != null)
            ArticleCoverImage(article.coverImage!),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: Theme.of(context).textTheme.headlineSmall,
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
          ),
        ],
      ),
    );
  }
}
