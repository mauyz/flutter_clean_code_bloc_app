import 'package:cross_platform_app/presentation/dashboard/users/bloc/get_user_list_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshUserListWidget extends StatelessWidget {
  final Widget child;
  final int page;
  const RefreshUserListWidget({
    super.key,
    required this.child,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GetUserListBloc>().add(
              GetUserListByPageEvent(
                page: page,
                forceRefresh: true,
              ),
            );
      },
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: child,
      ),
    );
  }
}
