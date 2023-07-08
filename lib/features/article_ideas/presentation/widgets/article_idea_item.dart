import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/notifiers/article_ideas_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeaItem extends ConsumerWidget {
  const ArticleIdeaItem({
    super.key,
    required this.articleIdea,
  });

  final ArticleIdea articleIdea;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(articleIdea.title),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: colorScheme.primary,
            child: IconButton(
              color: colorScheme.onPrimary,
              onPressed: () => ref
                  .read(articleIdeasNotifierProvider.notifier)
                  .shareArticleIdea(articleIdea),
              icon: const Icon(Icons.share),
            ),
          ),
        ],
      ),
    );
  }
}
