import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Store {
  const Store._();

  static const String _tokenKey = "TOKEN";
  static const String _isAuthKey = "AUTH";

  static ValueNotifier<bool> isAuthNotifier = ValueNotifier(false);

  static Future<void> init() async {
    final auth = await getAuth();
    isAuthNotifier.value = auth == true;
  }

  static Future<void> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey);
  }

  static Future<void> clear() async {
    final preferences = await SharedPreferences.getInstance();
    isAuthNotifier.value = false;
    await preferences.clear();
  }

  static Future<void> setAuth(bool isAuth) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_isAuthKey, isAuth);
    isAuthNotifier.value = isAuth;
  }

  static Future<bool?> getAuth() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_isAuthKey);
  }
}
