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

  Map<String, dynamic> get _loginData =>
      {"email": "maciej.pokrec@gmail.com", "password": "maciejpokrec"};

  Future<void> _saveToken(Map<String, dynamic> data) async {
    final token = data['token'];
    await Store.setToken(token);
  }

  String _getResult(List<dynamic> json) {
    // print("data received is $json");

    return 'Receive ${json.length} objects';
  }

  Future<bool> dioLogin() async {
    final response = await _dio.post(
      _loginUrl,
      data: _loginData,
    );

    if (response.statusCode == 200) {
      await _saveToken(response.data);
      return true;
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
        final data = convertListToMap(response.data);

        return response.data;
      }
      return response.data as String;
    } on DioError catch (e) {
      return e.response?.data ?? 'Error occurred.';
    }
  }
}
