import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/widgets/article_idea_item.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/widgets/share_article_idea_on_twitter_button.dart';
import 'package:flutter/material.dart';

class ArticleIdeasListView extends StatelessWidget {
  const ArticleIdeasListView({
    super.key,
    required this.articleIdeas,
  });

  final List<ArticleIdea> articleIdeas;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          separatorBuilder: (context, index) => const Divider(thickness: 0.2),
          itemCount: articleIdeas.length,
          itemBuilder: (context, index) => ArticleIdeaItem(
            articleIdea: articleIdeas[index],
          ),
        ),
        const Positioned.fill(
          top: null,
          child: ShareArticleIdeaOnTwitterButton(),
        ),
      ],
    );
  }
}
