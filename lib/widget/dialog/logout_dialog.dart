import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management/config/app_constant/string_constant.dart';
import 'package:user_management/modules/authentication/bloc/auth_bloc.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStringConstant.sureToLogout),
      content: const Text(AppStringConstant.logoutDesc),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Close dialog on Cancel
          child: const Text(AppStringConstant.cancel),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(LogoutRequested());
            Navigator.pop(context); // Close dialog on Logout
          },
          child: const Text(AppStringConstant.logout),
        ),
      ],
    );
  }
}

// Usage example (assuming you have a button to trigger the dialog)
void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => LogoutDialog(),
  );
}
