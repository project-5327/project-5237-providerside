import 'package:dio/dio.dart';
import 'package:project_5237_provider/config/baseclient/base_client.dart';
import 'package:project_5237_provider/config/baseclient/endpoints.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'https://project5237.zatest.biz/api';
    _dio.options.headers['Content-Type'] = 'application/json';
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
        '/projects',
        data: data,
      );

      return response;
    } on DioError catch (e) {
      return e.response ?? Response(requestOptions: RequestOptions(path: ''));
    }
  }

  Future<ProposalDataResponse> getproposallistData() async {
    final response = await BaseClient.get(
      api: EndPoints.GETPROPOSALS,
    );

    return getProposalDataResponse(response.toString());
  }
}
