import 'package:project_5237_provider/config/baseclient/base_client.dart';
import 'package:project_5237_provider/config/baseclient/endpoints.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';

class ApiService {
  Future<ProposalDataResponse> getproposallistData() async {
    final response = await BaseClient.get(
      api: EndPoints.GETPROPOSALS,
    );

    return getProposalDataResponse(response.toString());
  }
}
