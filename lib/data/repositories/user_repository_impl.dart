import 'package:cross_platform_app/core/error/exceptions.dart';
import 'package:cross_platform_app/core/error/failure.dart';
import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/data/sources/local/local_user_source.dart';
import 'package:cross_platform_app/data/sources/remote/remote_user_source.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final RemoteUserSource remoteUserSource;
  final LocaleUserSource localeUserSource;

  UserRepositoryImpl({
    required this.remoteUserSource,
    required this.localeUserSource,
  });

  @override
  ResultFuture logOut() async {
    try {
      await remoteUserSource.logOut();
      await localeUserSource.logOut();
      return const Right(true);
    } catch (_) {
      return const Left(
        Failure(code: -1),
      );
    }
  }

  @override
  ResultFuture<User> login(String email, String password) async {
    try {
      final user = await remoteUserSource.login(
        email,
        password,
      );
      await localeUserSource.saveLoggedUserId(user.id);
      return Right(user);
    } on ApiException catch (e) {
      return Left(
        Failure(code: e.code),
      );
    }
  }

  @override
  ResultFuture<User> register(Map<String, dynamic> data) async {
    try {
      final user = await remoteUserSource.register(data);
      await localeUserSource.saveLoggedUserId(user.id);
      return Right(user);
    } on ApiException catch (e) {
      return Left(
        Failure(code: e.code),
      );
    }
  }

  @override
  ResultFuture<User> getUserById(int id) async {
    try {
      return Right(await remoteUserSource.getUserById(id));
    } on ApiException catch (e) {
      return Left(
        Failure(code: e.code),
      );
    }
  }

  @override
  ResultFuture<User?> getLoggedUser() async {
    final userId = await localeUserSource.getLoggedUserId();
    if (userId != null) {
      return Right(
        User(id: userId, email: '', name: ''),
      );
    }
    return const Right(null);
  }

  @override
  ResultFuture<List<User>> getUserList(int page) async {
    try {
      return Right(await remoteUserSource.getUserList(page));
    } on ApiException catch (e) {
      return Left(
        Failure(code: e.code),
      );
    }
  }
}
