import 'package:article_idea_generator/features/article_ideas/data/models/article_idea.dart';
import 'package:article_idea_generator/features/article_ideas/presentation/widgets/article_idea_item.dart';
import 'package:flutter/material.dart';

class ArticleIdeasListView extends StatelessWidget {
  const ArticleIdeasListView({
    super.key,
    required this.articleIdeas,
  });

  final List<ArticleIdea> articleIdeas;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      separatorBuilder: (context, index) => const Divider(),
      itemCount: articleIdeas.length,
      itemBuilder: (context, index) => ArticleIdeaItem(
        articleIdea: articleIdeas[index],
      ),
    );
  }
}
