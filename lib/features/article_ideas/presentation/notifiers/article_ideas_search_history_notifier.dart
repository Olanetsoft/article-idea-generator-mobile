import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';
import 'package:article_idea_generator/features/article_ideas/domain/repositories/article_ideas_search_history_repository.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/states/article_ideas_search_history_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasSearchHistoryNotifier
    extends StateNotifier<ArticleIdeasSearchHistoryState> {
  ArticleIdeasSearchHistoryNotifier({
    required this.articleIdeasSearchHistoryRepository,
  }) : super(const ArticleIdeasSearchHistoryState()) {
    fetchSearchHistory();
  }

  final ArticleIdeasSearchHistoryRepository articleIdeasSearchHistoryRepository;

  void fetchSearchHistory() async {
    state = state.copyWith(
      articleIdeasSearchHistory:
          articleIdeasSearchHistoryRepository.searchHistory,
    );
  }

  void addSearchEntry(ArticleIdeasSearchEntry entry) async {
    articleIdeasSearchHistoryRepository.addSearchEntry(entry);
  }

  void deleteSearchEntry(int index) async {
    articleIdeasSearchHistoryRepository.deleteSearchEntry(index);

    fetchSearchHistory();
  }

  void filterSearchHistory(String query) {
    final filtered =
        articleIdeasSearchHistoryRepository.filterSearchHistory(query);

    state = state.copyWith(
      articleIdeasSearchHistory: filtered,
    );
  }
}

final articleIdeasSearchNotifierProvider = StateNotifierProvider.autoDispose<
    ArticleIdeasSearchHistoryNotifier, ArticleIdeasSearchHistoryState>(
  (ref) => ArticleIdeasSearchHistoryNotifier(
    articleIdeasSearchHistoryRepository:
        ref.read(articleIdeasSearchHistoryRepositoryProvider),
  ),
);
