import 'dart:convert';
import 'dart:io';

import 'package:cross_platform_app/core/constants/error_constants.dart';
import 'package:cross_platform_app/core/error/exceptions.dart';
import 'package:cross_platform_app/data/sources/remote/api/api_client.dart';
import 'package:cross_platform_app/data/sources/remote/api/api_constants.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteUserSource {
  Future<User> login(String email, String password);
  Future logOut();
}

@LazySingleton(as: RemoteUserSource)
class RemoteUserSourceImpl implements RemoteUserSource {
  final ApiClient apiClient;

  RemoteUserSourceImpl({
    required this.apiClient,
  });

  @override
  Future<User> login(String email, String password) async {
    try {
      final result = await apiClient.postData(
        ApiConstants.login,
        {
          "email": email,
          "password": password,
        },
      );

      if (result.statusCode == 200) {
        final responseBody = result.data;
        if (responseBody != null) {
          final json = jsonDecode(responseBody);
          if (json["data"] != null) {
            final data = Map<String, dynamic>.from(json["data"]);
            final token = data["Token"] as String;
            await apiClient.saveToken(token);
            return User(
              id: data["Id"] as int,
              email: data["Email"] as String,
              name: data["Name"] as String,
            );
          } else {
            throw ServerException(code: ErrorConstants.inputIncorrect);
          }
        } else {
          throw ServerException(
            code: ErrorConstants.dataIncorrect,
          );
        }
      }
    } on DioException catch (e) {
      throw ServerException(
        code: e.response?.statusCode ?? ErrorConstants.unknownError,
      );
    } on IOException {
      throw InternetException();
    }
    throw UnknownException();
  }

  @override
  Future logOut() async {
    await apiClient.deleteToken();
  }
}
