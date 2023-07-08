import 'package:article_idea_generator/features/article_ideas/data/data_sources/article_ideas_search_data_source.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';
import 'package:article_idea_generator/features/article_ideas/data/repositories/article_ideas_search_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ArticleIdeasSearchRepository {
  List<ArticleIdeasSearchEntry> get searchHistory;

  void addSearchEntry(ArticleIdeasSearchEntry entry);

  void deleteSearchEntry(int index);

  List<ArticleIdeasSearchEntry> filterSearchHistory(String query);
}

final articleIdeasSearchRepositoryProvider =
    Provider<ArticleIdeasSearchRepository>(
  (ref) => ArticleIdeasSearchRepositoryImpl(
    articleIdeasSearchDataSource:
        ref.read(articleIdeasSearchDataSourceProvider),
  ),
);
