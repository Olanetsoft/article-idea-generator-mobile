import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    this.onTap,
    this.busy = false,
  });

  final VoidCallback? onTap;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: busy ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: colorScheme.secondary,
          child: CircleAvatar(
            radius: 19,
            backgroundColor: colorScheme.primary,
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
