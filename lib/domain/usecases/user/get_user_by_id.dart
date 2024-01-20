import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/core/usecase.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GettUserById extends UseCaseWithParams<User, int> {
  final UserRepository userRepository;

  GettUserById({
    required this.userRepository,
  });

  @override
  ResultFuture<User> call(int params) {
    return userRepository.getUserById(params);
  }
}
