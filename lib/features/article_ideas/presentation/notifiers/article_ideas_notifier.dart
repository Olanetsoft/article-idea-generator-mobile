import 'package:article_idea_generator/features/article_ideas/domain/repositories/article_ideas_repository.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/states/article_ideas_state.dart';
import 'package:article_idea_generator/core/utilities/view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasNotifier extends StateNotifier<ArticleIdeasState> {
  ArticleIdeasNotifier({
    required this.articleIdeaRepository,
  }) : super(const ArticleIdeasState());

  final ArticleIdeasRepository articleIdeaRepository;

  void onTextChanged(String newValue) {
    state = state.copyWith(query: newValue);
  }

  void toggleClickbaitFeature(bool? newValue) {
    state = state.copyWith(clickbaitFeatureEnabled: newValue);
  }

  void fetchArticleIdeas() async {
    state = state.copyWith(viewState: ViewState.loading);

    final articleIdeas =
        await articleIdeaRepository.getArticleIdeas(query: state.query ?? '');

    state = state.copyWith(
      viewState: ViewState.idle,
      articleIdeas: articleIdeas,
    );
  }
}

final articleIdeasNotifierProvider =
    StateNotifierProvider<ArticleIdeasNotifier, ArticleIdeasState>(
  (ref) => ArticleIdeasNotifier(
    articleIdeaRepository: ref.read(articleIdeasRepositoryProvider),
  ),
);
