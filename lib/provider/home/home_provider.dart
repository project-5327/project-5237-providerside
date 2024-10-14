import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_5237_provider/config/baseclient/CustomInterceptor.dart';
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
  List<ProposalListData>? _filteredProposals;
  List<String> _selectedFilters = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  ProposalData? get proposalDataDoc => _proposalDataDoc;
  List<ProposalListData>? get filteredProposals => _filteredProposals;
  int? get lastpage => _lastpage;
  int? get length => _length;

  void applySelectedFilters(List<String> selectedFilters) {
    _selectedFilters = selectedFilters;
    _applyFilters();
    notifyListeners();
  }

  void removeProposal(String proposalId) {
    _filteredProposals?.removeWhere((proposal) => proposal.sId == proposalId);
    notifyListeners();
  }

  void _applyFilters() {
    if (_proposalDataDoc != null) {
      _filteredProposals = _proposalDataDoc!.projects?.where((project) {
        return _selectedFilters.every((filter) {
          return project.skillsRequired?.contains(filter) ?? false;
        });
      }).toList();
    } else {
      _filteredProposals = _proposalDataDoc?.projects;
    }
  }

  void filterProposals(String query) {
    if (query.isEmpty) {
      _filteredProposals = _proposalDataDoc?.projects;
    } else {
      _filteredProposals = _proposalDataDoc?.projects?.where((project) {
        final clientMatch = project.clientId?.userName
                ?.toLowerCase()
                .contains(query.toLowerCase()) ??
            false;
        final projectNameMatch =
            project.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
        final budgetMatch = project.budget != null &&
            ('\$${project.budget?.min} - \$${project.budget?.max}'
                .contains(query));

        return clientMatch || projectNameMatch || budgetMatch;
      }).toList();
    }
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
          _filteredProposals = response.data?.projects;
          _lastpage = response.data?.totalPages ?? 0;
          _length = response.data?.projects?.length ?? 0;

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

  Future<bool> createProposalN({
    required BuildContext context,
    required Map<String, dynamic> proposalData,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final ApiService apiService = ApiService();

    try {
      Response response = await apiService.createProposal(proposalData);

      debugPrint("Response status code: ${response.statusCode}");
      debugPrint("Response data: ${response.data}");

      if (response.data != null && response.statusCode == 201) {
        if (response.data['message'] != null) {
          debugPrint("Message======> ${response.data['message']}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Proposal sent successfully")),
          );
        } else {
          debugPrint("Message not found in response");
        }
        return true;
      } else {
        debugPrint("Error: Non-201 response or null data");
        _errorMessage =
            response.data?['message'] ?? 'Failed to create project.';
        debugPrint("Error======> ${_errorMessage}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage!)),
        );
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      debugPrint("Error======> ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMessage!),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}


// Future<void> updateProposal() async {
//   // Authorization header
//  

