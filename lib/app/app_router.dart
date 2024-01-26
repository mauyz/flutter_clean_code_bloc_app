import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/home/home_page.dart';
import 'package:cross_platform_app/presentation/dashboard/profile/profile_page.dart';
import 'package:cross_platform_app/presentation/dashboard/users/users_list_page.dart';
import 'package:cross_platform_app/presentation/onboarding/login/login_page.dart';
import 'package:cross_platform_app/presentation/onboarding/register/register_page.dart';
import 'package:cross_platform_app/presentation/onboarding/splash/splash_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: SplashRoute.page,
        path: "/",
      ),
      AutoRoute(
        page: LoginRoute.page,
        path: "/login",
      ),
      AutoRoute(
        page: RegisterRoute.page,
        path: "/register",
      ),
      AutoRoute(
        page: HomeRoute.page,
        path: "/home",
        children: [
          RedirectRoute(
            path: "",
            redirectTo: "users",
          ),
          AutoRoute(
            page: UsersListRoute.page,
            path: "users",
          ),
          AutoRoute(
            page: ProfileRoute.page,
            path: "profile",
          ),
        ],
      ),
    ];
  }
}
