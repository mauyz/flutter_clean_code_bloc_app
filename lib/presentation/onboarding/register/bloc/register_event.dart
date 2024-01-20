part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  final Map<String, dynamic> data;

  const RegisterEvent({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}
