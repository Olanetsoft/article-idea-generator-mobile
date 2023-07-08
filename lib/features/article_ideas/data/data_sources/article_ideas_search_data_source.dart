import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

const articleIdeasSearchKey = 'articleIdeasSearchKey';

abstract class ArticleIdeasSearchDataSource {
  List<ArticleIdeasSearchEntry> getSearchHistory();

  void addSearchEntry(ArticleIdeasSearchEntry entry);

  void deleteSearchEntry(int index);

  List<ArticleIdeasSearchEntry> filterSearchHistory(String query);
}

class GetStorageArticleIdeasSearchDataSource
    implements ArticleIdeasSearchDataSource {
  GetStorageArticleIdeasSearchDataSource({
    required GetStorage storage,
    int? maxResults,
  })  : _storage = storage,
        _maxResults = maxResults ?? 20;

  final GetStorage _storage;
  final int _maxResults;

  @override
  List<ArticleIdeasSearchEntry> getSearchHistory() {
    final results = _storage.read<List<dynamic>>(articleIdeasSearchKey) ?? [];

    return results.map((text) => ArticleIdeasSearchEntry(text: text)).toList();
  }

  @override
  void addSearchEntry(ArticleIdeasSearchEntry entry) {
    final results = _storage.read<List<dynamic>>(articleIdeasSearchKey) ?? [];
    if (results.contains(entry.text)) results.remove(entry.text);
    if (results.length >= _maxResults) results.removeLast();
    results.insert(0, entry.text);
    _storage.write(articleIdeasSearchKey, results);
  }

  @override
  void deleteSearchEntry(int index) {
    final results = _storage.read<List<dynamic>>(articleIdeasSearchKey) ?? [];
    if (index >= 0 && index < results.length) {
      results.removeAt(index);
      _storage.write(articleIdeasSearchKey, results);
    }
  }

  @override
  List<ArticleIdeasSearchEntry> filterSearchHistory(String query) {
    final results = _storage.read<List<dynamic>>(articleIdeasSearchKey) ?? [];
    final normalizedSearchText = query.toLowerCase();

    return results.map((text) => ArticleIdeasSearchEntry(text: text)).where(
      (result) {
        final normalizedResult = result.text.toLowerCase();
        return normalizedResult.contains(normalizedSearchText);
      },
    ).toList();
  }
}

final articleIdeasSearchDataSourceProvider =
    Provider<ArticleIdeasSearchDataSource>(
  (ref) => GetStorageArticleIdeasSearchDataSource(
    storage: GetStorage(),
  ),
);
