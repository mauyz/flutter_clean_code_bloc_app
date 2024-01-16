import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/presentation/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: HomeRoute.page,
        initial: true,
      ),
    ];
  }
}
