import 'package:articles_app/core/configs/styles/app_themes.dart';
import 'package:articles_app/features/article/view/pages/article_list_page.dart';
import 'package:flutter/material.dart';

class ArticlesApp extends StatelessWidget {
  const ArticlesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Articles App',
      themeMode: ThemeMode.dark,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const ArticleListPage(),
    );
  }
}
