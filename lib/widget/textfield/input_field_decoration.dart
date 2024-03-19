import 'package:flutter/material.dart';
import 'package:user_management/config/app_constant/global_key.dart';

class CustomInputDecoration {
  CustomInputDecoration._internal();
  static InputDecoration outlineInputDecoration(
      {String? labelText,
      Widget? suffixIcon,
      String? hintText,
      Widget? prefixIcon,
      String? helperText,
      String? prefixText,
      bool enable = true,
      InputBorder? focusBorder}) {
    final ThemeData theme = Theme.of(navigatorKey.currentContext!);
    return InputDecoration(
      enabled: enable,
      errorMaxLines: 2,
      prefixText: prefixText,
      helperMaxLines: 3,
      counterText: '',
      hintText: hintText,
      hintStyle: theme.textTheme.bodyLarge
          ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
      labelText: labelText,
      helperText: helperText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.primary),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: focusBorder ??
          OutlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary),
            borderRadius: BorderRadius.circular(4),
          ),
    );
  }

  static InputDecoration filledDecoration({
    String? labelText,
    Widget? suffixIcon,
    String? hintText,
    Widget? prefixIcon,
    String? helperText,
  }) {
    final ThemeData theme = Theme.of(navigatorKey.currentContext!);
    return InputDecoration(
      filled: true,
      hintText: hintText,
      labelText: labelText,
      helperText: helperText,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.primary),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: theme.colorScheme.primary),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
