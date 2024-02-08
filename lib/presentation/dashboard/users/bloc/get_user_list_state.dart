part of 'get_user_list_bloc.dart';

abstract class GetUserListState extends Equatable {
  final Map<int, List<User>> usersMap;
  final int page;

  const GetUserListState({
    required this.usersMap,
    required this.page,
  });

  @override
  List<Object?> get props => [usersMap, page];
}

class GetUserListInitial extends GetUserListState {
  GetUserListInitial()
      : super(
          usersMap: <int, List<User>>{},
          page: 1,
        );
}

class GetUserListLoading extends GetUserListState {
  const GetUserListLoading({
    required super.usersMap,
    required super.page,
  });
}

class GetUserListLoaded extends GetUserListState {
  const GetUserListLoaded({
    required super.usersMap,
    required super.page,
  });
}

class GetUserListFailed extends GetUserListState {
  final Failure failure;

  const GetUserListFailed({
    required this.failure,
    required super.usersMap,
    required super.page,
  });
}
