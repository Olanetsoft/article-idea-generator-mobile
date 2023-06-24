import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: colorScheme.secondary,
        child: CircleAvatar(
          radius: 19,
          backgroundColor: colorScheme.primary,
          child: Icon(Icons.arrow_forward, color: colorScheme.onPrimary),
        ),
      ),
    );
  }
}
