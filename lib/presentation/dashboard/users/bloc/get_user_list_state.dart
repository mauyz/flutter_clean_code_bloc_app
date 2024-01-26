part of 'get_user_list_bloc.dart';

abstract class GetUserListState extends Equatable {
  const GetUserListState();

  @override
  List<Object?> get props => [];
}

class GetUserListInitial extends GetUserListState {
  const GetUserListInitial();
}

class GetUserListLoading extends GetUserListState {
  const GetUserListLoading();
}

class GetUserListSuccess extends GetUserListState {
  final List<User> users;

  const GetUserListSuccess({required this.users});
}

class GetUserListFailed extends GetUserListState {
  final Failure failure;

  const GetUserListFailed({required this.failure});
}
