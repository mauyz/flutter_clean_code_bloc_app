import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/domain/entities/user.dart';

abstract class UserRepository {
  const UserRepository();
  ResultFuture<User?> getLoggedUser();
  ResultFuture<User> login(String email, String password);
  ResultFuture<User> register(Map<String, dynamic> data);
  ResultFuture<User> getUserById(int id);
  ResultFuture<List<User>> getUserList(int page);
  ResultFuture logOut();
}
