part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterSubmitting extends RegisterState {
  const RegisterSubmitting();
}

class RegisterSuccess extends RegisterState {
  final User user;

  const RegisterSuccess({
    required this.user,
  });
}

class RegisterFailed extends RegisterState {
  final Failure failure;

  const RegisterFailed({
    required this.failure,
  });
}
