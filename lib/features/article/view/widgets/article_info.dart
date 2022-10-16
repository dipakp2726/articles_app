import 'package:articles_app/core/configs/styles/app_colors.dart';
import 'package:articles_app/features/article/model/article.dart';
import 'package:flutter/material.dart';

class ArticleInfo extends StatelessWidget {
  const ArticleInfo(this.article, {super.key, this.isMin = false});

  final Article article;
  final bool isMin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: isMin ? 10 : 20),
      decoration: BoxDecoration(
        border: isMin
            ? null
            : Border(
          bottom: BorderSide(
                  width: 0.5,
                  color: Theme.of(context).dividerColor.withOpacity(0.3),
                ),
              ),
        color: isMin
            ? Theme.of(context).brightness == Brightness.light
            ? AppColors.primary
            : AppColors.secondary.withOpacity(0.2)
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ArticleInfoItem(
            icon: Icons.comment,
            text: '${article.commentsCount} Comments',
          ),
          ArticleInfoItem(
            icon: Icons.favorite,
            text: '${article.positiveReactionsCount} Reactions',
          ),
          ArticleInfoItem(
            icon: Icons.access_time,
            text: '${article.readingTimeMinutes} Min',
          ),
        ],
      ),
    );
  }
}

class ArticleInfoItem extends StatelessWidget {
  const ArticleInfoItem({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Theme.of(context).textTheme.bodyText2!.color!.withOpacity(0.5),
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color:
                Theme.of(context).textTheme.bodyText2!.color!.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
