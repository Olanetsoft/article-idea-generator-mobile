import 'package:article_idea_generator/core/utilities/exceptions.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart'
    hide ServerException;

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
    const apiUrl = String.fromEnvironment('apiUrl');

    try {
      final response = await _dio.get(
        '$apiUrl/request?seoEnabled=$seoEnabled',
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

class GeminiArticleIdeasDataSource implements ArticleIdeasDataSource {
  GeminiArticleIdeasDataSource({
    required GenerativeModel model,
  }) : _model = model;

  final GenerativeModel _model;

  @override
  Future<List<ArticleIdea>> getArticleIdeas({
    required String query,
    bool seoEnabled = false,
  }) async {
    try {
      const initialPrompt = String.fromEnvironment('initialPrompt');

      final prompt =
          '$initialPrompt payload: {query: $query, seoEnabled: $seoEnabled}. ';

      final response = await _model.generateContent(
        [Content.text(prompt)],
      );

      if (response.text == null) return [];

      final List<String> splitResult = (response.text as String).split('\n');

      return splitResult
          .map((result) => ArticleIdea(title: result.replaceAll('- ', '')))
          .toList();
    } on FormatException catch (ex) {
      throw ServerException(ex.message);
    } catch (ex) {
      throw const ServerException('Something went wrong');
    }
  }
}

final articleIdeasDataSourceProvider = Provider<ArticleIdeasDataSource>(
  (ref) => GeminiArticleIdeasDataSource(
    model: GenerativeModel(
      model: 'gemini-pro',
      apiKey: const String.fromEnvironment('geminiApiKey'),
    ),
  ),
);
