import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_5237_provider/config/baseclient/CustomInterceptor.dart';
import 'package:project_5237_provider/config/baseclient/base_client.dart';
import 'package:project_5237_provider/config/baseclient/endpoints.dart';
import 'package:project_5237_provider/data/models/freelancer_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FreelancerProvider with ChangeNotifier {
  bool _loading = false;
  String? _errorMessage;
  final bool _isSuccess = false;
  FreelancerDetail? freelancerModel;
  PersonalProjects? personalProjects;

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  String getFileExtension(String filePath) {
    return filePath.split('.').last.toLowerCase();
  }

  Future<bool> updateProfile({
    required BuildContext context,
    required String imagePath,
    required String username,
  }) async {
    _loading = true;
    notifyListeners();

    String? token = await CustomInterceptor.getToken();

    try {
      if (imagePath.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a profile image.'),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }

      FormData formData = FormData.fromMap({
        "userName": username,
        "profileImg": await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
        ),
      });

      final response = await BaseClient.putByToken(
        formData: formData,
        api: EndPoints.FREELANCERDETAILS,
        token: token,
      );

      debugPrint("Response: ${response?.data}");

      if (response?.statusCode == 200) {
        if (response?.data is Map<String, dynamic> &&
            response?.data['message'] is String) {
          debugPrint('Full Response: ${response?.data}');
          debugPrint("token======> $token");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response!.data['message'])),
          );
          return true;
        } else {
          debugPrint("Unexpected response format: ${response?.data}");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Unexpected response format.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        debugPrint(
            "Invalid credentials or null response. Status Code: ${response?.statusCode}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              response?.data is Map<String, dynamic> &&
                      response?.data['message'] is String
                  ? response!.data['message']
                  : 'Unknown error occurred.',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint("Exception caught: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      _loading = false;
      notifyListeners();
    }

    return false;
  }

  Future<void> fetchFreelancerDetail(BuildContext context) async {
    _loading = true;
    notifyListeners();
    String? token = await CustomInterceptor.getToken();
    try {
      final response = await BaseClient.getByToken(
        api: EndPoints.USERDETAILS,
        token: token,
      );

      if (response != null && response.statusCode == 200) {
        final data = response.data;
        debugPrint('response ==========> $data');

        if (data != null) {
          freelancerModel = FreelancerDetail.fromJson(data);
          _errorMessage = '';
          debugPrint('==== Freelancers retrieved successfully.=====');
          debugPrint("Freelancer details======> :$freelancerModel");
        } else {
          _errorMessage = 'No data found';
          debugPrint('Error=======> No data found');
        }
      } else {
        debugPrint('Error=======> ${response?.statusCode}, ${response?.data}');
        _errorMessage = response?.data['message'] ?? 'Failed to load data';
        debugPrint('Error: ${response?.statusCode}, ${response?.data}');
      }
    } catch (e) {
      _errorMessage = 'An error occurred while fetching data';
      debugPrint("Error======> ${e.toString()}");
    } finally {
      _loading = false;
      notifyListeners();
    }

    void showSnackBar(BuildContext context, String? message) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message ?? "Error")),
        );
      }
    }
  }

  Future<void> fetchFreelancerProjects(BuildContext context) async {
    _loading = true;
    notifyListeners();
    String? token = await CustomInterceptor.getToken();
    try {
      final response = await BaseClient.getByToken(
        api: EndPoints.USERDETAILS,
        token: token,
      );

      if (response != null && response.statusCode == 200) {
        final data = response.data;
        debugPrint('response ==========> $data');

        if (data != null) {
          freelancerModel = FreelancerDetail.fromJson(data);

          _errorMessage = '';
          debugPrint('==== Projects retrieved successfully.=====');
        } else {
          _errorMessage = 'No data found';
          debugPrint('Error=======> No data found');
        }
      } else {
        _errorMessage = response?.data['message'] ?? 'Failed to load data';
        debugPrint('Error: ${response?.statusCode}, ${response?.data}');
      }
    } catch (e) {
      _errorMessage = 'An error occurred while fetching data';
      debugPrint("Error======> ${e.toString()}");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<bool> updateProject({
    required BuildContext context,
    required String projectName,
    required String description,
    required String startDate,
    required String endDate,
    required List<String> technologies,
  }) async {
    _loading = true;
    notifyListeners();

    String? token = await CustomInterceptor.getToken();

    try {
      Map<String, dynamic> data = {
        "projectName": projectName,
        "description": description,
        "startDate": startDate,
        "endDate": endDate,
        "technologies": technologies,
      };

      final response = await BaseClient.putForm(
        api: EndPoints.USERDETAILS,
        formData: data,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      debugPrint("Response: ${response?.data}");

      if (response?.statusCode == 200) {
        if (response?.data is Map<String, dynamic>) {
          final responseData = response?.data;

          final status = responseData?['status'] ?? 0;
          final message = responseData?['message'] ?? 'Unknown message';
          final userData = responseData?['data'] ?? {};

          debugPrint('Full Response=======> $responseData');
          debugPrint("Token=======> $token");
          debugPrint("Response Status=======> $status");
          debugPrint("Response Message=======> $message");
          debugPrint("User Data =======> $userData");

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );

          return true;
        } else {
          debugPrint("Unexpected response format=======> ${response?.data}");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Unexpected response format.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        debugPrint("Invalid response. Status Code: ${response?.statusCode}");
        debugPrint("Unexpected response format=======> ${response?.data}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response?.data is Map<String, dynamic> &&
                    response?.data['message'] is String
                ? response?.data['message']
                : 'Unknown error occurred.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint("Exception caught: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      _loading = false;
      notifyListeners();
    }

    return false;
  }
}
