import 'package:shared_preferences/shared_preferences.dart';

class PrefsStorage {
  static SharedPreferences? _prefs;

  PrefsStorage._internal();
  static final PrefsStorage _instance = PrefsStorage._internal();
  factory PrefsStorage() => _instance;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    // await _prefs?.clear();
  }

  Future<void> saveBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  bool getBool(String key) {
    return _prefs?.getBool(key) ?? false;
  }
}

