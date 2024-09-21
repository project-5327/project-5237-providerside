import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../data/models/proposal_accept_model.dart';
import '../../data/services/api_services.dart';
import '../../presentation/widgets/toast_comp.dart';

import 'package:http_parser/http_parser.dart';

class ProposalProvider with ChangeNotifier {
  File? _file;

  final TextEditingController _datetimeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _projectTItleController = TextEditingController();

  TextEditingController get datetimeController => _datetimeController;
  TextEditingController get addressController => _addressController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get titleController => _titleController;
  TextEditingController get rateController => _rateController;
  TextEditingController get projectTItleController => _projectTItleController;

  File? get file => _selectedImage;

  set setFIle(File? image) {
    _selectedImage = image;
    notifyListeners();
  }

  File? _selectedImage;
/*  Proposal? proposal;*/
  bool _loading = false;
  String? _errorMessage;
  bool _isSuccess = false;

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  Future<void> createProposals(BuildContext context, String proposalId) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    final ApiService apiService = ApiService();

    final proposalData = {
      if (file != null)
        'proposalImage': [
          await MultipartFile.fromFile(file!.path,
              filename: file!.path, contentType: MediaType('image', 'jpg')),
        ],
      'projectId': '66ed389638993904863e8daa',
      'proposalTitle': titleController.text,
      'proposalDescription': descriptionController.text,
      'estimatedTime': datetimeController.text,
      'proposedBudget': rateController.text,
      'address': addressController.text,
    };
    try {
      Response response = await apiService.createProposal(proposalData);

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

  // Future<void> acceptProposalPutApi(String proposalId) async {
  //   isLoading = true;
  //   errorMessage = null;
  //   notifyListeners();

  //   await ApiService()
  //       .acceptProposalApi(
  //           proposalId,
  //           titleController.text,
  //           datetimeController.text,
  //           rateController.text,
  //           addressController.text,
  //           descriptionController.text)
  //       .then((response) {
  //     print('===> ${response.status}');
  //     if (response.status == 200) {
  //       isLoading = false;
  //       notifyListeners();
  //     } else {
  //       isLoading = false;
  //       notifyListeners();
  //       ToastComp.showToast(
  //         'Something went wrong!',
  //         backgroundColor: Colors.black,
  //         textColor: Colors.white,
  //       );
  //     }
  //   });
  // }
}
