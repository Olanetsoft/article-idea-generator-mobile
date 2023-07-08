import 'package:article_idea_generator/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    this.onTap,
    this.enabled = true,
    this.busy = false,
  });

  final VoidCallback? onTap;
  final bool busy;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: busy ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: enabled
              ? colorScheme.secondary
              : colorScheme.primary.withOpacity(0.5),
          child: CircleAvatar(
            radius: 19,
            backgroundColor:
                enabled ? colorScheme.primary : AppColors.transparent,
            child: busy
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      color: colorScheme.onPrimary,
                    ),
                  )
                : Icon(Icons.arrow_forward, color: colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
