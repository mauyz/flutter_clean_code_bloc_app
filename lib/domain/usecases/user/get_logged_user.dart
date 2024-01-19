import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/core/usecase.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetLoggedUser extends UseCaseWithoutParams<User?> {
  final UserRepository userRepository;

  GetLoggedUser({
    required this.userRepository,
  });
  @override
  ResultFuture<User?> call() {
    return userRepository.getLoggedUser();
  }
}
