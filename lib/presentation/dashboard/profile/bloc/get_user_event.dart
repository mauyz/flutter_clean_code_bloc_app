part of 'get_user_bloc.dart';

class GetUserEvent extends Equatable {
  final int id;

  const GetUserEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
