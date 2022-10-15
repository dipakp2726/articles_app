import 'package:flutter/material.dart';

import 'features/article/view/pages/article_list.dart';

class ArticlesApp extends StatelessWidget {
  const ArticlesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Articles App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ArticleListPage(),
    );
  }
}
