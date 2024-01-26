import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/core/usecase.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserListUseCase extends UseCaseWithParams<List<User>, int> {
  final UserRepository userRepository;

  GetUserListUseCase({
    required this.userRepository,
  });

  @override
  ResultFuture<List<User>> call(int params) {
    return userRepository.getUserList(params);
  }
}
