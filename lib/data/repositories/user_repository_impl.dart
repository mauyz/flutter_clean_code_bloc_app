import 'package:cross_platform_app/core/constants/error_constants.dart';
import 'package:cross_platform_app/core/error/exceptions.dart';
import 'package:cross_platform_app/core/error/failure.dart';
import 'package:cross_platform_app/core/typedef.dart';
import 'package:cross_platform_app/data/sources/remote/remote_user_source.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:cross_platform_app/domain/repositories/user_reposiory.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final RemoteUserSource remoteUserSource;

  UserRepositoryImpl({
    required this.remoteUserSource,
  });

  @override
  ResultFuture logOut() async {
    try {
      await remoteUserSource.logOut();
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
      return Right(user);
    } on ServerException catch (e) {
      return Left(
        Failure(code: e.code),
      );
    } on InternetException {
      return const Left(
        Failure(
          code: ErrorConstants.connexionError,
        ),
      );
    } on UnknownException {
      return const Left(
        Failure(
          code: ErrorConstants.unknownError,
        ),
      );
    }
  }

  @override
  ResultFuture<User> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
