import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ArticleIdea', () {
    const title = 'mock-title';

    test('uses value equality', () {
      expect(
        const ArticleIdea(title: title),
        equals(const ArticleIdea(title: title)),
      );
    });
  });
}
