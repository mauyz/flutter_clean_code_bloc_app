import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/domain/entities/user.dart';

abstract class UserRepository {
  const UserRepository();
  ResultFuture<User> login(String email, String password);
  ResultFuture<User> register(String email, String password);
  ResultFuture logOut();
}
