import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/presentation/dashboard/users/bloc/get_user_list_bloc.dart';
import 'package:cross_platform_app/presentation/dashboard/users/refresh_user_list_widget.dart';
import 'package:cross_platform_app/presentation/dashboard/users/user_list_widget.dart';
import 'package:cross_platform_app/presentation/widgets/custom/error_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UsersListPage extends StatefulWidget {
  const UsersListPage({
    super.key,
  });

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  void initState() {
    if (context.read<GetUserListBloc>().state is! GetUserListLoaded) {
      context.read<GetUserListBloc>().add(GetUserListByPageEvent(
            page: context.read<GetUserListBloc>().state.page,
          ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserListBloc, GetUserListState>(
      builder: (_, state) {
        if (state is GetUserListFailed) {
          return RefreshUserListWidget(
            page: state.page,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height,
                child: ErrorTextWidget(
                  text: state.failure.message,
                ),
              ),
            ),
          );
        }
        if (state is GetUserListLoaded) {
          final users = state.usersMap[state.page]!;
          users.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
          );
          return RefreshUserListWidget(
            page: state.page,
            child: users.isEmpty
                ? SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.sizeOf(context).height,
                      child: const ErrorTextWidget(
                        text: "No users found",
                      ),
                    ),
                  )
                : UserListWidget(
                    users: users,
                    page: state.page,
                  ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
