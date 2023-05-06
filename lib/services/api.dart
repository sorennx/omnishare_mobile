import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:omnishare_mobile/interceptors/dio_interceptor.dart';
import 'package:omnishare_mobile/services/store.dart';

class API {
  late final Dio _dio;

  API() {
    _dio = Dio();
    _dio.interceptors.add(DioInterceptor());
  }
  final String _loginUrl = 'https://api.kamilpula.com/api/login';
  final String _dataUrl = 'https://api.kamilpula.com/api/feed';

  String email = "";
  String password = "";

  Map<String, dynamic> get _loginData => {"email": email, "password": password};

  Future<void> _saveToken(Map<String, dynamic> data) async {
    final token = data['token'];
    await Store.setToken(token);
  }

  Future<void> _saveIsAuth() async {
    Store.isAuthNotifier.value = true;
    await Store.setAuth(true);
  }

  void setLoginDetails(String email, String password) {
    this.email = email;
    this.password = password;
  }

  String _getResult(List<dynamic> json) {
    return 'Receive ${json.length} objects';
  }

  Future<dynamic> dioLogin() async {
    try {
      final response = await _dio.post(
        _loginUrl,
        data: _loginData,
      );

      if (response.statusCode == 200) {
        await _saveToken(response.data);
        await _saveIsAuth();
        return true;
      }
    } on DioError catch (e) {
      return e.response?.data ?? 'Error occurred.';
    }

    return false;
  }

  Map<String, dynamic> convertListToMap(List<dynamic> list) {
    Map<String, dynamic> map = {};

    for (dynamic item in list) {
      print(item["author_id"]);
    }

    return map;
  }

  Future<dynamic> dioGetData() async {
    try {
      final response = await _dio.get(_dataUrl);
      if (response.statusCode == 200) {
        return response.data;
      }

      return response.data as String;
    } on DioError catch (e) {
      return e.response?.data ?? 'Error occurred.';
    }
  }
}
