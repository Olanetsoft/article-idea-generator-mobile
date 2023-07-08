import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.autofocus = false,
    this.enabled,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.controller,
  });

  final bool autofocus;
  final bool? enabled;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autofocus,
      enabled: enabled,
      cursorWidth: 1,
      cursorHeight: 20,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
