// ignore_for_file: use_build_context_synchronously, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/create_your_profile.dart';

import '../../config/baseclient/CustomInterceptor.dart';
import '../../config/baseclient/base_client.dart';
import '../../config/baseclient/endpoints.dart';

class RegisterProvider extends ChangeNotifier {
  //Register API Implement
  final registerKeyRegist = GlobalKey<FormState>();
  // final TextEditingController _fnameController = TextEditingController();
  // final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  bool _isLoading = false;
  bool checkBox1 = false;
  bool checkBox2 = false;
  String? _errorMessage;
  // String _selectedValue = 'Client';

  bool get isLoading => _isLoading;

  // String get isSelectedClient => _selectedValue;
  // bool get isClient => isSelectedClient == "Client" ? true : false;

  String? get errorMessage => _errorMessage;
  // TextEditingController get fnameController => _fnameController;
  // TextEditingController get lnameController => _lnameController;
  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get repeatPasswordController =>
      _repeatPasswordController;

//Setter
//   void setClient(String value) {
//     _selectedValue = value;
//     notifyListeners(); // Notify listeners about the change
//   }

  Future<bool> signUp(
      {required BuildContext context,
      String? name,
      String? email,
      String? password}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await BaseClient.post(
        api: EndPoints.REGISTDER,
        payloadObj: {
          "userName": name,
          "email": email,
          "password": password,
          "isClient": false
        },
      );
      debugPrint("Data======>${response.data}");
      if (response != null && response.statusCode == 201) {
        final token = response.data["data"]['token'];
        debugPrint("Data======>${response.data}");
        debugPrint("Token======tokennnnnnnnnnn>$token");
        debugPrint("message======>${response.data['message']}");
        CustomInterceptor.setToken(token);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.data['message']),
          ),
        );

        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Invalid credentials';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'])),
        );
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

  signUpBtn({required BuildContext context}) async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    // final repeatPassword = repeatPasswordController.text.trim();

    final success = await signUp(
      context: context,
      name: fullName,
      email: email,
      password: password,
    );

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CreateYourProfile()),
      );
      // fnameController.clear();
      // lnameController.clear();
      fullNameController.clear();
      emailController.clear();
      passwordController.clear();
      repeatPasswordController.clear();
    }
    // else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text(errorMessage ?? 'Registration failed')),
    //   );
    // }
  } /* else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage ?? "Field can\'t empty")),
      );
    }*/
  /* }*/

  // Validation
  var obscureText = false;
  var obscureRepeatText = false;

//validate email
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

// validate username
  String? validateUserName(String value) {
    if (value.isEmpty) {
      return "Full Name can't be empty";
    }
    return null;
  }

//validate password
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    } else if (value.length < 6) {
      return 'Password must be at least 4characters.';
    }
    return null;
  }

  //validate repeat password
  String? validateRepeatPassword(String value, String password) {
    if (value.isEmpty) {
      return "Repeat Password can't be empty";
    } else if (value != password) {
      return 'Repeat password does not match ';
    }
    return null;
  }

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void toggleRepeatPasswordVisibility() {
    obscureRepeatText = !obscureRepeatText;
    notifyListeners();
  }

  String? validateDate(
    String value,
  ) {
    if (value.isEmpty) {
      return "Date can't be empty";
    }
    return null;
  }

// first name
  String? validateFirstName(String value) {
    if (value.isEmpty) {
      return "First Name can't be empty";
    } else if (value.length < 4) {
      return 'First name must be at least 4 characters.';
    }
    return null;
  }

// last name
  String? validateLastName(String value) {
    if (value.isEmpty) {
      return "Last Name can't be empty";
    } else if (value.length < 4) {
      return 'Last name must be at least 4 characters.';
    }
    return null;
  }

// last name
  String? validateSkills(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  String? validateExperience(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  //validate card number
  String? validateCard(
    String value,
  ) {
    if (value.isEmpty) {
      return "Card number can't be empty";
    }
    return null;
  }

//validate cv
  String? validateCVC(
    String value,
  ) {
    if (value.isEmpty) {
      return "CVC can't be empty";
    } else if (value.length < 3) {
      return 'CVC must be at least 3 characters.';
    }
    return null;
  }

  //validate Address
  String? validateAddress(
    String value,
  ) {
    if (value.isEmpty) {
      return "Address can't be empty";
    } else if (value.length < 3) {
      return 'Address must be at least 10 characters.';
    }
    return null;
  }

  String? validatePhone(
    String value,
  ) {
    if (value.isEmpty) {
      return "Phone number can't be empty";
    } else if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
      return "Enter a valid 10\ndigit phone number";
    }

    return null;
  }

  String? validateZipcode(
    String value,
  ) {
    if (value.isEmpty) {
      return "Zipcode can't be empty";
    }
    // else if (!RegExp(r"^[0-9]{5}(?:-[0-9]{4})$").hasMatch(value)) {
    //   return "Enter a valid 10\ndigit number";
    // }
    return null;
  }

  String? validateCity(
    String value,
  ) {
    if (value.isEmpty) {
      return "City can't be empty";
    }
    return null;
  }

  String? validatecountry(
    String value,
  ) {
    if (value.isEmpty) {
      return "Country can't be empty";
    }
    return null;
  }
}
