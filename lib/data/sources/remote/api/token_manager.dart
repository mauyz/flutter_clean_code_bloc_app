import 'package:cross_platform_app/core/constants/key_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TokenManager {
  final _secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );
  String? _accessToken;
  TokenManager();

  Future<String?> getAccessToken() async {
    _accessToken ??= await _secureStorage.read(key: KeyConstants.accessToken);
    return _accessToken;
  }

  Future saveAccessToken(String token) async {
    _accessToken = token;
    await _secureStorage.write(key: KeyConstants.accessToken, value: token);
  }

  Future deleteToken() async {
    _accessToken = null;
    await _secureStorage.delete(key: KeyConstants.accessToken);
  }
}
