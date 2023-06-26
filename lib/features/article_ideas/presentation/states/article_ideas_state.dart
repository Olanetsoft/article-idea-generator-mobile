import 'package:article_idea_generator/core/utilities/failure.dart';
import 'package:article_idea_generator/core/utilities/view_state.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';

class ArticleIdeasState {
  const ArticleIdeasState({
    this.clickbaitFeatureEnabled = false,
    this.viewState = ViewState.idle,
    this.articleIdeas,
    this.query,
  });

  final bool? clickbaitFeatureEnabled;
  final List<ArticleIdea>? articleIdeas;
  final ViewState viewState;
  final String? query;

  ArticleIdeasState copyWith({
    bool? clickbaitFeatureEnabled,
    List<ArticleIdea>? articleIdeas,
    ViewState? viewState,
    String? query,
    Failure? failure,
  }) =>
      ArticleIdeasState(
        clickbaitFeatureEnabled:
            clickbaitFeatureEnabled ?? this.clickbaitFeatureEnabled,
        articleIdeas: articleIdeas ?? this.articleIdeas,
        viewState: viewState ?? this.viewState,
        query: query ?? this.query,
      );
}
