import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_reposiory.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  ResultFuture<bool> logOut(User user) {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  ResultFuture<User> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  ResultFuture<User> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
