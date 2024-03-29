import 'dart:convert';
import 'package:cross_platform_app/core/constants/error_constants.dart';
import 'package:cross_platform_app/core/error/exceptions.dart';
import 'package:cross_platform_app/data/models/user_model.dart';
import 'package:cross_platform_app/data/sources/remote/api/api_client.dart';
import 'package:cross_platform_app/data/sources/remote/api/api_constants.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteUserSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(Map<String, dynamic> data);
  Future<UserModel> getUserById(int id);
  Future<List<UserModel>> getUserList(int page);
  Future logOut();
}

@LazySingleton(as: RemoteUserSource)
class RemoteUserSourceImpl implements RemoteUserSource {
  final ApiClient apiClient;

  RemoteUserSourceImpl({
    required this.apiClient,
  });

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await apiClient.postData(
      endPoint: ApiConstants.login,
      params: {
        "email": email,
        "password": password,
      },
    );
    final json = jsonDecode(result);
    if (json['data'] != null) {
      final dataMap = Map<String, dynamic>.from(json['data']);
      final token = dataMap["Token"] as String;
      await apiClient.saveToken(token);
      return UserModel(
        id: dataMap["Id"] as int,
        email: dataMap["Email"] as String,
        name: dataMap["Name"] as String,
      );
    } else {
      throw const ApiException(code: ErrorConstants.inputIncorrect);
    }
  }

  @override
  Future logOut() async {
    await apiClient.deleteToken();
  }

  @override
  Future<UserModel> register(Map<String, dynamic> data) async {
    final result = await apiClient.postData(
      endPoint: ApiConstants.register,
      params: data,
    );
    final json = jsonDecode(result);
    if (json['data'] != null) {
      return login(data['email'], data['password']);
    } else {
      throw const ApiException(code: ErrorConstants.alreadyInUse);
    }
  }

  @override
  Future<UserModel> getUserById(int id) async {
    final result = await apiClient.getData(
      endPoint: '${ApiConstants.getUserById}$id',
    );
    if (result == "1") {
      throw const ApiException(code: ErrorConstants.notFound);
    } else {
      final data = Map<String, dynamic>.from(jsonDecode(result));
      if (!data.containsKey("message")) {
        return UserModel.fromJson(data);
      } else {
        throw const ApiException(code: ErrorConstants.requestInvalid);
      }
    }
  }

  @override
  Future<List<UserModel>> getUserList(int page) async {
    final result = await apiClient.getData(
      endPoint: '${ApiConstants.getUserList}$page',
    );
    final json = jsonDecode(result);
    if (json['data'] != null) {
      return (json['data'] as List<dynamic>)
          .map(
            (e) => UserModel.fromJson(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList();
    } else {
      throw const ApiException(code: ErrorConstants.inputIncorrect);
    }
  }
}
