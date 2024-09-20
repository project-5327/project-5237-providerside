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



// import 'package:flutter/material.dart';
// import 'package:project_5237/config/baseclient/base_client.dart';
// import 'package:project_5237/config/baseclient/endpoints.dart';

// class ProjectProvider with ChangeNotifier {
//   bool _loading = false;
//   String? _errorMessage;

//   bool get loading => _loading;
//   String? get errorMessage => _errorMessage;
//   Future<bool> createProjectDetails({
//     required BuildContext context,
//     String? title,
//     String? description,
//     List<String>? category,
//     List<String>? subCategory,
//     int? minBudget,
//     int? maxBudget,
//     List<String>? skillsRequired,
//     String? deadline,
//     String? experienceLevel,
//     String? attachment,
//     String? timelineType,
//     List<String>? projectTime,
//   }) async {
//     _loading = true;
//     notifyListeners();

//     final Map<String, dynamic> project = {
//       'title': title ?? '',
//       'description': description ?? '',
//       'category': category ?? [],
//       'subCategory': subCategory ?? [],
//       'budget': {
//         'min': minBudget ?? 0,
//         'max': maxBudget ?? 0,
//       },
//       'skillsRequired': skillsRequired ?? [],
//       'deadline': deadline ?? '',
//       'experienceLevel': experienceLevel ?? 'beginner',
//       'Attachment': attachment ?? '',
//       'TimelineType': timelineType ?? 'short-term',
//       'projectTime': projectTime ?? [],
//       'status': 'active',
//     };

//     try {
//       final response = await BaseClient.post(
//         api: EndPoints.PROJECTS,
//         payloadObj: project,
//       );

//       debugPrint('Full response data: ${response.data.toString()}');

//       if (response != null && response.statusCode == 201) {
//         // Extract the 'message' field from the response
//         String responseMessage = '';
//         var messageData = response.data['message'];

//         // Check if message is a String or Map
//         if (messageData is String) {
//           responseMessage = messageData;
//         } else if (messageData is Map) {
//           // If 'message' is a Map, handle it accordingly (extract a specific key or convert to String)
//           responseMessage =
//               messageData['detail'] ?? 'Project created successfully';
//           // Adjust this key based on the structure of the message Map
//         } else {
//           responseMessage = response.data
//               .toString(); // Fallback to printing the full response data
//         }

//         debugPrint('Project creation response message: $responseMessage');

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(responseMessage)),
//         );

//         _loading = false;
//         notifyListeners();
//         return true;
//       } else {
//         _errorMessage = response?.data['message']?.toString() ??
//             'Failed to create project details.';
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(_errorMessage!)),
//         );
//         _loading = false;
//         notifyListeners();
//         return false;
//       }
//     } catch (e) {
//       _errorMessage = 'An error occurred. Please try again.';
//       debugPrint('Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(_errorMessage!)),
//       );
//       _loading = false;
//       notifyListeners();
//       return false;
//     }
//   }
// }
