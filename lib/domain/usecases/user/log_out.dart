import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/core/usecase.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_reposiory.dart';

class LogOut implements UseCaseWithParams<bool, User> {
  final UserRepository userRepository;

  LogOut({required this.userRepository});

  @override
  ResultFuture<bool> call(User params) {
    return userRepository.logOut(params);
  }
}
