import 'package:article_idea_generator/core/constants/app_texts.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/pages/article_ideas_page.dart';
import 'package:article_idea_generator/features/shared/presentation/notifiers/theme_notifier.dart';
import 'package:article_idea_generator/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeaGenerator extends ConsumerWidget {
  const ArticleIdeaGenerator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeNotifierProvider);

    return MaterialApp(
      title: AppTexts.title,
      debugShowCheckedModeBanner: false,
      home: const ArticleIdeasPage(),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.values[themeState.index],
    );
  }
}
