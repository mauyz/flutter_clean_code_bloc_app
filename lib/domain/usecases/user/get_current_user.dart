import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/core/usecase.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_reposiory.dart';

class GetCurrentUser implements UseCaseWithoutParams<User> {
  final UserRepository userRepository;

  GetCurrentUser({required this.userRepository});

  @override
  ResultFuture<User> call() {
    return userRepository.getCurrentUser();
  }
}
