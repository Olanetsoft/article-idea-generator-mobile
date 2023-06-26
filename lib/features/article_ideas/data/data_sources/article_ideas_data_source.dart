import 'package:article_idea_generator/core/utilities/exceptions.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ArticleIdeasDataSource {
  Future<List<ArticleIdea>> getArticleIdeas({
    required String query,
    bool seoEnabled,
  });
}

class DioArticleIdeasDataSource implements ArticleIdeasDataSource {
  DioArticleIdeasDataSource({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<ArticleIdea>> getArticleIdeas({
    required String query,
    bool seoEnabled = false,
  }) async {
    try {
      final response = await _dio.get(
        'https://www.articleideagenerator.com/api/request?seoEnabled=$seoEnabled',
        data: {
          'prompt': query,
        },
      );

      final List<String> splitResult =
          (response.data['result'] as String).split('\n');

      final articleIdeas =
          splitResult.map((result) => ArticleIdea(title: result)).toList();

      return articleIdeas;
    } on DioException catch (ex) {
      if (ex.response != null) {
        throw ServerException(ex.response?.data['error']);
      } else {
        throw ServerException(ex.message ?? '');
      }
    } catch (ex) {
      throw const ServerException('Something went wrong');
    }
  }
}

final articleIdeasDataSourceProvider = Provider<ArticleIdeasDataSource>(
  (ref) => DioArticleIdeasDataSource(
    dio: Dio(),
  ),
);
