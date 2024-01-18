import 'package:cross_platform_app/core/constants/key_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocaleUserSource {
  final FlutterSecureStorage secureStorage;

  LocaleUserSource({
    required this.secureStorage,
  });

  Future saveLoggedUserId(int id) {
    return secureStorage.write(
      key: KeyConstants.loggedUserId,
      value: id.toString(),
    );
  }

  Future logOut() {
    return secureStorage.delete(key: KeyConstants.loggedUserId);
  }

  Future<int?> getLoggedUserId() async {
    return (await secureStorage.read(key: KeyConstants.loggedUserId)) as int?;
  }
}
