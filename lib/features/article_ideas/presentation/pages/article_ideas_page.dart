import 'package:article_idea_generator/features/article_ideas/presentation/notifiers/article_ideas_notifier.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/widgets/widgets.dart';
import 'package:article_idea_generator/features/shared/presentation/widgets/widgets.dart';
import 'package:article_idea_generator/core/constants/app_texts.dart';
import 'package:article_idea_generator/core/utilities/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticleIdeasPage extends ConsumerWidget {
  const ArticleIdeasPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              AppTextField(
                hintText: 'What\'s on your mind?',
                prefixIcon: const Icon(Icons.search),
                onChanged: ref
                    .watch(articleIdeasNotifierProvider.notifier)
                    .onTextChanged,
                suffixIcon: SendButton(
                  busy: articleIdeasState.viewState == ViewState.loading,
                  onTap: () {
                    if (articleIdeasState.query == null ||
                        articleIdeasState.query!.isEmpty) {
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
                          .watch(articleIdeasNotifierProvider.notifier)
                          .fetchArticleIdeas();
                    }
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  AppCheckBox(
                    value: articleIdeasState.seoEnabled,
                    onChanged: (value) => ref
                        .watch(articleIdeasNotifierProvider.notifier)
                        .toggleClickbaitFeature(value),
                  ),
                  const Text('Enable SEO & Clickbait Feature'),
                ],
              ),
              const Divider(),
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
