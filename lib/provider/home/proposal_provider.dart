import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_5237_provider/config/baseclient/CustomInterceptor.dart';
import 'package:project_5237_provider/config/baseclient/base_client.dart';
import 'package:project_5237_provider/config/baseclient/endpoints.dart';
import 'package:project_5237_provider/data/models/proposal_by_user.dart';
import '../../data/services/api_services.dart';

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
    debugPrint('=========>  file $_selectedImage');
    notifyListeners();
  }

  File? _selectedImage;
/*  Proposal? proposal;*/
  bool _loading = false;
  String? _errorMessage;
  bool _isSuccess = false;

  ProposalByUser? proposalByUser;

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  Future<void> createProposals(BuildContext context, String projectId) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    final ApiService apiService = ApiService();
    debugPrint('=========> file path  $file');
    final proposalData = {
      if (file != null)
        'proposalImage': [
          await MultipartFile.fromFile(file!.path,
              filename: file!.path, contentType: MediaType('image', 'jpg')),
        ],
      'projectId': projectId,
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
        if (response.data['message'] != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.data['message'])),
          );
          debugPrint("Response message: ${response.data['message']}");
        } else {
          debugPrint("Message key not found in the response data");
        }
        _isSuccess = true;
      } else {
        _errorMessage =
            response.data?['message'] ?? 'Failed to create proposal.';
        debugPrint("Error message: $_errorMessage");

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

  //GetProposalByProvider? getProposalByProvider;

  //ProposalData? get proposalDataDoc => _proposalDataDoc;

  void setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> updateProposalN({
    required String status,
    required BuildContext context,
  }) async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();
    String? token = await CustomInterceptor.getToken();

    var headers = {'Authorization': 'Bearer $token'};
    try {
      var data = FormData.fromMap({'status': status});

      var dio = Dio();

      var response = await dio.put(
        'https://project5237.zatest.biz/api/updateProposal/66f6c79e1b36ac0df37e6d26',
        options: Options(headers: headers),
        data: data,
      );

      if (response.statusCode == 200) {
        print('Response data: ${json.encode(response.data)}');

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.data['message'])));
      } else {
        print('Error: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<void> createProposal({
  //   required BuildContext context,
  //   required Map<String, dynamic> proposalData,
  // }) async {
  //   _loading = true;
  //   _errorMessage = null;
  //   notifyListeners();

  //   final ApiService apiService = ApiService();

  //   try {
  //     Response response = await apiService.createProposal(proposalData);

  //     debugPrint("Response data: ${response.data}");
  //     debugPrint("Response status code: ${response.statusCode}");

  //     if (response.data != null && response.statusCode == 201) {
  //       // Project creation success
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(response.data['message'])),
  //       );
  //       debugPrint("Response message: ${response.data['message']}");
  //       _isSuccess = true;
  //     } else {
  //       _errorMessage = response.data['message'] ?? 'Failed to create project.';
  //       debugPrint("Error message: ${response.data['message']}");

  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(_errorMessage!)),
  //       );
  //       _isSuccess = false;
  //     }
  //   } catch (e) {
  //     _errorMessage = 'An error occurred. Please try again.';
  //     debugPrint("Exception occurred: ${e.toString()}");

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(_errorMessage!)),
  //     );
  //     _isSuccess = false;
  //   }

  //   _loading = false;
  //   notifyListeners();
  // }

  Future<void> fetchAllProposal(BuildContext context) async {
    _loading = true;
    notifyListeners();
    String? token = await CustomInterceptor.getToken();
    try {
      final response = await BaseClient.get(api: EndPoints.USERPROPOSALS);

      if (response != null && response.statusCode == 200) {
        final data = response.data;
        debugPrint('response ==========> $data');

        if (data is List) {
          proposalByUser =
              ProposalByUser.fromJson(data as Map<String, dynamic>);
        } else if (data is Map<String, dynamic>) {
          // If the data is a map, parse it as originally expected
          proposalByUser = ProposalByUser.fromJson(data);
        }

        _errorMessage = '';
        debugPrint('====Proposals retrieved successfully.=====');
        debugPrint("Proposal details======> :$data");

        _loading = false;
        notifyListeners();
      } else {
        debugPrint('Error=======> ${response?.statusCode}, ${response?.data}');

        _errorMessage = response?.data['message'] ?? 'Failed to load data';

        debugPrint('Error: ${response?.statusCode}, ${response?.data}');
      }
      _loading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'An error occurred while fetching data';
      debugPrint("Error======> ${e.toString()}");
      _loading = false;
      notifyListeners();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
