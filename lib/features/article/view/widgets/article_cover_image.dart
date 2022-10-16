import 'package:articles_app/core/widgets/app_cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleCoverImage extends StatelessWidget {
  const ArticleCoverImage(this.url, {super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return AppCachedNetworkImage(
      imageUrl: url,
      height: 220,
      width: double.infinity,
    );
  }
}
