import 'package:article_idea_generator/home/widgets/app_check_box.dart';
import 'package:article_idea_generator/home/widgets/app_text_field.dart';
import 'package:article_idea_generator/home/widgets/send_button.dart';
import 'package:article_idea_generator/home/widgets/theme_switcher.dart';
import 'package:article_idea_generator/shared/constants/app_texts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _clickbaitFeatureEnabled = ValueNotifier<bool?>(false);

  @override
  void dispose() {
    _clickbaitFeatureEnabled.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  ValueListenableBuilder(
                    valueListenable: _clickbaitFeatureEnabled,
                    builder: (context, value, __) => AppCheckBox(
                      value: value,
                      onChanged: (newValue) =>
                          _clickbaitFeatureEnabled.value = newValue,
                    ),
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
