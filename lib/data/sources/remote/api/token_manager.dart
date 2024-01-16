import 'package:cross_platform_app/core/constants/key_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  final FlutterSecureStorage secureStorage;
  String? _accessToken;
  TokenManager({
    required this.secureStorage,
  });

  Future<String?> getAccessToken() async {
    _accessToken ??= await secureStorage.read(key: KeyConstants.accessToken);
    return _accessToken;
  }

  Future saveAccessToken(String token) async {
    _accessToken = token;
    await secureStorage.write(key: KeyConstants.accessToken, value: token);
  }

  Future deleteToken() async {
    _accessToken = null;
    await secureStorage.delete(key: KeyConstants.accessToken);
  }
}
