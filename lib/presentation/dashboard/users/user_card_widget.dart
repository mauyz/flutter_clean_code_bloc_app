import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  final User user;

  const UserCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.network(
              user.profilepicture!,
              height: 50,
              width: 50,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(user.name),
            ),
          )
        ],
      ),
    );
  }
}
