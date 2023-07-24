import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/notifiers/article_ideas_search_history_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasSearchEntryItem extends ConsumerWidget {
  const ArticleIdeasSearchEntryItem(
      {super.key, required this.articleIdeasSearchEntry, required this.index});

  final ArticleIdeasSearchEntry articleIdeasSearchEntry;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dismissible(
      key: Key(articleIdeasSearchEntry.text),
      onDismissed: (_) => ref
          .read(articleIdeasSearchNotifierProvider.notifier)
          .deleteSearchEntry(index),
      child: ListTile(
        leading: const Icon(Icons.history),
        title: Text(articleIdeasSearchEntry.text),
        trailing: Icon(
          Icons.north_west,
          color: colorScheme.primary,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        onTap: () {
          ref
              .read(articleIdeasSearchNotifierProvider.notifier)
              .addSearchEntry(articleIdeasSearchEntry);

          Navigator.of(context).pop(articleIdeasSearchEntry.text);
        },
      ),
    );
  }
}
