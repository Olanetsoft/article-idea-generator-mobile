import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    required this.value,
    this.onChanged,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      side: MaterialStateBorderSide.resolveWith(
        (_) => BorderSide(width: 2.0, color: colorScheme.primary),
      ),
      value: value,
      activeColor: Colors.transparent,
      checkColor: colorScheme.primary,
      onChanged: onChanged,
    );
  }
}
