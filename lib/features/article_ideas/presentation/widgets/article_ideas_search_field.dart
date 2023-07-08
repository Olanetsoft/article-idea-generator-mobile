import 'package:article_idea_generator/core/constants/app_colors.dart';
import 'package:article_idea_generator/core/constants/app_texts.dart';
import 'package:article_idea_generator/features/shared/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ArticleIdeasSearchField extends StatelessWidget {
  const ArticleIdeasSearchField({
    super.key,
    this.onChanged,
    this.action,
    this.leading,
    this.controller,
  }) : enabled = false;

  const ArticleIdeasSearchField.enabled({
    super.key,
    this.onChanged,
    this.action,
    this.leading,
    this.controller,
  }) : enabled = true;

  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Widget? leading;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AppTexts.ideasSearchFieldTag,
      child: Material(
        color: AppColors.transparent,
        child: AppTextField(
          controller: controller,
          autofocus: enabled,
          enabled: enabled,
          hintText: AppTexts.ideasSearchFieldHint,
          prefixIcon: leading,
          onChanged: onChanged,
          suffixIcon: action,
        ),
      ),
    );
  }
}
