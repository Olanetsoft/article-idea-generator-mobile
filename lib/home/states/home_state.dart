import 'package:article_idea_generator/shared/utilities/failure.dart';
import 'package:article_idea_generator/shared/utilities/view_state.dart';
import 'package:article_idea_repository/article_idea_repository.dart';

class HomeState {
  const HomeState({
    this.clickbaitFeatureEnabled = false,
    this.viewState = ViewState.idle,
    this.articleIdeas,
    this.query,
  });

  final bool? clickbaitFeatureEnabled;
  final List<ArticleIdea>? articleIdeas;
  final ViewState viewState;
  final String? query;

  HomeState copyWith({
    bool? clickbaitFeatureEnabled,
    List<ArticleIdea>? articleIdeas,
    ViewState? viewState,
    String? query,
    Failure? failure,
  }) =>
      HomeState(
        clickbaitFeatureEnabled:
            clickbaitFeatureEnabled ?? this.clickbaitFeatureEnabled,
        articleIdeas: articleIdeas ?? this.articleIdeas,
        viewState: viewState ?? this.viewState,
        query: query ?? this.query,
      );
}
