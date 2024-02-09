import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/widgets/custom/network_avatar_rounded.dart';
import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  final User user;

  const UserCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: NetworkAvatarRounded(
                user: user,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: Text(user.name),
            ),
          )
        ],
      ),
    );
  }
}
