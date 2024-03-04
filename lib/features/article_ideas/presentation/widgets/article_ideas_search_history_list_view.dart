import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/widgets/article_ideas_search_entry_item.dart';
import 'package:flutter/material.dart';

class ArticleIdeasSearchHistoryListView extends StatelessWidget {
  const ArticleIdeasSearchHistoryListView({
    super.key,
    required this.articleIdeasSearchHistory,
  });

  final List<ArticleIdeasSearchEntry> articleIdeasSearchHistory;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      separatorBuilder: (context, index) => const Divider(thickness: 0.2),
      itemCount: articleIdeasSearchHistory.length,
      itemBuilder: (context, index) => ArticleIdeasSearchEntryItem(
        articleIdeasSearchEntry: articleIdeasSearchHistory[index],
        index: index,
      ),
    );
  }
}
