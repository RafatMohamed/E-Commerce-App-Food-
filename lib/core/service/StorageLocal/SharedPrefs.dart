import 'package:shared_preferences/shared_preferences.dart';

import 'package:shared_preferences/shared_preferences.dart';

class PrefesStorage {
  static SharedPreferences? _prefs;

  PrefesStorage._internal();
  static final PrefesStorage _instance = PrefesStorage._internal();
  factory PrefesStorage() => _instance;
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

