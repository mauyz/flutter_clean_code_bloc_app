import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/app/app_router.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/home/bloc/navigation_home_cubit.dart';
import 'package:cross_platform_app/presentation/onboarding/login/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends StatelessWidget {
  final User user;
  const HomeDrawer({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationHomeCubit, int>(
      builder: (_, index) {
        return NavigationDrawer(
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 5,
          ),
          selectedIndex: index,
          onDestinationSelected: (value) {
            if (index != value) {
              navigateTo(context, value);
            } else {
              Scaffold.maybeOf(context)?.closeDrawer();
            }
          },
          children: const [
            NavigationDrawerDestination(
              icon: Icon(Icons.group),
              label: Text("Users"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.person),
              label: Text("Profile"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.logout),
              label: Text("Log out"),
            ),
          ],
        );
      },
    );
  }

  void navigateTo(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.router.push(const UsersListRoute());
        break;
      case 1:
        context.router.push(ProfileRoute(user: user));
        break;
      case 2:
        context.read<AuthBloc>().add(const LogOutEvent());
        break;
    }
    Scaffold.maybeOf(context)?.closeDrawer();
    context.read<NavigationHomeCubit>().navigateTo(index);
  }
}
