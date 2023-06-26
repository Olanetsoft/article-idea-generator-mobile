import 'package:article_idea_generator/features/article_ideas/data/data_sources/article_ideas_data_source.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:article_idea_generator/features/article_ideas/domain/repositories/article_ideas_repository.dart';

class ArticleIdeasRepositoryImpl implements ArticleIdeasRepository {
  const ArticleIdeasRepositoryImpl({
    required ArticleIdeasDataSource articleIdeasDataSource,
  }) : _articleIdeasDataSource = articleIdeasDataSource;

  final ArticleIdeasDataSource _articleIdeasDataSource;

  @override
  Future<List<ArticleIdea>> getArticleIdeas({required String query}) {
    return _articleIdeasDataSource.getArticleIdeas(query: query);
  }
}
