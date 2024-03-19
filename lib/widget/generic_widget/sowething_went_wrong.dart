import 'package:flutter/material.dart';
import 'package:user_management/config/app_constant/string_constant.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Text(AppStringConstant.somethingWentWrong),
            const SizedBox(height: 20),
            FilledButton(onPressed: onPressed, child: const Text('Reload')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
