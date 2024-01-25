import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/app/app_router.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/bloc/get_user_bloc.dart';
import 'package:cross_platform_app/presentation/dashboard/bloc/navigation_cubit.dart';
import 'package:cross_platform_app/presentation/dashboard/screen/home_drawer.dart';
import 'package:cross_platform_app/presentation/onboarding/login/bloc/auth_bloc.dart';
import 'package:cross_platform_app/presentation/responsive_widget.dart';
import 'package:cross_platform_app/presentation/widgets/popup/display_progress_dialog.dart';
import 'package:cross_platform_app/services/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  final User user;
  const HomePage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    const routerKey = GlobalObjectKey('auth_router');
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetUserBloc>(
          create: (_) => getIt.get<GetUserBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => getIt.get<AuthBloc>(),
        ),
        BlocProvider<NavigationCubit>(
          create: (_) => getIt.get<NavigationCubit>(),
        ),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is UnAuthenticated) {
            context.router.replace(const LoginRoute());
          }
          if (state is AuthSubmitting) {
            displayProgressDialog(context);
          }
        },
        child: Builder(
          builder: (buildContext) {
            return Scaffold(
              appBar: ResponsiveWidget.isMobile(buildContext)
                  ? AppBar(
                      leading: Builder(
                        builder: (context) {
                          return InkWell(
                            child: const Icon(
                              Icons.menu,
                            ),
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                          );
                        },
                      ),
                    )
                  : null,
              drawer: HomeDrawer(
                user: user,
              ),
              body: ResponsiveWidget.isMobile(buildContext)
                  ? const SafeArea(
                      child: AutoRouter(
                        key: routerKey,
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: HomeDrawer(user: user),
                        ),
                        const Expanded(
                          flex: 5,
                          child: AutoRouter(
                            key: routerKey,
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
