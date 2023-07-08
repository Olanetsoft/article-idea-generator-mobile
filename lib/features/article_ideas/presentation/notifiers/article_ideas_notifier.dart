import 'dart:math';

import 'package:article_idea_generator/core/constants/app_texts.dart';
import 'package:article_idea_generator/core/utilities/failure.dart';
import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:article_idea_generator/features/article_ideas/domain/repositories/article_ideas_repository.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/states/article_ideas_state.dart';
import 'package:article_idea_generator/core/utilities/view_state.dart';
import 'package:article_idea_generator/features/shared/domain/repositories/social_share_repository.dart';
import 'package:article_idea_generator/features/shared/domain/repositories/text_data_exchange_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasNotifier extends StateNotifier<ArticleIdeasState> {
  ArticleIdeasNotifier({
    required this.articleIdeaRepository,
    required this.textDataExchangeRepository,
    required this.socialShareRepository,
  }) : super(const ArticleIdeasState());

  final ArticleIdeasRepository articleIdeaRepository;
  final TextDataExchangeRepository textDataExchangeRepository;
  final SocialShareRepository socialShareRepository;

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

  void shareArticleIdeaOnTwitter() {
    final randomIndex = Random().nextInt(AppTexts.marketingTweets.length);

    socialShareRepository.shareTwitter(
      AppTexts.marketingTweets[randomIndex],
      hashtags: ['ArticleIdeaGenerator'],
      url: 'https://www.articleideagenerator.com',
    );
  }
}

final articleIdeasNotifierProvider =
    StateNotifierProvider<ArticleIdeasNotifier, ArticleIdeasState>(
  (ref) => ArticleIdeasNotifier(
    articleIdeaRepository: ref.read(articleIdeasRepositoryProvider),
    textDataExchangeRepository: ref.read(textDataExchangeRepositoryProvider),
    socialShareRepository: ref.read(socialShareRepositoryProvider),
  ),
);
