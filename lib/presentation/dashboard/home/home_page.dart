import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/app/app_router.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/home/bloc/navigation_home_cubit.dart';
import 'package:cross_platform_app/presentation/dashboard/profile/bloc/get_user_bloc.dart';
import 'package:cross_platform_app/presentation/dashboard/home/home_drawer.dart';
import 'package:cross_platform_app/presentation/dashboard/users/bloc/get_user_list_bloc.dart';
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
        BlocProvider(
          create: (_) => getIt.get<GetUserListBloc>(),
        ),
        BlocProvider<GetUserBloc>(
          create: (_) => getIt.get<GetUserBloc>(),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => getIt.get<AuthBloc>(),
        ),
        BlocProvider<NavigationHomeCubit>(
          create: (_) => getIt.get<NavigationHomeCubit>(),
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
            if (ResponsiveWidget.isMobile(buildContext)) {
              final scaffoldKey = GlobalKey<ScaffoldState>();
              return Scaffold(
                key: scaffoldKey,
                appBar: AppBar(
                  leading: Builder(
                    builder: (context) {
                      return InkWell(
                        child: const Icon(
                          Icons.menu,
                        ),
                        onTap: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                      );
                    },
                  ),
                ),
                drawer: HomeDrawer(user: user),
                body: const AutoRouter(
                  key: routerKey,
                ),
              );
            }
            return Scaffold(
              body: Row(
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
