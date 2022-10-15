import 'package:articles_app/features/article/view/widgets/article_list.dart';
import 'package:flutter/material.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage({Key? key}) : super(key: key);

  @override
  State<ArticleListPage> createState() => ArticleListPageState();
}

class ArticleListPageState extends State<ArticleListPage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          key: const ValueKey('__app_bar_title_gesture_detector__'),
          onTap: () => scrollController.animateTo(
            scrollController.position.minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
          child: const Text('Flutter Articles'),
        ),
        actions: const [FlutterLogo()],
      ),
      body: ArticleList(scrollController),
    );
  }
}
