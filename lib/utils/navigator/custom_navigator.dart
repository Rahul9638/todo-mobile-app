import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigator {
  CustomNavigator._internal();

  static void pushAndRemoveUntil(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    while (context.canPop()) {
      context.pop();
    }
    GoRouter.of(context).pushReplacementNamed(name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra);
  }

  static void goNamedAndRemoveUntil(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    while (context.canPop()) {
      context.pop();
    }
    GoRouter.of(context).goNamed(name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra);
  }
}
