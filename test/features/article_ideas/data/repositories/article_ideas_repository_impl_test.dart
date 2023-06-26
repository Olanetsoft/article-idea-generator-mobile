import 'package:article_idea_generator/features/article_ideas/data/data_sources/article_ideas_data_source.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:article_idea_generator/features/article_ideas/data/repositories/article_ideas_repository_impl.dart';
import 'package:article_idea_generator/features/article_ideas/domain/repositories/article_ideas_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockArticleIdeasDataSource extends Mock
    implements ArticleIdeasDataSource {}

const articleIdeas = [
  ArticleIdea(id: '1', title: 'title 1'),
  ArticleIdea(id: '2', title: 'title 2'),
  ArticleIdea(id: '3', title: 'title 3'),
];

void main() {
  group('ArticleIdeasRepository', () {
    late ArticleIdeasDataSource articleIdeasDataSource;

    setUp(() {
      articleIdeasDataSource = MockArticleIdeasDataSource();

      when(() => articleIdeasDataSource.getArticleIdeas(query: 'query'))
          .thenAnswer(
        (_) async => articleIdeas,
      );
    });

    ArticleIdeasRepository createSubject() => ArticleIdeasRepositoryImpl(
          articleIdeasDataSource: articleIdeasDataSource,
        );

    group('constructor', () {
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('getArticleIdeas', () {
      test('makes correct api request', () async {
        final subject = createSubject();

        expect(subject.getArticleIdeas(query: 'query'), completes);

        verify(() => articleIdeasDataSource.getArticleIdeas(query: 'query'))
            .called(1);
      });

      test('returns list of article ideas', () async {
        final subject = createSubject();

        final result = await subject.getArticleIdeas(query: 'query');

        expect(result, articleIdeas);
      });
    });
  });
}
