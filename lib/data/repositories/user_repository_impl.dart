import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_reposiory.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  ResultFuture<User> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<bool> logOut(User user) {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
