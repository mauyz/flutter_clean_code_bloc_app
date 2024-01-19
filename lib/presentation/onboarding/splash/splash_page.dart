import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/app/app_router.dart';
import 'package:cross_platform_app/presentation/onboarding/splash/bloc/splash_bloc.dart';
import 'package:cross_platform_app/services/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<SplashBloc>(
          create: (_) => getIt.get<SplashBloc>(),
          child: Builder(
            builder: (buildContext) {
              buildContext.read<SplashBloc>().add(const SplashEvent());
              return BlocListener<SplashBloc, SplashState>(
                listener: (_, state) {
                  if (state is SplashLoaded) {
                    final user = state.user;
                    if (user == null) {
                      context.router.popAndPush(const LoginRoute());
                    } else {
                      context.router.popAndPush(HomeRoute(user: user));
                    }
                  }
                },
                child: const CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
