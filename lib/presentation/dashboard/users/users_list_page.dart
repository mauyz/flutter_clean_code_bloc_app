import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/users/bloc/get_user_list_bloc.dart';
import 'package:cross_platform_app/presentation/dashboard/users/bloc/pagination_cubit.dart';
import 'package:cross_platform_app/presentation/dashboard/users/user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UsersListPage extends StatelessWidget {
  const UsersListPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final Map<int, List<User>> usersByPage = <int, List<User>>{};

    return BlocBuilder<PaginationCubit, int>(
      builder: (_, page) {
        if (usersByPage[page] != null) {
          return UserListWidget(users: usersByPage[page]!);
        }
        context.read<GetUserListBloc>().add(GetUserListByPageEvent(page: page));
        return BlocBuilder<GetUserListBloc, GetUserListState>(
          builder: (_, state) {
            if (state is GetUserListFailed) {
              return Center(
                child: Text(
                  state.failure.message,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.red,
                  ),
                ),
              );
            }
            if (state is GetUserListSuccess) {
              final users = state.users;
              users.sort(
                (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
              );
              usersByPage[page] = users;
              return UserListWidget(users: users);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
