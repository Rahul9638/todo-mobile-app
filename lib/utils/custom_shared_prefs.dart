import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPrefs {
  CustomSharedPrefs._();
  static CustomSharedPrefs? _instance;

  static CustomSharedPrefs get instance {
    _instance ??= CustomSharedPrefs._();
    return _instance!;
  }

  Future<bool?> readBoolPrefs(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? data = prefs.getBool(key);
    return data;
  }

  Future<void> addBoolPrefs(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<void> clearPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
