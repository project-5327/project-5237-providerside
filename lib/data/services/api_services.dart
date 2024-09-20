import 'package:dio/dio.dart';
import 'package:project_5237_provider/config/baseclient/base_client.dart';
import 'package:project_5237_provider/config/baseclient/endpoints.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/proposal_accept_model.dart';

class ApiService {
  final Dio _dio = Dio();


  Future<ProposalDataResponse> getproposallistData() async {
    final response = await BaseClient.get(
      api: EndPoints.GETPROPOSALS,
    );

    return getProposalDataResponse(response.toString());
  }
  // Method to fetch proposal by ID
  Future<PropsalAcceptModel> acceptProposalApi(String projectTitle,String projectid, String  dateAndtime ,String rate ,String address, String  description ) async {
    FormData params = FormData.fromMap({
      "proposalTitle" :projectTitle,
      "projectId":projectid,
      "estimatedTime": dateAndtime,
      "proposedBudget": rate,
      "address": address,
      "proposalDescription": description,
    });
    final response = await BaseClient.put(
      api: EndPoints.ACCEPTPROPOSAL,
    );

    return acceptProposal(response.toString());
  }



  Future<Response> createProject(Map<String, dynamic> data) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      if (token != null) {
        _dio.options.headers['Authorization'] = 'Bearer $token';
      } else {
        throw Exception('Token not found');
      }

      final response = await _dio.post(
        '/proposal',
        data: data,
      );

      return response;
    } on DioError catch (e) {
      return e.response ?? Response(requestOptions: RequestOptions(path: ''));
    }
  }

  Future<Response> createProposal(Map<String, dynamic> data) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      if (token != null) {
        _dio.options.headers['Authorization'] = 'Bearer $token';
      } else {
        throw Exception('Token not found');
      }

      final response = await _dio.post(
        '/proposal',
        data: data,
      );

      return response;
    } on DioError catch (e) {
      return e.response ?? Response(requestOptions: RequestOptions(path: ''));
    }
  }
}
