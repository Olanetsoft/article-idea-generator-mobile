import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';

class ArticleIdeasSearchHistoryState {
  const ArticleIdeasSearchHistoryState({
    this.articleIdeasSearchHistory = const [],
  });

  final List<ArticleIdeasSearchEntry> articleIdeasSearchHistory;

  ArticleIdeasSearchHistoryState copyWith({
    List<ArticleIdeasSearchEntry>? articleIdeasSearchHistory,
  }) =>
      ArticleIdeasSearchHistoryState(
        articleIdeasSearchHistory:
            articleIdeasSearchHistory ?? this.articleIdeasSearchHistory,
      );
}
