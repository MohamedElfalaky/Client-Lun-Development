import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future saveToShared(String key, String value) async {
    await prefs!.setString(key, value);
  }

  static Future saveIntToShared(String key, int value) async {
    await prefs!.setInt(key, value);
  }

  static saveBoolToShared(String key, bool value) async {
    await prefs!.setBool(key, value);
  }

  static getBoolFromShared(String key) {
    return prefs!.getBool(key);
  }

  static getFromShared(String key) {
    return prefs!.get(key);
  }

  static getLangCode() {
    final cachedLangCode = prefs!.get("LOCALE");
    if (cachedLangCode != null) {
      return cachedLangCode;
    } else {
      return "en";
    }
  }

  static Future<bool?> removeFromShared(String key) async {
    return await prefs?.remove(key);
  }
}
