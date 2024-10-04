import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_5237_provider/config/baseclient/CustomInterceptor.dart';
import 'package:project_5237_provider/config/baseclient/base_client.dart';
import 'package:project_5237_provider/config/baseclient/endpoints.dart';
import 'package:project_5237_provider/data/models/freelancer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FreelancerProvider with ChangeNotifier {
  bool _loading = false;
  String? _errorMessage;
  bool _isSuccess = false;
  UserDetails? freelancerModel;
  PersonalProjects? personalProjects;

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  Future<bool> updateProfile({
    required BuildContext context,
    required String imagePath,
    required String username,
  }) async {
    _loading = true;
    notifyListeners();

    String? token = await CustomInterceptor.getToken();

    try {
      final response = await BaseClient.puttoken(
          api: EndPoints.USERDETAILS,
          token: token,
          payloadObj: {
            "userName": username,
            "profileImage": imagePath,
          });

      debugPrint("Response: ${response?.data}");

      if (response?.statusCode == 200) {
        if (response?.data is Map<String, dynamic> &&
            response?.data['message'] is String) {
          debugPrint('Full Response: ${response?.data}');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response!.data['message'])),
          );
          return true;
        } else {
          debugPrint("Unexpected response format");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Unexpected response format.')),
          );
        }
      } else {
        debugPrint("Invalid credentials or null response");
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

  String getFileExtension(String filePath) {
    return filePath.split('.').last.toLowerCase();
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
        debugPrint('response ==========> ${data}');

        if (data != null) {
          freelancerModel = UserDetails.fromJson(data);
          _errorMessage = '';
          debugPrint('==== Freelancers retrieved successfully.=====');
          debugPrint("Freelancer details======> :${freelancerModel}");
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

    void _showSnackBar(BuildContext context, String? message) {
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
        api: EndPoints
            .USERDETAILS, // Assuming USERPROJECTS is the correct API for personal projects.
        token: token,
      );

      if (response != null && response.statusCode == 200) {
        final data = response.data;
        debugPrint('response ==========> ${data}');

        if (data != null) {
          // Parse the projects data properly
          freelancerModel = UserDetails.fromJson(data);
          personalProjects =
              (freelancerModel?.personalProjects ?? []) as PersonalProjects?;
          _errorMessage = '';
          debugPrint('==== Projects retrieved successfully.=====');
          debugPrint("Freelancer Projects======> :${personalProjects}");
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
}
