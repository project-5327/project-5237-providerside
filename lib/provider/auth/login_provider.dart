import 'package:flutter/material.dart';
import 'package:project_5237_provider/presentation/screens/login_register/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/baseclient/CustomInterceptor.dart';
import '../../config/baseclient/base_client.dart';
import '../../config/baseclient/endpoints.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  String? _email;
  final formKeyRegist = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _otpCode = "";
  bool _obscureText = true;
  bool _obscureRepeatText = true;

  bool get obscureText => _obscureText;
  bool get obscureRepeatText => _obscureRepeatText;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  String get otpCode => _otpCode;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setOtpCode(String code) {
    _otpCode = code;
    notifyListeners();
  }

  Future<bool> login({
    required BuildContext context,
    String? email,
    String? password,
  }) async {
    debugPrint("Login method initiated");
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      debugPrint("Attempting to make a POST request");
      final response = await BaseClient.post(
        api: EndPoints.LOGIN,
        payloadObj: {
          'email': email,
          'password': password,
        },
      );
      debugPrint("Response received");

      if (response != null && response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', response.data["data"]['token']);
        final token = response.data["data"]['token'];

        debugPrint("Email======>$email");
        debugPrint("Password======>$password");
        debugPrint("Token======>$token");
        debugPrint("message======>${response.data['message']}");
        CustomInterceptor.setToken(token);
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'])),
        );
        notifyListeners();
        return true;
      } else {
        debugPrint("Error=======> ${response.data['message']}");
        debugPrint("Invalid credentials or null response");
        _errorMessage = 'Invalid credentials';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.red,
              content: Text(response.data['message'] ?? "Invalid credentials")),
        );
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      debugPrint("Exception caught========> $e");
      _errorMessage = 'An error occurred. Please try again.';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text("An error occurred. Please try again.")),
      );
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  loginBtn({required BuildContext context}) async {
    if (formKeyRegist.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      debugPrint("Email=====>$email");
      debugPrint("password=====>$password");

      final success = await login(
        context: context,
        email: email,
        password: password,
      );

      if (success) {
        Future.delayed(const Duration(seconds: 5), () {
          emailController.clear();
          passwordController.clear();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage ?? 'Login failed')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage ?? "Field can't empty")),
      );
    }
  }

  Future<bool> sendOtpPostApi(String? email,
      {required BuildContext context}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await BaseClient.post(
        api: EndPoints.SENDOTP,
        payloadObj: {'email': email},
      );

      if (response != null && response.statusCode == 200) {
        final message = response.data['message'];
        emailController.text = "";
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email!);

        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Invalid credentials';
        _isLoading = false;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              response.data['message'],
            ),
            backgroundColor: Colors.red));
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      _isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage!), backgroundColor: Colors.red));
      notifyListeners();
      return false;
    }
  }

  Future<bool> verifyOTP(String otp, {required BuildContext context}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('email');

      final response = await BaseClient.post(
        api: EndPoints.VERIFY_OTP,
        payloadObj: {
          'otp': otp,
          'email': email,
        },
      );

      if (response != null && response.statusCode == 200) {
        debugPrint("message======>${response.data['message']}");
        _isLoading = false;
        debugPrint("email======>$email");
        debugPrint("otp======>$otp");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'])),
        );

        notifyListeners();
        return true;
      } else {
        _errorMessage = response.data['message'] ?? 'Invalid or expired OTP';
        debugPrint("error======>${response.data['message']}");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_errorMessage!),
            backgroundColor: Colors.red,
          ),
        );
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      debugPrint("error======>$_errorMessage");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMessage!),
          backgroundColor: Colors.red,
        ),
      );
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> changePassword(String newPassword,
      {required BuildContext context}) async {
    print("Login method called");
    _isLoading = true;
    _errorMessage = null;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('email');

      if (email == null) {
        _errorMessage = 'No email found. Please log in again.';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage!)),
        );
        _isLoading = false;
        return false;
      }
      print("loginProvider======>${email}");
      print("loginProvider======>${newPassword}");
      final response = await BaseClient.post(
        api: EndPoints.RESETPASSWORD,
        payloadObj: {
          'email': email,
          'newPassword': newPassword,
        },
      );

      if (response != null && response.statusCode == 200) {
        print("status code======>${response.data['status']}");
        print("message======>${response.data['message']}");
        print("message======>${response.data['data']}");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'])),
        );
        return true;
      } else {
        _errorMessage = 'Invalid credentials';
        debugPrint('Error status code=======> ${response.data['status']}');
        debugPrint('Error=======> ${response.data['message']}');
        debugPrint('Error status code=======> ${response.data['status']}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.data['message']),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      debugPrint('Error=======>$e');
      return false;
    } finally {
      _isLoading = false;
    }
  }

  Future<bool> updatePassword(String? otp, String? newPassword,
      {required BuildContext context}) async {
    print("Login method called");
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('email');
      final response = await BaseClient.post(
        api: EndPoints.VERIFY_OTP,
        payloadObj: {
          'email': email,
          'otp': otp,
          'newPassword': newPassword,
        },
      );
      if (response != null && response.statusCode == 200) {
        print("message======>${response.data['message']}");
        passwordController.text = "";
        confirmPasswordController.text = "";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'])),
        );
        _isLoading = false;

        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
        );
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Invalid credentials';
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid credentials"),
            backgroundColor: Colors.red,
          ),
        );
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An error occurred. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Toggle visibility for the main password field
  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  // Toggle visibility for the repeat password field
  void toggleRepeatPasswordVisibility() {
    _obscureRepeatText = !_obscureRepeatText;
    notifyListeners();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    } else if (!RegExp(
            r'^[a-zA-Z0-9._%+-]+@(gmail\.com|yahoo\.com|hotmail\.com|outlook\.com|aol\.com)$')
        .hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }

  String? validateRepeatPassword(String value, String password) {
    if (value.isEmpty) {
      return "Repeat Password can't be empty";
    } else if (value != password) {
      return 'Repeat password does not match ';
    }
    return null;
  }
}
