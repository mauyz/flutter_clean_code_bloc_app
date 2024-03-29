import 'package:cross_platform_app/core/constants/error_constants.dart';
import 'package:cross_platform_app/core/error/exceptions.dart';
import 'package:cross_platform_app/data/sources/remote/api/api_constants.dart';
import 'package:cross_platform_app/data/sources/local/token_manager.dart';
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
          return handler.next(exception);
        },
      ),
    );
  }

  Future<String> _request({
    required String endPoint,
    required ApiMethod method,
    Map<String, dynamic>? params,
  }) async {
    try {
      final result = switch (method) {
        ApiMethod.get => await dio.get<String>(
            endPoint,
            data: params,
          ),
        ApiMethod.post => await dio.post<String>(
            endPoint,
            data: params,
          ),
        ApiMethod.put => await dio.put<String>(
            endPoint,
            data: params,
          ),
      };
      if (result.statusCode == 200) {
        final data = result.data;
        if (data != null) {
          return data;
        } else {
          throw const ApiException(
            code: ErrorConstants.dataIncorrect,
          );
        }
      }
      if (result.statusCode == 401) {
        throw const ApiException(
          code: ErrorConstants.tokenInvalid,
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode != null) {
        throw ApiException(
          code: e.response!.statusCode!,
        );
      }
      if (e.message?.contains("Failed host lookup") == true) {
        throw const ApiException(code: ErrorConstants.connexionError);
      }
    }
    throw const UnknownException();
  }

  Future<String> postData({
    required String endPoint,
    Map<String, dynamic>? params,
  }) {
    return _request(
      endPoint: endPoint,
      params: params,
      method: ApiMethod.post,
    );
  }

  Future<String> getData({
    required String endPoint,
    Map<String, dynamic>? params,
  }) {
    return _request(
      endPoint: endPoint,
      params: params,
      method: ApiMethod.get,
    );
  }

  Future<String> putData({
    required String endPoint,
    Map<String, dynamic>? params,
  }) {
    return _request(
      endPoint: endPoint,
      params: params,
      method: ApiMethod.put,
    );
  }

  Future saveToken(String token) async {
    await tokenManager.saveAccessToken(token);
  }

  Future deleteToken() async {
    await tokenManager.deleteToken();
  }
}
