import 'package:article_idea_generator/pages/home_page.dart';
import 'package:article_idea_generator/shared/constants/app_texts.dart';
import 'package:article_idea_generator/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ArticleIdeaGenerator extends StatelessWidget {
  const ArticleIdeaGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTexts.title,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: AppTheme.light,
    );
  }
}
