// ignore_for_file: constant_identifier_names, non_constant_identifier_names, unnecessary_new, unrelated_type_equality_checks

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomInterceptor.dart';
import 'app_exceptions.dart';

class BaseClient {
  static late String baseUrl;
  static Dio dio = Dio();

  static Future<void> initialize(String url) async {
    baseUrl = url;
    dio = Dio();
    dio.interceptors.add(CustomInterceptor(url));
  }

  // GET request
  static Future<Response<dynamic>?> get({String? api}) async {
    try {
      var response = await dio.get(api ?? "");
      return response;
    } on DioException catch (e) {
      if (e.type == DioException.connectionTimeout) {
        throw ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.receiveTimeout) {
        throw ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.connectionError) {
        throw ApiNotRespondingException("No Internet Connection");
      } else if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
      } else {
        debugPrint(e.requestOptions.headers.toString());
        debugPrint(e.toString());
      }
    } catch (e) {
      throw ApiNotRespondingException(e.toString());
    }
    return null;
  }

  static Future<Response<dynamic>?> getById({String? api, String? id}) async {
    try {
      var response = await dio.get(
        api ?? "",
        options: Options(
          headers: {
            "x-business-id": id ?? "",
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioException.connectionTimeout) {
        throw ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.receiveTimeout) {
        throw ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.connectionError) {
        throw ApiNotRespondingException("No Internet Connection");
      } else if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
      } else {
        debugPrint(e.requestOptions.headers.toString());
        debugPrint(e.toString());
      }
    } catch (e) {
      throw ApiNotRespondingException(e.toString());
    }
    return null;
  }

  static Future<Response<dynamic>?> getByToken({
    String? api,
    String? token,
  }) async {
    try {
      var response = await dio.get(
        api ?? "",
        //queryParameters: ,
        options: Options(
          headers: {
            if (token != null && token.isNotEmpty)
              "Authorization": "Bearer $token",
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioException.connectionTimeout) {
        throw ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.receiveTimeout) {
        throw ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.connectionError) {
        throw ApiNotRespondingException("No Internet Connection");
      } else if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
      } else {
        debugPrint(e.requestOptions.headers.toString());
        debugPrint(e.toString());
      }
    } catch (e) {
      throw ApiNotRespondingException(e.toString());
    }
    return null;
  }

  // POST request
  static Future<dynamic> post({
    String? api,
    Map<String, dynamic>? payloadObj,
    FormData? formData,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      // Make the POST request
      var response = await dio.post(
        api ?? "", // Ensure a valid URL
        data: formData ?? payloadObj, // Use FormData if available, else payload
        queryParameters: queryParams ?? {}, // Add query parameters if provided
        options: Options(
          headers: {
            'Authorization':
                'Bearer your_token_here', // Add authorization if needed
            // 'Content-Type' will automatically be set by dio for FormData
          },
        ),
      );
      debugPrint("Post statusCode ======>${response.statusCode}");
      return response;
    } on DioException catch (e) {
      // Handle Dio exceptions
      if (e.type == DioException.connectionTimeout) {
        throw ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.receiveTimeout) {
        throw ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.connectionError) {
        throw ApiNotRespondingException("No Internet Connection");
      } else if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
      }
    }
  }

  // PUT request
  static Future<dynamic> put(
      {String? api, Map<String, dynamic>? payloadObj}) async {
    // Make the request
    try {
      var response = await dio.put(
        api ?? "",
        data: payloadObj ?? {},
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioException.connectionTimeout) {
        ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.receiveTimeout) {
        ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.connectionError) {
        ApiNotRespondingException("No Internet Connection");
      } else if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
      }
    }
  }

  // DELETE request
  static Future<dynamic> delete({String? api}) async {
    var uri = baseUrl + (api ?? "");
    try {
      var response = await dio.delete(
        uri,
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioException.connectionTimeout) {
        ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.receiveTimeout) {
        ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.connectionError) {
        ApiNotRespondingException("No Internet Connection");
      } else if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
      }
    }
    return null;
  }

  static Future<dynamic> puttoken(
      {String? api, Map<String, dynamic>? payloadObj, String? token}) async {
    // Make the request
    try {
      var response = await dio.put(
        api ?? "",
        data: payloadObj ?? {},
        options: Options(
          headers: {
            if (token != null && token.isNotEmpty)
              "Authorization": "Bearer $token",
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioException.connectionTimeout) {
        ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.receiveTimeout) {
        ApiNotRespondingException("Connection Timeout");
      } else if (e.type == DioException.connectionError) {
        ApiNotRespondingException("No Internet Connection");
      } else if (e.response != null) {
        debugPrint(e.response!.data);
        debugPrint(e.response!.headers.toString());
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
      }
    }
  }

  static Future<bool> isAuthenticated() async {
    // Implement a method to check token validity
    String? token = await CustomInterceptor.getToken();
    if (token != null && token.isNotEmpty) {
      // Optionally, make an API call to verify the token
      try {
        // var response = await get(Endpoints.userProfile); // Adjust as needed
        // return response?.statusCode == 200;
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token'); // Remove the token from storage
  }
}
