import 'package:articles_app/features/article/model/article.dart';
import 'package:flutter/material.dart';

import '../../../../core/configs/styles/app_colors.dart';
import '../../../../core/widgets/app_cached_network_image.dart';

class ArticleAuthor extends StatelessWidget {
  final Article article;

  const ArticleAuthor(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (article.author?.username != null) {
          // Navigator.of(context).push(
          //   MaterialPageRoute<dynamic>(
          //     builder: (BuildContext context) => AuthorArticlesPage(
          //       authorName: article.author!.name,
          //       authorUsername: article.author!.username!,
          //     ),
          //   ),
          // );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        width: double.infinity,
        child: Row(
          children: [
            if (article.author?.profileImage90 != null)
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AppCachedNetworkImage(
                    imageUrl: article.author!.profileImage90!,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (article.author?.name != null)
                    Text(
                      article.author!.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                  Text(article.readablePublishDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
