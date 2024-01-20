import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/core/usecase.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterUseCase extends UseCaseWithParams<User, Map<String, dynamic>> {
  final UserRepository userRepository;

  RegisterUseCase({
    required this.userRepository,
  });

  @override
  ResultFuture<User> call(Map<String, dynamic> params) {
    return userRepository.register(params);
  }
}
