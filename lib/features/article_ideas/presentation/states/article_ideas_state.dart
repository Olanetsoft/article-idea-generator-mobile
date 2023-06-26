import 'package:article_idea_generator/core/utilities/failure.dart';
import 'package:article_idea_generator/core/utilities/view_state.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';

class ArticleIdeasState {
  const ArticleIdeasState({
    this.seoEnabled = false,
    this.viewState = ViewState.idle,
    this.articleIdeas,
    this.query,
    this.failure,
  });

  final bool seoEnabled;
  final List<ArticleIdea>? articleIdeas;
  final ViewState viewState;
  final String? query;
  final Failure? failure;

  ArticleIdeasState copyWith({
    bool? seoEnabled,
    List<ArticleIdea>? articleIdeas,
    ViewState? viewState,
    String? query,
    Failure? failure,
  }) =>
      ArticleIdeasState(
        seoEnabled: seoEnabled ?? this.seoEnabled,
        articleIdeas: articleIdeas ?? this.articleIdeas,
        viewState: viewState ?? this.viewState,
        query: query ?? this.query,
        failure: failure ?? this.failure,
      );
}
