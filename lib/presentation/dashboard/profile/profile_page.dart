import 'package:auto_route/auto_route.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/presentation/dashboard/profile/bloc/get_user_bloc.dart';
import 'package:cross_platform_app/presentation/responsive_widget.dart';
import 'package:cross_platform_app/presentation/widgets/text/error_text_widget.dart';
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
    if (getUserBloc.state is GetUserInitial) {
      getUserBloc.add(GetUserEvent(id: user.id));
    }
    return BlocBuilder<GetUserBloc, GetUserState>(
      builder: (_, state) {
        if (state is GetUserFailed) {
          return Center(
            child: ErrorTextWidget(
              text: state.failure.message,
            ),
          );
        }
        if (state is GetUserLoaded) {
          final profile = state.user;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: ResponsiveWidget.isMobile(context)
                    ? const EdgeInsets.all(10.0)
                    : const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 20.0,
                      ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
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
                          textAlign: TextAlign.center,
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
                          textAlign: TextAlign.center,
                        ),
                        if (profile.location != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              profile.location!,
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontStyle: FontStyle.italic,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
