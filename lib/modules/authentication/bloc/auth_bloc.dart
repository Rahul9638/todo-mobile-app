import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_management/config/app_constant/global_key.dart';
import 'package:user_management/config/app_constant/shared_prefs_constant.dart';
import 'package:user_management/config/routes/routes.dart';
import 'package:user_management/data/model/response_modal/login_success_response.dart';
import 'package:user_management/data/repository/auth_repository.dart';
import 'package:user_management/utils/custom_shared_prefs.dart';
import 'package:user_management/utils/navigator/custom_navigator.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEvent>((AuthEvent event, Emitter<AuthState> emit) async {
      if (event is LoginRequested) {
        await handleLogin(event, emit);
      }
      if (event is AppOnBoardingRequested) {
        await handleOnBoarding();
      }
      if (event is LogoutRequested) {
        await handleLogout();
      }
    });
  }

  Future<void> handleLogout() async {
    await sharedPrefs.clearPrefs().then((void value) {
      CustomNavigator.pushAndRemoveUntil(
          navigatorKey.currentContext!, AppRoute.login);
    });
  }

  Future<void> handleOnBoarding() async {
    try {
      final bool isLoggin =
          await sharedPrefs.readBoolPrefs(SharedPrefsConstant.loggedIn) ??
              false;
      if (isLoggin) {
        CustomNavigator.pushAndRemoveUntil(
            navigatorKey.currentContext!, AppRoute.home);
      } else {
        navigatorKey.currentContext!.pushReplacementNamed(AppRoute.login);
      }
    } catch (e) {
      navigatorKey.currentContext!.pushReplacementNamed(AppRoute.login);
    }
  }

  Future<void> handleLogin(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(LoginLoading());
    try {
      await authRepository
          .signIn(event.email, event.password)
          .then((LoginSuccessResponse value) {
        sharedPrefs.addBoolPrefs(SharedPrefsConstant.loggedIn, true);
        emit(LoginSuccess());
      });
    } catch (e) {
      debugPrint('catched is called $e');
      emit(LoginError());
    }
  }

  final CustomSharedPrefs sharedPrefs = CustomSharedPrefs.instance;
  final AuthRepository authRepository;
}
