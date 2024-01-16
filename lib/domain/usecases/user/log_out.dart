import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/core/usecase.dart';
import 'package:cross_platform_app/domain/repositories/user_reposiory.dart';

class LogOut implements UseCaseWithoutParams {
  final UserRepository userRepository;

  LogOut({required this.userRepository});

  @override
  ResultFuture call() {
    return userRepository.logOut();
  }
}
