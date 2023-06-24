import 'package:article_idea_generator/shared/constants/app_texts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTexts.title),
      ),
      body: const SizedBox(),
    );
  }
}
