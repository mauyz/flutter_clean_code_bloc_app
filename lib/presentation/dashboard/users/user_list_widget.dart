import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/users/bloc/get_user_list_bloc.dart';
import 'package:cross_platform_app/presentation/dashboard/users/user_list_grid_view.dart';
import 'package:cross_platform_app/presentation/responsive_widget.dart';
import 'package:cross_platform_app/presentation/widgets/button/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListWidget extends StatelessWidget {
  final List<User> users;
  final int page;
  const UserListWidget({
    super.key,
    required this.users,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    final getUserListBloc = context.read<GetUserListBloc>();
    final paginationWidgets = [
      SubmitButton(
        text: "Previous",
        onPressed: page == 1
            ? null
            : () => getUserListBloc.add(
                  GetUserListByPageEvent(page: page - 1),
                ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Page $page',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SubmitButton(
        text: "Next",
        onPressed: () => getUserListBloc.add(
          GetUserListByPageEvent(page: page + 1),
        ),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Builder(
        builder: (buidContext) {
          final Size size = MediaQuery.sizeOf(buidContext);
          return Column(
            children: [
              Expanded(
                child: ResponsiveWidget(
                  mobile: UserListGridView(
                    users: users,
                    crossAxisCount: size.width < 500 ? 2 : 3,
                    childAspectRatio:
                        size.width < 650 && size.width > 350 ? 1.3 : 1,
                  ),
                  desktop: UserListGridView(
                    users: users,
                    childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
                  ),
                  tablet: UserListGridView(
                    users: users,
                    crossAxisCount: 4,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: size.width < 480
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: paginationWidgets,
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: paginationWidgets,
                      ),
              )
            ],
          );
        },
      ),
    );
  }
}
