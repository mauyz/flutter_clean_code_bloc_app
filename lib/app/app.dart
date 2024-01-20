import 'package:cross_platform_app/app/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      /*home: AnimatedSplashScreen(
        animationDuration: const Duration(seconds: 2),
        splashTransition: SplashTransition.slideTransition,
        splash: Image.asset(
          Assets.assetsIcLauncher,
        ),
        disableNavigation: true,
        nextScreen: MaterialApp.router(
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
        ),
      ),*/
    );
  }
}
