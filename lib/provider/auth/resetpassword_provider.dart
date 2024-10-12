import 'package:flutter/material.dart';

import '../../config/baseclient/base_client.dart';
import '../../config/baseclient/endpoints.dart';


class ResetPasswordProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _newpasswordController;

  Future<bool> resetPassword({
    required BuildContext context,
    String? email,
    String? newPassword,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      print('====> Sending request to: ${EndPoints.RESETPASSWORD}');
      print('====> Payload: {"email": "$email", "newPassword": "$newPassword"}');

      final response = await BaseClient.post(
        api: EndPoints.RESETPASSWORD,
        payloadObj: {
          'email': email,
          'newPassword': newPassword,
        },
      );

      if (response != null) {
        print('====> Response Status: ${response.statusCode}');
        print('====> Response Body: ${response.body}');

        if (response.statusCode == 200) {
          _isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.data['message'])),
          );
          notifyListeners();
          return true;
        } else {
          _errorMessage = 'Failed with status code: ${response.statusCode}';
          print('====> Error: $_errorMessage, Response Body: ${response.body}');
          _isLoading = false;
          notifyListeners();
          return false;
        }
      } else {
        _errorMessage = 'Response is null';
        print('====> Error: $_errorMessage');
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
      print('====> Exception: $e');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}


