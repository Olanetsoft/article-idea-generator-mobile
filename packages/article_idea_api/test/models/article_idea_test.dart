import 'package:article_idea_api/article_idea_api.dart';
import 'package:test/test.dart';

void main() {
  group('ArticleIdea', () {
    const id = 'mock-id';
    const title = 'mock-title';

    test('uses value equality', () {
      expect(
        const ArticleIdea(id: id, title: title),
        equals(const ArticleIdea(id: id, title: title)),
      );
    });
  });
}
