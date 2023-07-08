import 'package:article_idea_generator/features/article_ideas/data/models/article_ideas_search_entry.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/notifiers/article_ideas_search_notifier.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/widgets/article_ideas_search_field.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/widgets/article_ideas_search_history_list_view.dart';
import 'package:article_idea_generator/features/shared/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasSearchPage extends ConsumerStatefulWidget {
  const ArticleIdeasSearchPage({
    super.key,
    required this.initialSearchQuery,
  });

  final String initialSearchQuery;

  @override
  ConsumerState<ArticleIdeasSearchPage> createState() =>
      _ArticleIdeasSearchPageState();
}

class _ArticleIdeasSearchPageState
    extends ConsumerState<ArticleIdeasSearchPage> {
  late final TextEditingController searchController = TextEditingController(
    text: widget.initialSearchQuery,
  );

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final articleIdeasSearchState =
        ref.watch(articleIdeasSearchNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: ArticleIdeasSearchField.enabled(
          controller: searchController,
          onChanged: (query) => ref
              .read(articleIdeasSearchNotifierProvider.notifier)
              .filterSearchHistory(query),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
          ),
          action: SendButton(
            enabled: searchController.text.isNotEmpty,
            onTap: () {
              if (searchController.text.isEmpty) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('Input what\'s on your mind'),
                    ),
                  );
              } else {
                ref
                    .read(articleIdeasSearchNotifierProvider.notifier)
                    .addSearchEntry(
                      ArticleIdeasSearchEntry(text: searchController.text),
                    );

                Navigator.of(context).pop(searchController.text);
              }
            },
          ),
        ),
      ),
      body: articleIdeasSearchState.articleIdeasSearchHistory.isEmpty
          ? const SizedBox()
          : ArticleIdeasSearchHistoryListView(
              articleIdeasSearchHistory:
                  articleIdeasSearchState.articleIdeasSearchHistory,
            ),
    );
  }
}
