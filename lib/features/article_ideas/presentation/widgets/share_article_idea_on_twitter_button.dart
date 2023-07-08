import 'package:article_idea_generator/features/article_ideas/presentation/notifiers/article_ideas_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShareArticleIdeaOnTwitterButton extends ConsumerWidget {
  const ShareArticleIdeaOnTwitterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            ref
                .read(articleIdeasNotifierProvider.notifier)
                .shareArticleIdeaOnTwitter();
          },
          child: const Text('Share on Twitter'),
        ),
      ),
    );
  }
}
