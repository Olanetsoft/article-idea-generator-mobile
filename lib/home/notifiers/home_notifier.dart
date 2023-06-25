import 'package:article_idea_generator/home/states/home_state.dart';
import 'package:article_idea_generator/shared/providers/package_providers.dart';
import 'package:article_idea_generator/shared/utilities/view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:article_idea_repository/article_idea_repository.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier({
    required this.articleIdeaRepository,
  }) : super(const HomeState());

  final ArticleIdeaRepository articleIdeaRepository;

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

final homeNotifierProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(
    articleIdeaRepository: ref.read(articleIdeaRepositoryProvider),
  ),
);
