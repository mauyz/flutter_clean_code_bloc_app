import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/data/sources/local/token_manager.dart';
import 'package:cross_platform_app/services/dependecy_injection.dart';

class AppGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final authenticated = await getIt.get<TokenManager>().hasToken();
    if (authenticated) {
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
    }
  }
}
