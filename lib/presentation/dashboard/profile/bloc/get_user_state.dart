part of 'get_user_bloc.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();
  @override
  List<Object?> get props => [];
}

class GetUserInitial extends GetUserState {
  const GetUserInitial();
}

class GetUserLoading extends GetUserState {
  const GetUserLoading();
}

class GetUserLoaded extends GetUserState {
  final User user;
  const GetUserLoaded({
    required this.user,
  });
}

class GetUserFailed extends GetUserState {
  final Failure failure;
  const GetUserFailed({
    required this.failure,
  });
}
