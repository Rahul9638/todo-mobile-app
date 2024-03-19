import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_management/config/app_constant/global_key.dart';
import 'package:user_management/config/routes/routes.dart';
import 'package:user_management/modules/authentication/view/screen/login.dart';
import 'package:user_management/modules/authentication/view/screen/signup.dart';
import 'package:user_management/modules/authentication/view/screen/splash.dart';
import 'package:user_management/modules/home/screen/view/home_page.dart';
import 'package:user_management/modules/home/screen/view/user_detail_page.dart';
import 'package:user_management/modules/home/screen/view/user_list_page.dart';

GoRouter routesConfiguration = GoRouter(
  initialLocation: '/',
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: AppRoute.login,
            name: AppRoute.login,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginPage();
            },
          ),
          GoRoute(
            path: AppRoute.signup,
            builder: (BuildContext context, GoRouterState state) {
              return const SignupPage();
            },
          ),
          GoRoute(
            path: AppRoute.home,
            name: AppRoute.home,
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: AppRoute.userDetail,
            name: AppRoute.userDetail,
            builder: (BuildContext context, GoRouterState state) {
              return const UserDetailPage();
            },
          ),
          GoRoute(
            path: AppRoute.search,
            name: AppRoute.search,
            builder: (BuildContext context, GoRouterState state) {
              return const UserListingPage();
            },
          ),
        ]),
  ],
);
