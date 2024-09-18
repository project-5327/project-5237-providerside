import 'package:flutter/material.dart';
import '../../config/baseclient/base_client.dart';
import '../../config/baseclient/endpoints.dart';

class OnbaordingProvider extends ChangeNotifier {
  // Form key
  final formKeyRegist = GlobalKey<FormState>();

  // Text controllers for user details
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _profileDescriptionController = TextEditingController();
  final TextEditingController _hourlyRateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _EmployementTypeController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _degreeORCertificateController = TextEditingController();
  final TextEditingController _instituteNameController = TextEditingController();
  final TextEditingController _FeildOfStudyController = TextEditingController();
  final TextEditingController _location1Controller = TextEditingController();
  final TextEditingController _startDate1Controller = TextEditingController();
  final TextEditingController _endDate1Controller = TextEditingController();


 String _contryName ="";
 String _cityName ="";
  // Controllers for experience fields
  final List<Map<String, dynamic>> _experiences = [];

  // Controllers for education fields
  final List<Map<String, dynamic>> _education = [];

  // Controllers for skills
   List<String> _skills = [];

  // Controllers for languages
   List<String> _languages = [];

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  // Getters for user details
  TextEditingController get fnameController => _fnameController;
  TextEditingController get lnameController => _lnameController;
  TextEditingController get addressController => _addressController;
  TextEditingController get cityController => _cityController;
  TextEditingController get pincodeController => _pincodeController;
  TextEditingController get countryController => _countryController;
  TextEditingController get titleController => _titleController;
  TextEditingController get profileDescriptionController =>
      _profileDescriptionController;
  TextEditingController get hourlyRateController => _hourlyRateController;
  TextEditingController get phoneNumberController => _phoneNumberController;

  TextEditingController get companyNameController => _companyNameController;
  TextEditingController get roleController => _roleController;
  TextEditingController get locationController => _locationController;
  TextEditingController get employementTypeController => _EmployementTypeController;
  TextEditingController get startDateController => _startDateController;
  TextEditingController get endDateController => _endDateController;
  TextEditingController get descriptionController => _descriptionController;

  TextEditingController get degreeORCertificateController => _degreeORCertificateController;
  TextEditingController get instituteNameController => _instituteNameController;
  TextEditingController get feildOfStudyController => _FeildOfStudyController;
  TextEditingController get location1Controller => _location1Controller;
  TextEditingController get startDate1Controller => _startDate1Controller;
  TextEditingController get endDate1Controller => _endDate1Controller;

  List<String>  get languages => _languages;

  List<String>  get skills => _skills;

  String  get countryName => _contryName;

  String get cityName =>_cityName;


  set setLanguages(List<String> val) {
    _languages = val;
    print('======> _languages ${_languages}');
    notifyListeners();
  }

  set contryName(String val ) {
    _cityName = val;
    print('======> _languages ${_cityName}');
    notifyListeners();
  }

  set cityName(String val ) {
    _contryName = val;
    print('======> _languages ${_contryName}');
    notifyListeners();
  }

  set setSkill(List<String> val) {
    _skills = val;
   /* print('======> _skills ${descriptionController}');*/
    print('======> _skills ${_skills}');
    notifyListeners();
  }




  /*List<FilterModel> _priceDataList = [];
  List<FilterModel> get priceDataList => _priceDataList;

  set priceDataList(List<FilterModel> val) {
    _priceDataList = val;
    notifyListeners();
  }*/


  // Add experience
  void addExperience(String companyName, String role, String duration,
      String description, String employmentType, String location,
      String startDate, String endDate) {
    _experiences.add({
      "companyName": companyName,
      "role": role,
      "duration": duration,
      "description": description,
      "employmentType": employmentType,
      "location": location,
      "startDate": startDate,
      "endDate": endDate,
    });
    notifyListeners();
  }

  // Add education
  void addEducation(String institutionName, String degree,
      String yearOfCompletion, String fieldOfStudy, String location,
      String startDate, String endDate) {
    _education.add({
      "institutionName": institutionName,
      "degree": degree,
      "yearOfCompletion": yearOfCompletion,
      "fieldOfStudy": fieldOfStudy,
      "location": location,
      "startDate": startDate,
      "endDate": endDate,
    });
    notifyListeners();
  }

  // Add skill
  void addSkill(String skill) {
    _skills.add(skill);
    notifyListeners();
  }

  // Add language
/*
  void addLanguage(String languageName, String proficiencyLevel) {
    _languages.add({
      "languageName": languageName,
      "proficiencyLevel": proficiencyLevel,
    });
    notifyListeners();
  }
*/

  // Method to post the user data
  Future<bool> submitUserDetails({required BuildContext context}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final userData = {
      "firstName": _fnameController.text.trim(),
      "lastName": _lnameController.text.trim(),
      "address": _addressController.text.trim(),
      "city": _cityController.text.trim(),
      "pincode": _pincodeController.text.trim(),
      "country": _countryController.text.trim(),
      "title": _titleController.text.trim(),
      "profileDescription": _profileDescriptionController.text.trim(),
      "hourlyRate": int.tryParse(_hourlyRateController.text.trim()) ?? 0,
      "phoneNumber": _phoneNumberController.text.trim(),
      "experience": _experiences,
      "education": _education,
      "skills": _skills,
      "languages": _languages,
    };

    try {
      final response = await BaseClient.post(
        api: EndPoints.ONBOARDING,
        payloadObj: userData,
      );

      if (response != null && response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'])),
        );
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Failed to register user';
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

  // Method to validate and submit the form
  void registerUser({required BuildContext context}) async {
    if (formKeyRegist.currentState?.validate() ?? false) {
      final success = await submitUserDetails(context: context);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User registered successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage ?? 'Registration failed')),
        );
      }
    }
  }

  String? validateTitle(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }


  String? validateCompany(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }


  String? validateHourlyRate(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  String? validateLocatioon1(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }


  String? validateFeildOfStudy(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  String? validateZipcode(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  String? validateInstituteName(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }


  String? validateDegreeOrCertifcate(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  String? validateDate(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  String? validateLocation(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }


  String? validateEmployementType(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }



  String? validateDescription(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }



  String? validateRole(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }


  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }


  String? validatefname(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  String? validatelname(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }
    return null;

  }





}






