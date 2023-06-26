import 'package:article_idea_generator/core/utilities/failure.dart';
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
    state = state.copyWith(
      seoEnabled: newValue,
    );

    fetchArticleIdeas();
  }

  void fetchArticleIdeas() async {
    try {
      state = state.copyWith(viewState: ViewState.loading);

      final articleIdeas = await articleIdeaRepository.getArticleIdeas(
        query: state.query ?? '',
        seoEnabled: state.seoEnabled,
      );

      state = state.copyWith(
        viewState: ViewState.idle,
        articleIdeas: articleIdeas,
      );
    } on Failure catch (failure) {
      state = state.copyWith(
        viewState: ViewState.idle,
        failure: failure,
      );
    }
  }
}

final articleIdeasNotifierProvider =
    StateNotifierProvider<ArticleIdeasNotifier, ArticleIdeasState>(
  (ref) => ArticleIdeasNotifier(
    articleIdeaRepository: ref.read(articleIdeasRepositoryProvider),
  ),
);
