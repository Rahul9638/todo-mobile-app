import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management/modules/authentication/bloc/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(AppOnBoardingRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: theme.colorScheme.tertiary),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    ));
  }
}
