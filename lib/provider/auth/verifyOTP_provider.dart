import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/baseclient/base_client.dart';
import '../../config/baseclient/endpoints.dart';


class VerifyOTPProvider extends ChangeNotifier {
  late String _email;
  String _otpCode = "";
  bool _isLoading = false;
  String? _errorMessage;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get otpCode => _otpCode;

  void setOtpCode(String code) {
    _otpCode = code;
    notifyListeners();
  }

//   Future<bool> verifyOTP(
//       {required BuildContext context,
//       // required String email,
//       required String otp}) async {
//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? email = prefs.getString('email');

//       final response = await BaseClient.post(
//         api: EndPoints.VERIFY_OTP,
//         payloadObj: {
//           'email': email,
//           'otp': otp,
//         },
//       );

//       if (response != null && response.statusCode == 200) {
//         debugPrint("message======>${response.data['message']}");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(response.data['message'])),
//         );
//         _isLoading = false;
//         notifyListeners();
//         return true;
//       } else {
//         _errorMessage = response.data['message'] ?? 'Invalid or expired OTP';
//         _isLoading = false;
//         notifyListeners();
//         return false;
//       }
//     } catch (e) {
//       _errorMessage = 'An error occurred. Please try again.';
//       _isLoading = false;
//       notifyListeners();
//       return false;
//     }
//   }
// }

  Future<bool> verifyOTP({
    required BuildContext context,
    required String otp,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('email');

      if (email == null) {
        _errorMessage = 'Email not found. Please try again.';
        _isLoading = false;
        notifyListeners();
        return false;
      }

      final response = await BaseClient.post(
        api: EndPoints.VERIFY_OTP,
        payloadObj: {
          'email': email,
          'otp': otp,
        },
      );

      if (response != null && response.statusCode == 200) {
        debugPrint("message======>${response.data['message']}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'])),
        );
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.data['message'] ?? 'Invalid or expired OTP';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
