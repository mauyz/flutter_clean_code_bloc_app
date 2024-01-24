import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/app/app_router.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/screen/drawer_item.dart';
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
      child: ListView(
        children: [
          DrawerItem(
            leadingIcon: Icons.group,
            title: "Users",
            onTap: () {
              Scaffold.of(context).closeDrawer();
              context.router.pushNamed("users");
            },
          ),
          DrawerItem(
            leadingIcon: Icons.person,
            title: "Profile",
            onTap: () {
              Scaffold.of(context).closeDrawer();
              context.router.push(
                ProfileRoute(
                  user: user,
                ),
              );
            },
          ),
          DrawerItem(
            leadingIcon: Icons.logout,
            title: "LogOut",
            onTap: () {
              context.read<AuthBloc>().add(const LogOutEvent());
            },
          ),
        ],
      ),
    );
  }
}
