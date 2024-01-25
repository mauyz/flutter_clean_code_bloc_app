import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  final String title;
  final bool selected;
  final IconData? leadingIcon;
  final Function()? onTap;
  final bool? closeDrawerOnTap;

  const DrawerItemWidget({
    super.key,
    required this.title,
    required this.selected,
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
      selected: selected,
      onTap: () {
        if (closeDrawerOnTap == true) {
          Scaffold.maybeOf(context)?.closeDrawer();
        }
        onTap?.call();
      },
    );
  }
}
