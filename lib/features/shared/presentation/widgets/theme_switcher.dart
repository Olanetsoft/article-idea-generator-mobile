import 'package:article_idea_generator/core/constants/app_colors.dart';
import 'package:article_idea_generator/features/shared/presentation/notifiers/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeNotifierProvider);

    return IconButton(
      icon: themeState == ThemeState.dark
          ? const Icon(
              Icons.sunny,
              color: AppColors.yellow,
            )
          : const Icon(Icons.dark_mode),
      onPressed: ref.watch(themeNotifierProvider.notifier).switchTheme,
    );
  }
}
