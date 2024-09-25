import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';
import 'package:project_5237_provider/data/services/api_services.dart';
import 'package:project_5237_provider/presentation/widgets/toast_comp.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  ProposalData? _proposalDataDoc;
  List<String>? _proposalDocList;
  int? _lastpage;
  int? _length;
  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  ProposalData? get proposalDataDoc => _proposalDataDoc;
  int? get lastpage => _lastpage;
  int? get length => _length;

  List<String>? get proposalDocList => _proposalDocList;

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> proposalGetApi() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      await ApiService().getproposallistData().then((response) {
        if (response.status == 200) {
          _proposalDataDoc = response.data;
          _lastpage = response.data?.totalPages ?? 0;
          _length = response.data?.projects?.length ?? 0;
          for (int i = 0; i < _length!; i++) {}

          _isLoading = false;
          notifyListeners();
        } else {
          _isLoading = false;
          notifyListeners();
          ToastComp.showToast(
            'Something went wrong!',
            backgroundColor: Colors.black,
            textColor: Colors.white,
          );
        }
      });
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      ToastComp.showToast(
        _errorMessage ?? "",
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      _isLoading = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createProposal({
    required BuildContext context,
    required Map<String, dynamic> proposalData,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final ApiService apiService = ApiService();

    try {
      Response response = await apiService.createProposal(proposalData);

      debugPrint("Response data: ${response.data}");
      debugPrint("Response status code: ${response.statusCode}");

      if (response.data != null && response.statusCode == 201) {
        // Project creation success
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

    _isLoading = false;
    notifyListeners();
  }
}
