import 'package:get/get.dart';

class ContainerController extends GetxController {
  var selectedcont = [false, false, false].obs;
  void toggelSelection(int index) {
    selectedcont[index] = !selectedcont[index];
  }
}
