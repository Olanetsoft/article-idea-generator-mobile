import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';
import 'package:article_idea_generator/features/article_ideas/domain/repositories/article_ideas_search_repository.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/states/article_ideas_search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasSearchNotifier
    extends StateNotifier<ArticleIdeasSearchState> {
  ArticleIdeasSearchNotifier({
    required this.articleIdeasSearchRepository,
  }) : super(const ArticleIdeasSearchState()) {
    fetchSearchHistory();
  }

  final ArticleIdeasSearchRepository articleIdeasSearchRepository;

  void fetchSearchHistory() async {
    state = state.copyWith(
      articleIdeasSearchHistory: articleIdeasSearchRepository.searchHistory,
    );
  }

  void addSearchEntry(ArticleIdeasSearchEntry entry) async {
    articleIdeasSearchRepository.addSearchEntry(entry);
  }

  void deleteSearchEntry(int index) async {
    articleIdeasSearchRepository.deleteSearchEntry(index);

    fetchSearchHistory();
  }

  void filterSearchHistory(String query) {
    final filtered = articleIdeasSearchRepository.filterSearchHistory(query);

    state = state.copyWith(
      articleIdeasSearchHistory: filtered,
    );
  }
}

final articleIdeasSearchNotifierProvider = StateNotifierProvider.autoDispose<
    ArticleIdeasSearchNotifier, ArticleIdeasSearchState>(
  (ref) => ArticleIdeasSearchNotifier(
    articleIdeasSearchRepository:
        ref.read(articleIdeasSearchRepositoryProvider),
  ),
);
