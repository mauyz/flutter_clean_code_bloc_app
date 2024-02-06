import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/users/bloc/pagination_cubit.dart';
import 'package:cross_platform_app/presentation/dashboard/users/user_list_grid_view.dart';
import 'package:cross_platform_app/presentation/responsive_widget.dart';
import 'package:cross_platform_app/presentation/widgets/button/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListWidget extends StatelessWidget {
  final List<User> users;
  const UserListWidget({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    final paginationCubit = context.read<PaginationCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                final Size size = MediaQuery.sizeOf(context);
                return ResponsiveWidget(
                  mobile: UserListGridView(
                    users: users,
                    crossAxisCount: size.width < 650 ? 2 : 4,
                    childAspectRatio:
                        size.width < 650 && size.width > 350 ? 1.3 : 1,
                  ),
                  desktop: UserListGridView(
                    users: users,
                    childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
                  ),
                  tablet: UserListGridView(users: users),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SubmitButton(
                  text: "Previous",
                  onPressed: paginationCubit.state == 1
                      ? null
                      : () => paginationCubit.decrement(),
                ),
                const SizedBox(
                  width: 5,
                ),
                SubmitButton(
                  text: "Next",
                  onPressed: () => paginationCubit.increment(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
