import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/profile/bloc/get_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  final User user;
  const ProfilePage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final getUserBloc = context.read<GetUserBloc>();
    final state = getUserBloc.state;
    if (state is GetUserInitial) {
      getUserBloc.add(GetUserEvent(id: user.id));
    }
    return BlocBuilder<GetUserBloc, GetUserState>(
      builder: (_, state) {
        if (state is GetUserFailed) {
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
        if (state is GetUserLoaded) {
          final profile = state.user;
          return Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(140),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 120,
                    backgroundImage: NetworkImage(
                      profile.profilepicture!,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  profile.email,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
