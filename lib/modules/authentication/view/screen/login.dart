import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_management/config/routes/routes.dart';
import 'package:user_management/modules/authentication/bloc/auth_bloc.dart';
import 'package:user_management/utils/form_validator.dart';
import 'package:user_management/widget/dialog/ciruclar_progress_indicator.dart';
import 'package:user_management/widget/dialog/custom_snackbar.dart';
import 'package:user_management/widget/textfield/custom_text_form_field.dart';
import 'package:user_management/widget/textfield/input_field_decoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;
  BehaviorSubject<bool> valid = BehaviorSubject<bool>.seeded(false);

  @override
  void dispose() {
    valid.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state is LoginSuccess) {
            context.pop();
            context.pushReplacementNamed(AppRoute.home);
          }
          if (state is LoginLoading) {
            circularProgressIndicator(context);
          }
          if (state is LoginError) {
            context.pop();
            CustomSnackbar.show(context, 'Something went wrong');
          }
        },
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.person, size: 56),
                Text(
                  'Welcome Back',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  'Please sign in to your account',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 20.0),
                InputTextField(
                  controller: emailController,
                  validation: (String? value) {
                    String? error = FormValidator.validateEmail(value);
                    if (error == null) {
                      valid.add(true);
                    } else {
                      valid.add(false);
                    }
                    return error;
                  },
                  decoration: CustomInputDecoration.outlineInputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'example@gmail.com',
                      labelText: 'Email'),
                ),
                const SizedBox(height: 20.0),
                InputTextField(
                  maxLines: 1,
                  controller: passwordController,
                  obscureText: hidePassword,
                  validation: (String? val) {
                    final String? error = FormValidator.validatePassword(val);
                    if (error == null) {
                      valid.add(true);
                    } else {
                      valid.add(false);
                    }
                    return error;
                  },
                  decoration: CustomInputDecoration.outlineInputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            hidePassword = !hidePassword;
                            setState(() {});
                          },
                          icon: !hidePassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off)),
                      hintText: 'Password',
                      labelText: 'Password'),
                ),
                const SizedBox(height: 20),
                StreamBuilder<bool>(
                    stream: valid.stream,
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      return FilledButton(
                          onPressed:
                              validateButton(snapshot) ? loginRequested : null,
                          child: const Text('Sign In'));
                    }),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginRequested() {
    BlocProvider.of<AuthBloc>(context).add(LoginRequested(
        email: emailController.text, password: passwordController.text));
  }

  bool validateButton(AsyncSnapshot<bool> snapshot) {
    return snapshot.hasData &&
        snapshot.data! &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }
}
