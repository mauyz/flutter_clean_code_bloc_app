import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class PreferenceStorage {
  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();
}
