import 'package:article_idea_api/article_idea_api.dart';
import 'package:article_idea_repository/src/article_idea_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockArticleIdeaApi extends Mock implements ArticleIdeaApi {}

const articleIdeas = [
  ArticleIdea(id: '1', title: 'title 1'),
  ArticleIdea(id: '2', title: 'title 2'),
  ArticleIdea(id: '3', title: 'title 3'),
];

void main() {
  group('ArticleIdeaRepository', () {
    late ArticleIdeaApi articleIdeaApi;

    setUp(() {
      articleIdeaApi = MockArticleIdeaApi();

      when(() => articleIdeaApi.getArticleIdeas(query: 'query')).thenAnswer(
        (_) async => articleIdeas,
      );
    });

    ArticleIdeaRepository createSubject() => ArticleIdeaRepository(
          articleIdeaApi: articleIdeaApi,
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

        verify(() => articleIdeaApi.getArticleIdeas(query: 'query')).called(1);
      });

      test('returns list of article ideas', () async {
        final subject = createSubject();

        final result = await subject.getArticleIdeas(query: 'query');

        expect(result, articleIdeas);
      });
    });
  });
}
