import 'package:article_idea_generator/article_idea_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ArticleIdeaGenerator(),
    ),
  );
}
