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

  // PROPOSAL GET API

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
          for (int i = 0; i < _length!; i++) {
            // _proposalDocList!.add(_proposalDataDoc.projects[i]??)
          }

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
}
