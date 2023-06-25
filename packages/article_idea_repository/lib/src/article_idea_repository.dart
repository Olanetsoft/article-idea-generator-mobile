import 'package:article_idea_api/article_idea_api.dart';

class ArticleIdeaRepository {
  const ArticleIdeaRepository({
    required ArticleIdeaApi articleIdeaApi,
  }) : _articleIdeaApi = articleIdeaApi;

  final ArticleIdeaApi _articleIdeaApi;

  Future<List<ArticleIdea>> getArticleIdeas({required String query}) {
    return _articleIdeaApi.getArticleIdeas(query: query);
  }
}
