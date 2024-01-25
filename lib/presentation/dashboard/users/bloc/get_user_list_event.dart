part of 'get_user_list_bloc.dart';

abstract class GetUserListEvent extends Equatable {
  const GetUserListEvent();
  @override
  List<Object?> get props => [];
}

class GetUserListByPageEvent extends GetUserListEvent {
  final int page;

  const GetUserListByPageEvent({required this.page});
}

class RefreshUserListEvent extends GetUserListEvent {
  const RefreshUserListEvent();
}
