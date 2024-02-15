import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/users/user_card_widget.dart';
import 'package:flutter/material.dart';

class UserListGridView extends StatelessWidget {
  final List<User> users;
  final int crossAxisCount;
  final double childAspectRatio;
  const UserListGridView({
    super.key,
    required this.users,
    this.crossAxisCount = 5,
    this.childAspectRatio = 1,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: users.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 5.0,
      ),
      itemBuilder: (_, index) {
        return UserCardWidget(user: users[index]);
      },
    );
  }
}
