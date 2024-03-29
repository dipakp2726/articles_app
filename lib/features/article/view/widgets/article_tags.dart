import 'package:articles_app/core/configs/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ArticleTags extends StatelessWidget {
  const ArticleTags({super.key, required this.tags});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      width: double.infinity,
      child: Wrap(
        spacing: 10,
        children: List.generate(
          tags.length,
          (index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '# ',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.secondary),
              ),
              Text(tags[index])
            ],
          ),
        ),
      ),
    );
  }
}
