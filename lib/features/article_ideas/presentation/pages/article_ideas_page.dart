import 'package:article_idea_generator/features/article_ideas/presentation/notifiers/article_ideas_notifier.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/pages/article_ideas_search_page.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/widgets/widgets.dart';
import 'package:article_idea_generator/features/shared/presentation/widgets/widgets.dart';
import 'package:article_idea_generator/core/constants/app_texts.dart';
import 'package:article_idea_generator/core/utilities/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasPage extends ConsumerStatefulWidget {
  const ArticleIdeasPage({super.key});

  @override
  ConsumerState<ArticleIdeasPage> createState() => _ArticleIdeasPageState();
}

class _ArticleIdeasPageState extends ConsumerState<ArticleIdeasPage> {
  late final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final articleIdeasState = ref.watch(articleIdeasNotifierProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppTexts.title),
          actions: const [ThemeSwitcher()],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () async {
                  final searchQuery = await Navigator.of(context).push<String?>(
                    MaterialPageRoute(
                      builder: (_) => ArticleIdeasSearchPage(
                        initialSearchQuery: searchController.text,
                      ),
                    ),
                  );

                  if (searchQuery != null) {
                    searchController.text = searchQuery;

                    ref
                        .watch(articleIdeasNotifierProvider.notifier)
                        .fetchArticleIdeas(searchController.text);
                  }
                },
                child: ArticleIdeasSearchField(
                  leading: const Icon(Icons.search),
                  action: SendButton(
                    busy: articleIdeasState.viewState == ViewState.loading,
                  ),
                  controller: searchController,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  AppCheckBox(
                    value: articleIdeasState.seoEnabled,
                    onChanged: (value) {
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
                        final notifier =
                            ref.watch(articleIdeasNotifierProvider.notifier);

                        notifier.toggleClickbaitFeature(value);
                        notifier.fetchArticleIdeas(searchController.text);
                      }
                    },
                  ),
                  const Text('Enable SEO & Clickbait Feature'),
                ],
              ),
              const Divider(thickness: 0.2),
              if (articleIdeasState.viewState == ViewState.loading)
                const Expanded(
                  child: ArticleIdeasLoadingView(),
                )
              else if (articleIdeasState.articleIdeas != null)
                Expanded(
                  child: ArticleIdeasListView(
                    articleIdeas: articleIdeasState.articleIdeas!,
                  ),
                )
              else if (articleIdeasState.failure != null)
                Expanded(
                  child: Text(articleIdeasState.failure!.message),
                )
            ],
          ),
        ),
      ),
    );
  }
}
