import 'package:article_idea_generator/features/article_ideas/data/data_sources/article_ideas_search_data_source.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';
import 'package:article_idea_generator/features/article_ideas/domain/repositories/article_ideas_search_repository.dart';

class ArticleIdeasSearchRepositoryImpl implements ArticleIdeasSearchRepository {
  const ArticleIdeasSearchRepositoryImpl({
    required ArticleIdeasSearchDataSource articleIdeasSearchDataSource,
  }) : _articleIdeasSearchDataSource = articleIdeasSearchDataSource;

  final ArticleIdeasSearchDataSource _articleIdeasSearchDataSource;

  @override
  List<ArticleIdeasSearchEntry> get searchHistory {
    return _articleIdeasSearchDataSource.getSearchHistory();
  }

  @override
  void addSearchEntry(ArticleIdeasSearchEntry entry) {
    return _articleIdeasSearchDataSource.addSearchEntry(entry);
  }

  @override
  void deleteSearchEntry(int index) {
    return _articleIdeasSearchDataSource.deleteSearchEntry(index);
  }

  @override
  List<ArticleIdeasSearchEntry> filterSearchHistory(String query) {
    return _articleIdeasSearchDataSource.filterSearchHistory(query);
  }
}
