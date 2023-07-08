import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';

class ArticleIdeasSearchState {
  const ArticleIdeasSearchState({
    this.articleIdeasSearchHistory = const [],
  });

  final List<ArticleIdeasSearchEntry> articleIdeasSearchHistory;

  ArticleIdeasSearchState copyWith({
    List<ArticleIdeasSearchEntry>? articleIdeasSearchHistory,
  }) =>
      ArticleIdeasSearchState(
        articleIdeasSearchHistory:
            articleIdeasSearchHistory ?? this.articleIdeasSearchHistory,
      );
}
