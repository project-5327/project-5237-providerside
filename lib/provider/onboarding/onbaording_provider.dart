import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_5237_provider/presentation/screens/dashboard/dashboard_view.dart';
import '../../config/baseclient/base_client.dart';
import '../../config/baseclient/endpoints.dart';
import 'package:http_parser/src/media_type.dart';

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
  final TextEditingController _profileDescriptionController =
      TextEditingController();
  final TextEditingController _hourlyRateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  // add experiance
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _DurationController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _EmployementTypeController =
      TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _description1Controller = TextEditingController();

  //education
  final TextEditingController _degreeORCertificateController =
      TextEditingController();
  final TextEditingController _instituteNameController =
      TextEditingController();
  final TextEditingController _FeildOfStudyController = TextEditingController();
  final TextEditingController _location1Controller = TextEditingController();
  final TextEditingController _startDate1Controller = TextEditingController();
  final TextEditingController _endDate1Controller = TextEditingController();

  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _projectDescriptionCOntroller =
      TextEditingController();
  final TextEditingController _startDate2Controller = TextEditingController();
  final TextEditingController _endDate2Controller = TextEditingController();

  final TextEditingController _proficiancyController = TextEditingController();

  final bool _isOngoin = false;

  File? _selectedImage;

  String _contryName = "";
  String _cityName = "";
  // Controllers for experience fields
  final List<Map<String, dynamic>> _experiences = [];

  final List<Map<String, dynamic>> _addYourPersonalProject = [];
  final List<Map<String, dynamic>> _addLanguages = [];

  // Controllers for education fields
  final List<Map<String, dynamic>> _education = [];

  // Controllers for skills
  List<String> _skills = [];

  List<String> _technologies = [];

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
  TextEditingController get durationController => _DurationController;
  TextEditingController get locationController => _locationController;
  TextEditingController get employementTypeController =>
      _EmployementTypeController;
  TextEditingController get startDateController => _startDateController;
  TextEditingController get endDateController => _endDateController;
  TextEditingController get descriptionController => _descriptionController;

  TextEditingController get description1Controller => _description1Controller;

  TextEditingController get degreeORCertificateController =>
      _degreeORCertificateController;
  TextEditingController get instituteNameController => _instituteNameController;
  TextEditingController get feildOfStudyController => _FeildOfStudyController;
  TextEditingController get location1Controller => _location1Controller;
  TextEditingController get startDate1Controller => _startDate1Controller;
  TextEditingController get endDate1Controller => _endDate1Controller;

  TextEditingController get proficiancyController => _proficiancyController;

  TextEditingController get projectNameController => _projectNameController;
  TextEditingController get projectDescriptionCOntroller =>
      _projectDescriptionCOntroller;
  TextEditingController get startDate2Controller => _startDate2Controller;
  TextEditingController get endDate2Controller => _endDate2Controller;

  List<String> get languages => _languages;

  List<String> get skills => _skills;

  List<String> get technlogies => _technologies;

  String get countryName => _contryName;

  String get cityName => _cityName;

  File? get selectedImage => _selectedImage;

  File? get file => _selectedImage;
  set setImage(File image) {
    _selectedImage = image;
    notifyListeners();
  }

  set setLanguages(List<String> val) {
    _languages = val;
    print('======> language $_languages');
    notifyListeners();
  }

  set contryName(String val) {
    _cityName = val;
    debugPrint('======> countryname $_cityName');
    notifyListeners();
  }

  set cityName(String val) {
    _contryName = val;
    debugPrint('======> cityname $_contryName');
    notifyListeners();
  }

  set setSkill(List<String> val) {
    _skills = val;
    debugPrint('======> _skills $_skills');
    notifyListeners();
  }

  set setTechnologies(List<String> val) {
    _technologies = val;
    /* print('======> _skills ${descriptionController}');*/
    debugPrint('======> _skills $_technologies');
    notifyListeners();
  }

  /*List<FilterModel> _priceDataList = [];
  List<FilterModel> get priceDataList => _priceDataList;

  set priceDataList(List<FilterModel> val) {
    _priceDataList = val;
    notifyListeners();
  }*/

  // Add experience
  void addExperience(String companyName, String role, String employmentType,
      String location, String startDate, String endDate, String description) {
    _experiences.add({
      "companyName": companyName,
      "role": role,
      "employmentType": employmentType,
      "location": location,
      "startDate": startDate,
      "endDate": endDate,
      "description": description,
    });
    notifyListeners();
  }

  void addYourPersonalProject(
      String projectName,
      String ProjectDescr,
      String startDate,
      String endDate,
      List<String> technologies,
      bool isOngoing) {
    _addYourPersonalProject.add({
      "projectName": projectName,
      "description": ProjectDescr,
      "startDate": startDate,
      "endDate": endDate,
      "technologies": technologies,
      "isOngoing": isOngoing
    });
    notifyListeners();
  }

  // Add education
  void addEducation(String institutionName, String degree, String fieldOfStudy,
      String location, String startDate, String endDate) {
    _education.add({
      "institutionName": institutionName,
      "degree": degree,
      "fieldOfStudy": fieldOfStudy,
      "location": location,
      "startDate": startDate,
      "endDate": endDate,
    });
    notifyListeners();
  }

  void addYourLangauges(List<String> languages, String proficiency) {
    List<Map<String, dynamic>> addLanguages = [];

    for (String language in languages) {
      // Create a map for each language
      Map<String, dynamic> languageData = {
        "languageName": language,
        // Only include proficiency level if it's not empty
        if (proficiency.isNotEmpty) "proficiencyLevel": proficiency,
      };
      addLanguages.add(languageData); // Add the map to the list
    }

    // Call notifyListeners or send this data to backend
    notifyListeners();

    // You would store _addLanguages and send it as part of the formData later
    debugPrint('Selected languages and proficiency: $addLanguages');
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

    try {
      // Prepare FormData for multipart/form-data request
      FormData formData = FormData.fromMap({
        "firstName": _fnameController.text.trim(),
        "lastName": _lnameController.text.trim(),
        "address": _addressController.text.trim(),
        "city": _cityController.text.trim(),
        "pincode": _pincodeController.text.trim(),
        "country": _countryController.text.trim(),
        "title": _titleController.text.trim(),

        // Experience field as a list of objects
        "experience": _experiences,

        // Education field as a list of objects
        "education": _education,

        // Skills as a list of strings
        "skills": _skills,

        "languages":
            _addLanguages, // Assuming this is the list generated earlier

        "profileDescription": _profileDescriptionController.text.trim(),
        "hourlyRate": _hourlyRateController.text.trim(),
        "phoneNumber": _phoneNumberController.text.trim(),

        // Personal projects as a list of objects
        "personalProjects": _addYourPersonalProject,

        // Profile image file (if available)
        "profileImage": file != null
            ? await MultipartFile.fromFile(
                file!.path,
                filename: file!.path.split('/').last,
                contentType: MediaType('image', 'jpg'),
              )
            : null,
      });

      // DEBUG: Print each field from FormData
      debugPrint('======= Form Data Sent to Backend =======');
      for (var field in formData.fields) {
        debugPrint('${field.key}: ${field.value}');
      }

      if (file != null) {
        debugPrint('Profile Image: ${file!.path}');
      }

      debugPrint('======= End of Form Data =======');

      // Make API request
      final response = await BaseClient.post(
        api: EndPoints.ONBOARDING,
        formData: formData,
      );

      if (response != null && response.statusCode == 201) {
        debugPrint('Response data: ${response.data}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'])),
        );

        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Failed to register user';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text(response.data['message'] ?? 'Something went wrong')),
        );
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      _errorMessage = 'An error occurred. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
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

    final num? rate = num.tryParse(value);
    if (rate == null) {
      return 'Please enter a valid number';
    }

    if (rate < 0) {
      return 'Rate cannot be negative';
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

  String? validateStartDate(String value, String endDate) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }

    DateFormat format = DateFormat('MMMM yyyy');

    try {
      DateTime startDate = format.parse(value);
      DateTime endDateTime = format.parse(endDate);
    } catch (e) {
      return "Invalid date format";
    }

    return null;
  }

  String? validateEndDate(String value, String startDate) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }

    DateFormat format = DateFormat('MMMM yyyy');

    try {
      DateTime endDateTime = format.parse(value);
      DateTime startDateTime = format.parse(startDate);
      if (endDateTime == startDateTime) {
        return "End date and start date can't be the same";
      }
      if (endDateTime.isBefore(startDateTime)) {
        return "End date should be later than start date";
      }
    } catch (e) {
      return "";
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
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return "First Name can't contain numbers";
    }

    if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9]').hasMatch(value)) {
      return "First Name can't contain special characters";
    }
    if (value.length < 3) {
      return "First Name must be at least 3 characters long";
    }
    return null;
  }

  String? validatefullname(String value) {
    if (value.isEmpty) {
      return "Full name field can't be empty";
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return "Full Name can't contain numbers";
    }

    if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9]').hasMatch(value)) {
      return "Full Name can't contain special characters";
    }
    if (value.length < 3) {
      return "Full Name must be at least 3 characters long";
    }
    return null;
  }

  String? validatelname(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }

    if (RegExp(r'[0-9]').hasMatch(value)) {
      return "Last Name can't contain numbers";
    }

    if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9]').hasMatch(value)) {
      return "Last Name can't contain special characters";
    }
    if (value.length < 3) {
      return "Last Name must be at least 3 characters long";
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
