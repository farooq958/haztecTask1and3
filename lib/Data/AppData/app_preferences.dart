import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  /// reference of Shared Preferences
  static SharedPreferences? _preferences;
 // static UserDetails? userData;

  /// Initialization of Shared Preferences
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();




  ///token
  static Future setUserToken({required String? token}) async =>
      await _preferences?.setString("token", token ?? 'no_token');

  static String? getUserToken() => _preferences!.getString("token");

  ///UserData stored in json


  static clearPref() {
    return _preferences?.clear();
  }

  static Future setUserName({required String? username}) async =>
      await _preferences?.setString("username", username ?? 'no_token');

  static String? getUsername() => _preferences!.getString("username");

  setLocale({required bool langLocale}) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    await myPrefs.setBool('LangLocale', langLocale);
  }

  /// Get Locale
  Future<bool?> getLocale() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();

    return myPrefs.getBool('LangLocale') ?? true;
  }
}
