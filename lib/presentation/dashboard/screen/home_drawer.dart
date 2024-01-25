import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/app/app_router.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/bloc/navigation_cubit.dart';
import 'package:cross_platform_app/presentation/dashboard/screen/drawer_item_widget.dart';
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
    return Drawer(
      child: BlocBuilder<NavigationCubit, int>(
        builder: (_, index) {
          return ListView(
            children: [
              DrawerItemWidget(
                leadingIcon: Icons.group,
                title: "Users",
                selected: index == 0,
                onTap: () {
                  navigateTo(context, const UsersListRoute(), 0);
                },
              ),
              DrawerItemWidget(
                leadingIcon: Icons.person,
                title: "Profile",
                selected: index == 1,
                onTap: () {
                  navigateTo(context, ProfileRoute(user: user), 1);
                },
              ),
              DrawerItemWidget(
                leadingIcon: Icons.logout,
                title: "LogOut",
                selected: false,
                onTap: () {
                  context.read<AuthBloc>().add(const LogOutEvent());
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void navigateTo(BuildContext context, PageRouteInfo pageRoute, int index) {
    Scaffold.of(context).closeDrawer();
    context.router.push(pageRoute);
    context.read<NavigationCubit>().navigateTo(index);
  }
}
