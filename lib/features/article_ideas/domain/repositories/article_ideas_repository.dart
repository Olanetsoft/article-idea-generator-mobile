import 'package:article_idea_generator/features/article_ideas/data/data_sources/article_ideas_data_source.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:article_idea_generator/features/article_ideas/data/repositories/article_ideas_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ArticleIdeasRepository {
  Future<List<ArticleIdea>> getArticleIdeas({required String query});
}

final articleIdeasRepositoryProvider = Provider<ArticleIdeasRepository>(
  (ref) => ArticleIdeasRepositoryImpl(
    articleIdeasDataSource: ref.read(articleIdeasDataSourceProvider),
  ),
);
