import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/screen/home_page.dart';
import 'package:cross_platform_app/presentation/onboarding/login/screen/login_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: LoginRoute.page,
        path: "/",
      ),
      AutoRoute(
        page: HomeRoute.page,
        path: "/home",
      ),
    ];
  }
}
