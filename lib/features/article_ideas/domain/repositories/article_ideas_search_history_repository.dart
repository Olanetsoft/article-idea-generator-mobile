import 'package:article_idea_generator/features/article_ideas/data/data_sources/article_ideas_search_history_data_source.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasSearchHistoryRepository {
  const ArticleIdeasSearchHistoryRepository({
    required ArticleIdeasSearchHistoryDataSource
        articleIdeasSearchHistoryDataSource,
  }) : _articleIdeasSearchHistoryDataSource =
            articleIdeasSearchHistoryDataSource;

  final ArticleIdeasSearchHistoryDataSource
      _articleIdeasSearchHistoryDataSource;

  List<ArticleIdeasSearchEntry> get searchHistory {
    return _articleIdeasSearchHistoryDataSource.getSearchHistory();
  }

  void addSearchEntry(ArticleIdeasSearchEntry entry) {
    return _articleIdeasSearchHistoryDataSource.addSearchEntry(entry);
  }

  void deleteSearchEntry(int index) {
    return _articleIdeasSearchHistoryDataSource.deleteSearchEntry(index);
  }

  List<ArticleIdeasSearchEntry> filterSearchHistory(String query) {
    return _articleIdeasSearchHistoryDataSource.filterSearchHistory(query);
  }
}

final articleIdeasSearchHistoryRepositoryProvider =
    Provider<ArticleIdeasSearchHistoryRepository>(
  (ref) => ArticleIdeasSearchHistoryRepository(
    articleIdeasSearchHistoryDataSource:
        ref.read(articleIdeasSearchDataSourceProvider),
  ),
);
