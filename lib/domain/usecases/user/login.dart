import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/core/usecase.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_reposiory.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Login implements UseCaseWithParams<User, (String, String)> {
  final UserRepository userRepository;

  Login({
    required this.userRepository,
  });

  @override
  ResultFuture<User> call((String, String) params) {
    return userRepository.login(params.$1, params.$2);
  }
}
