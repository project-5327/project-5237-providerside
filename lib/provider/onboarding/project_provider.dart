import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:project_5237_provider/config/baseclient/base_client.dart';
import 'package:project_5237_provider/config/baseclient/endpoints.dart';
import 'package:project_5237_provider/data/models/project_model.dart';
import '../../data/services/api_services.dart';

class ProjectProvider with ChangeNotifier {
  bool _loading = false;
  String? _errorMessage;
  bool _isSuccess = false;

  List<Projects> _allProjects = [];
  List<Projects> _filteredProjects = [];
  List<String> _selectedFilters = [];

  List<Projects> get filteredProjects => _filteredProjects;
  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;
  ProjectModel? projectModel;

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

  Future<void> fetchAllProjects(BuildContext context) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await BaseClient.get(
        api: EndPoints.PROJECTS,
      );

      if (response != null && response.statusCode == 200) {
        final data = response.data;
        debugPrint('response ==========> $data');

        if (data != null) {
          projectModel = ProjectModel.fromJson(data);
          _errorMessage = '';
          debugPrint('====All Projects retrieved successfully.=====');
          debugPrint(
              "All Project details======> :${projectModel?.data?.projects}");

          _allProjects = projectModel?.data?.projects ?? [];
          _filteredProjects = _allProjects;
        } else {
          _errorMessage = 'No data found';
          _filteredProjects = [];
          debugPrint('Error=======> No data found');
        }
      } else {
        debugPrint('Error=======> ${response?.statusCode}, ${response?.data}');
        _errorMessage = response?.data['message'] ?? 'Failed to load data';
        _filteredProjects = [];
        debugPrint('Error: ${response?.statusCode}, ${response?.data}');
      }
    } catch (e) {
      _errorMessage = 'An error occurred while fetching data';
      _filteredProjects = [];
      debugPrint("Error======> ${e.toString()}");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void filterProjects(String query) {
    if (query.isEmpty) {
      _filteredProjects = _allProjects;
    } else {
      _filteredProjects = _allProjects.where((project) {
        final nameMatch =
            project.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
        final budgetMatch = project.budget != null &&
            ('\$${project.budget!.min}-\$${project.budget!.max}'
                .contains(query));
        final skillsMatch = project.skillsRequired != null &&
            project.skillsRequired!.any(
                (skill) => skill.toLowerCase().contains(query.toLowerCase()));
        return nameMatch || budgetMatch || skillsMatch;
      }).toList();
    }
    notifyListeners();
  }

  void applySelectedFilters(List<String> selectedFilters) {
    _selectedFilters = selectedFilters;

    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    if (_selectedFilters.isNotEmpty) {
      _filteredProjects = _allProjects.where((project) {
        return _selectedFilters.every(
            (filter) => project.skillsRequired?.contains(filter) ?? false);
      }).toList();
    } else {
      _filteredProjects = _allProjects;
    }

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
