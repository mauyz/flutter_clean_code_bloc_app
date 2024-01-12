import 'dart:convert';
import 'dart:io';

import 'package:cross_platform_app/core/error/exceptions.dart';
import 'package:cross_platform_app/data/sources/remote/api/api_client.dart';
import 'package:cross_platform_app/domain/entities/user.dart';
import 'package:dio/dio.dart';

abstract class RemoteUserSource {
  Future<User> login(String email, String password);
  Future<bool> logOut(User user);
}

class RemoteUserSourceImpl implements RemoteUserSource {
  final ApiClient apiClient;

  RemoteUserSourceImpl({
    required this.apiClient,
  });

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await apiClient.postData(
        "/authaccount/login",
        {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null) {
          final json = jsonDecode(data);
          final user = User(id: "id", email: email, name: "name");
        } else {
          throw ServerException(code: response.statusCode?.toString() ?? '');
        }
      }
    } on DioException catch (e) {
      throw ServerException(code: e.response?.statusCode?.toString() ?? '');
    } on SocketException {
      throw InternetException();
    }
  }

  @override
  Future<bool> logOut(User user) {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}

Map<String, dynamic> parseAndDecode(String response) {
  return jsonDecode(response) as Map<String, dynamic>;
}
