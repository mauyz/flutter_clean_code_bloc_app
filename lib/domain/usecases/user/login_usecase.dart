import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/core/usecase.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginUseCase implements UseCaseWithParams<User, (String, String)> {
  final UserRepository userRepository;

  LoginUseCase({
    required this.userRepository,
  });

  @override
  ResultFuture<User> call((String, String) params) {
    return userRepository.login(params.$1, params.$2);
  }
}
