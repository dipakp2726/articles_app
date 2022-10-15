import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/article.dart';

class ArticleInfo extends StatelessWidget {
  final Article article;
  final bool isMin;

  const ArticleInfo(this.article, {Key? key, this.isMin = false})
      : super(key: key);

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
                    color: Theme.of(context).dividerColor.withOpacity(0.3)),
              ),
        color: isMin
            ? Theme.of(context).brightness == Brightness.light
                ? Colors.greenAccent
                : Colors.white.withOpacity(0.2)
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
  final IconData icon;
  final String text;

  const ArticleInfoItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

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
              color: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .color!
                  .withOpacity(0.5)),
        ),
      ],
    );
  }
}
