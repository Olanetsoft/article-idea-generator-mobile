import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ArticleIdeasDataSource {
  Future<List<ArticleIdea>> getArticleIdeas({required String query});
}

class FakeArticleIdeasDataSource implements ArticleIdeasDataSource {
  @override
  Future<List<ArticleIdea>> getArticleIdeas({required String query}) async {
    await Future.delayed(const Duration(seconds: 2));

    return const <ArticleIdea>[
      ArticleIdea(
        id: '1',
        title:
            'A Look Into the Future of Programming: Emerging Technologies and Trends',
      ),
      ArticleIdea(
        id: '2',
        title: 'How to Learn Programming from Scratch: A Beginner\'s Guide',
      ),
      ArticleIdea(
        id: '3',
        title: 'The Advantages of Learning Python for Programming',
      ),
      ArticleIdea(
        id: '4',
        title: 'Top Programming Languages to Master in 2021',
      ),
    ];
  }
}

final articleIdeasDataSourceProvider = Provider<ArticleIdeasDataSource>(
  (ref) => FakeArticleIdeasDataSource(),
);
