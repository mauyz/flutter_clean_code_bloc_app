import 'package:cross_platform_app/generated/assets.dart';
import 'package:cross_platform_app/presentation/home_page.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        Assets.assetsIcLauncher,
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      durationInSeconds: 5,
      loaderColor: Theme.of(context).colorScheme.secondary,
      navigator: const HomePage(),
    );
  }
}
