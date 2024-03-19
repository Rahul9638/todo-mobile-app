import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

Future<void> circularProgressIndicator(BuildContext context) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CustomCircularProgressIndicator();
      });
}
