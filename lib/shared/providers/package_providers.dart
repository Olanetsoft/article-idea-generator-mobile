import 'package:article_idea_api/article_idea_api.dart';
import 'package:article_idea_repository/article_idea_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final articleIdeaApiProvider = Provider<ArticleIdeaApi>(
  (ref) => FakeArticleIdeaApi(),
);

final articleIdeaRepositoryProvider = Provider<ArticleIdeaRepository>(
  (ref) => ArticleIdeaRepository(
    articleIdeaApi: ref.read(articleIdeaApiProvider),
  ),
);
