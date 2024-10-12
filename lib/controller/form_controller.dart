import 'package:get/get.dart';

class FormController extends GetxController {
  var obscureText = false.obs;
  var obscureRepeatText = false.obs;

//validate email
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

// validate username
  String? validateUserName(String value) {
    if (value.isEmpty) {
      return "Username can't be empty";
    } else if (value.length < 4) {
      return 'Username must be at least 4 characters.';
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
    }
    //  else if (value != password) {
    //   return 'Repeat password does not match ';
    // }
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

  //validate date
  String? validateDate(
    String value,
  ) {
    if (value.isEmpty) {
      return "Date can't be empty";
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
      return "Enter a valid 10 digit phone number";
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

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void toggleRepeatPasswordVisibility() {
    obscureRepeatText.value = !obscureRepeatText.value;
  }
}
