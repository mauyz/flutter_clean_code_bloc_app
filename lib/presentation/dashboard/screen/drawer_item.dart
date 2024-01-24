import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData? leadingIcon;
  final Function()? onTap;
  final bool? closeDrawerOnTap;

  const DrawerItem({
    super.key,
    required this.title,
    this.leadingIcon,
    this.onTap,
    this.closeDrawerOnTap = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon == null
          ? null
          : Icon(
              leadingIcon,
            ),
      title: Text(
        title,
      ),
      onTap: () {
        if (closeDrawerOnTap == true) {
          Scaffold.of(context).closeDrawer();
        }
        onTap?.call();
      },
    );
  }
}
