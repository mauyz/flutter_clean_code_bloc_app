part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthState {
  const UnAuthenticated();
}

class AuthSubmitting extends AuthState {
  const AuthSubmitting();
}

class AuthenticatedFailed extends AuthState {
  final Failure failure;
  const AuthenticatedFailed({
    required this.failure,
  });
}

class Authenticated extends AuthState {
  final User user;
  const Authenticated({
    required this.user,
  });
}
