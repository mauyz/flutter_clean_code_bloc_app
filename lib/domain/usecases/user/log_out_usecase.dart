import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/core/usecase.dart';
import 'package:cross_platform_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogOutUseCase implements UseCaseWithoutParams {
  final UserRepository userRepository;

  LogOutUseCase({required this.userRepository});

  @override
  ResultFuture call() {
    return userRepository.logOut();
  }
}
