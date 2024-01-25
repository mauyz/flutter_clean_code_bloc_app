import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/presentation/dashboard/users/bloc/get_user_list_bloc.dart';
import 'package:cross_platform_app/presentation/dashboard/users/user_list_grid_view.dart';
import 'package:cross_platform_app/presentation/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<GetUserListBloc>().add(const GetUserListByPageEvent(page: 1));
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
          final Size size = MediaQuery.of(context).size;
          return ResponsiveWidget(
            mobile: UserListGridView(
              users: state.users,
              crossAxisCount: size.width < 650 ? 2 : 4,
              childAspectRatio: size.width < 650 && size.width > 350 ? 1.3 : 1,
            ),
            desktop: UserListGridView(
              users: state.users,
              childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
            ),
            tablet: UserListGridView(users: state.users),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
