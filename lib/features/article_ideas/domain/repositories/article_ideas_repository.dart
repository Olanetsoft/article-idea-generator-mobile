import 'package:article_idea_generator/core/utilities/exceptions.dart';
import 'package:article_idea_generator/core/utilities/failures.dart';
import 'package:article_idea_generator/features/article_ideas/data/data_sources/article_ideas_data_source.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasRepository {
  const ArticleIdeasRepository({
    required ArticleIdeasDataSource articleIdeasDataSource,
  }) : _articleIdeasDataSource = articleIdeasDataSource;

  final ArticleIdeasDataSource _articleIdeasDataSource;

  Future<List<ArticleIdea>> getArticleIdeas({
    required String query,
    bool seoEnabled = false,
  }) async {
    try {
      return await _articleIdeasDataSource.getArticleIdeas(
        query: query,
        seoEnabled: seoEnabled,
      );
    } on ServerException catch (ex) {
      throw GetArticleIdeasFailure(ex.message);
    }
  }
}

final articleIdeasRepositoryProvider = Provider<ArticleIdeasRepository>(
  (ref) => ArticleIdeasRepository(
    articleIdeasDataSource: ref.read(articleIdeasDataSourceProvider),
  ),
);
