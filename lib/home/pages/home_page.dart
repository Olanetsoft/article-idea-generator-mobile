import 'package:article_idea_generator/home/notifiers/home_notifier.dart';
import 'package:article_idea_generator/home/widgets/app_check_box.dart';
import 'package:article_idea_generator/home/widgets/app_text_field.dart';
import 'package:article_idea_generator/home/widgets/send_button.dart';
import 'package:article_idea_generator/home/widgets/theme_switcher.dart';
import 'package:article_idea_generator/shared/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const ThemeSwitcher(),
          title: const Text(AppTexts.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16.0),
              const AppTextField(
                hintText: 'What\'s on your mind?',
                prefixIcon: Icon(Icons.search),
                suffixIcon: SendButton(),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  AppCheckBox(
                    value: homeState.clickbaitFeatureEnabled,
                    onChanged: (value) => ref
                        .watch(homeNotifierProvider.notifier)
                        .toggleClickbaitFeature(value),
                  ),
                  const Text('Enable SEO & Clickbait Feature'),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
