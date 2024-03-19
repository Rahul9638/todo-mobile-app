import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message,
      {Duration? duration, EdgeInsets? margin}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: margin,
        content: Text(message),
        duration: duration ?? const Duration(seconds: 3),
      ),
    );
  }

  static void snackBarWithAction(BuildContext context,
      {required String message, required VoidCallback onPressed}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Row(
          children: <Widget>[
            Icon(
              Icons.info,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            const SizedBox(width: 8),
            Text(message),
          ],
        ),
        action: SnackBarAction(
          label: 'Retry',
          textColor: Theme.of(context).colorScheme.onPrimary,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
