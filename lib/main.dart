import 'package:article_idea_generator/article_idea_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(
    const ProviderScope(
      child: ArticleIdeaGenerator(),
    ),
  );
}
