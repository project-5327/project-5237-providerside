import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../data/models/proposal_accept_model.dart';
import '../../data/services/api_services.dart';
import '../../presentation/widgets/toast_comp.dart';

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
  TextEditingController get descriptionController =>
      _descriptionController;
  TextEditingController get titleController =>
      _titleController;
  TextEditingController get rateController =>
      _rateController;
  TextEditingController get projectTItleController =>
      _projectTItleController;

  File? get file=> _file;

/*  Proposal? proposal;*/
  bool isLoading = true;
  String? errorMessage;

  final ApiService _apiService = ApiService();

  Future<void> acceptProposalPutApi(String proposalId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      await ApiService().acceptProposalApi(_titleController.text,projectTItleController.text,
          datetimeController.text,rateController.text,addressController.text,descriptionController.text).then((response) {

        print('===> ${response.status }');
        if (response.status == 200) {


          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();
          ToastComp.showToast(
            'Something went wrong!',
            backgroundColor: Colors.black,
            textColor: Colors.white,
          );
        }
      });
    } catch (e) {
      errorMessage = 'An error occurred. Please try again.';
      ToastComp.showToast(
        errorMessage ?? "",
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      isLoading = false;
      notifyListeners();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

