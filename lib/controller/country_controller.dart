import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValues = <String, String>{}.obs;

  void updateValue(String key, String value) {
    selectedValues[key] = value;
  }

  String getValue(String key) {
    return selectedValues[key] ?? '';
  }
}
