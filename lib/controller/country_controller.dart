import 'package:get/get.dart';

import '../data/models/countryModel.dart';

class CountryController extends GetxController {
  var selectedCountry = ''.obs;
  void updateCountry(String country) {
    selectedCountry.value = country;
  }
}
