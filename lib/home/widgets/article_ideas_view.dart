import 'package:article_idea_repository/article_idea_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasView extends ConsumerWidget {
  const ArticleIdeasView({
    super.key,
    required this.articleIdeas,
  });

  final List<ArticleIdea> articleIdeas;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView.builder(
      itemCount: articleIdeas.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: colorScheme.surfaceTint),
          borderRadius: BorderRadius.circular(8.0),
          color: colorScheme.surface,
        ),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        child: Text(
          articleIdeas[index].title,
        ),
      ),
    );
  }
}
