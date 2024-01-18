import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/app/app_router.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/usecases/user/get_user_by_id.dart';
import 'package:cross_platform_app/domain/usecases/user/log_out_usecase.dart';
import 'package:cross_platform_app/domain/usecases/user/login_usecase.dart';
import 'package:cross_platform_app/presentation/dashboard/bloc/get_user_bloc.dart';
import 'package:cross_platform_app/presentation/onboarding/login/bloc/auth_bloc.dart';
import 'package:cross_platform_app/services/dependecy_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  final User user;
  const HomePage({
    super.key,
    required this.user,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetUserBloc>(
          create: (_) => GetUserBloc(
            gettUserById: getIt.get<GettUserById>(),
          ),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            initialState: Authenticated(user: user),
            loginUseCase: getIt.get<LoginUseCase>(),
            logOutUseCase: getIt.get<LogOutUseCase>(),
          ),
        ),
      ],
      child: Builder(
        builder: (buildContext) {
          buildContext.read<GetUserBloc>().add(GetUserEvent(id: user.id));
          return BlocBuilder<GetUserBloc, GetUserState>(
            builder: (_, state) {
              if (state is GetUserFailed) {
                return Scaffold(
                  body: Center(
                    child: Text(
                      state.failure.message,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              }
              if (state is GetUserLoading || state is GetUserInitial) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is GetUserLoaded) {
                final profile = state.user;
                return Scaffold(
                  body: Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(140),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 10,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 120,
                            backgroundImage: NetworkImage(
                              profile.profilepicture!,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          profile.name,
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          profile.email,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: BlocConsumer<AuthBloc, AuthState>(
                    listener: (_, state) {
                      if (state is UnAuthenticated) {
                        context.router.popAndPush(const LoginRoute());
                      }
                    },
                    builder: (_, state) {
                      if (state is Authenticated) {
                        return FloatingActionButton(
                          onPressed: () {
                            buildContext
                                .read<AuthBloc>()
                                .add(const LogOutEvent());
                          },
                          tooltip: 'Log out',
                          child: const Icon(Icons.logout),
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
