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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Text(articleIdea.title),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {
              ref
                  .read(articleIdeasNotifierProvider.notifier)
                  .copyArticleIdea(articleIdea);

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text('Title copied to clipboard'),
                  ),
                );
            },
            icon: const Icon(Icons.copy, size: 16),
          ),
        ],
      ),
    );
  }
}
