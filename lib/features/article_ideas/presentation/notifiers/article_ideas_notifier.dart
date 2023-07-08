import 'package:article_idea_generator/core/utilities/failure.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:article_idea_generator/features/article_ideas/domain/repositories/article_ideas_repository.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/states/article_ideas_state.dart';
import 'package:article_idea_generator/core/utilities/view_state.dart';
import 'package:article_idea_generator/features/shared/domain/repositories/text_data_exchange_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasNotifier extends StateNotifier<ArticleIdeasState> {
  ArticleIdeasNotifier({
    required this.articleIdeaRepository,
    required this.textDataExchangeRepository,
  }) : super(const ArticleIdeasState());

  final ArticleIdeasRepository articleIdeaRepository;
  final TextDataExchangeRepository textDataExchangeRepository;

  void toggleClickbaitFeature(bool? newValue) {
    state = state.copyWith(
      seoEnabled: newValue,
    );
  }

  void fetchArticleIdeas(String query) async {
    try {
      state = state.copyWith(
        viewState: ViewState.loading,
      );

      final articleIdeas = await articleIdeaRepository.getArticleIdeas(
        query: query,
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

  void shareArticleIdea(ArticleIdea articleIdea) {
    textDataExchangeRepository.shareText(articleIdea.title);
  }

  void copyArticleIdea(ArticleIdea articleIdea) {
    textDataExchangeRepository.copyText(articleIdea.title);
  }
}

final articleIdeasNotifierProvider =
    StateNotifierProvider<ArticleIdeasNotifier, ArticleIdeasState>(
  (ref) => ArticleIdeasNotifier(
    articleIdeaRepository: ref.read(articleIdeasRepositoryProvider),
    textDataExchangeRepository: ref.read(textDataExchangeRepositoryProvider),
  ),
);
