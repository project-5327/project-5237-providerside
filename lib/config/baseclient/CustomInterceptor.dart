import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomInterceptor extends Interceptor {
  String url;

  CustomInterceptor(this.url);
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.baseUrl = url;
    options.connectTimeout = const Duration(seconds: 5);
    options.receiveTimeout = const Duration(seconds: 5);
    options.followRedirects = false;
    options.validateStatus = (status) {
      return status! < 500;
    };
    try {
      String? token = await getToken();
      if (token != null) {
        options.headers['Authorization'] = "Bearer $token";
        debugPrint(' API Request - Start ');

        debugPrint('URI ${options.uri}');
        debugPrint('METHOD: ${options.method}');
        debugPrint('HEADERS:');
        options.headers.forEach((key, v) => print(' - $key,  $v'));
        debugPrint('BODY:');
        debugPrint(options.data ?? '');

        debugPrint(' API Request - End ');
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    handler.next(options);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }

  static void setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', token);
  }
}
