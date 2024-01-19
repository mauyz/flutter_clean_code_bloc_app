import 'package:cross_platform_app/core/constants/key_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocaleUserSource {
  final SharedPreferences preferences;

  LocaleUserSource({
    required this.preferences,
  });

  Future saveLoggedUserId(int id) {
    return preferences.setInt(KeyConstants.loggedUserId, id);
  }

  Future logOut() {
    return preferences.remove(KeyConstants.loggedUserId);
  }

  Future<int?> getLoggedUserId() async {
    return preferences.getInt(KeyConstants.loggedUserId);
  }
}
