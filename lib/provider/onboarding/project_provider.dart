import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../data/services/api_services.dart';

class ProjectProvider with ChangeNotifier {
  bool _loading = false;
  String? _errorMessage;
  bool _isSuccess = false;

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  Future<void> createProject({
    required BuildContext context,
    required Map<String, dynamic> projectData,
  }) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    final ApiService apiService = ApiService();

    try {
      Response response = await apiService.createProject(projectData);

      debugPrint("Response data: ${response.data}");
      debugPrint("Response status code: ${response.statusCode}");

      if (response.data != null && response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'])),
        );
        debugPrint("Response message: ${response.data['message']}");
        _isSuccess = true;
      } else {
        _errorMessage = response.data['message'] ?? 'Failed to create project.';
        debugPrint("Error message: ${response.data['message']}");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage!)),
        );
        _isSuccess = false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      debugPrint("Exception occurred: ${e.toString()}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_errorMessage!)),
      );
      _isSuccess = false;
    }

    _loading = false;
    notifyListeners();
  }
}
