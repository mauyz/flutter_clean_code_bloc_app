import 'package:cross_platform_app/data/sources/remote/api/api_constants.dart';
import 'package:cross_platform_app/data/sources/remote/api/token_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final TokenManager tokenManager;
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  ApiClient({required this.tokenManager}) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await tokenManager.getAccessToken();
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint(response.toString());
          return handler.next(response);
        },
        onError: (exception, handler) async {
          debugPrintStack(label: exception.toString());
          if (exception.response?.statusCode == 401) {
            // todo refresh token
            return handler.resolve(await dio.fetch(exception.requestOptions));
          }
          return handler.next(exception);
        },
      ),
    );
  }

  Future<Response<String>> postData(
    String endPoint,
    Map<String, dynamic> data,
  ) async {
    return dio.post<String>(endPoint, data: data);
  }

  Future<Response<String>> getData(
    String endPoint,
    Map<String, dynamic> data,
  ) async {
    return dio.get<String>(endPoint, data: data);
  }

  Future saveToken(String token) async {
    await tokenManager.saveAccessToken(token);
  }

  Future deleteToken() async {
    await tokenManager.deleteToken();
  }
}
