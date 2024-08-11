import 'package:get/get.dart';

class ProfileController extends GetxController {
  var currentIndex = 0.obs;
  void nextPage() {
    if (currentIndex.value < 7) {
      currentIndex.value++;
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
    void goToPage(int index) {
      if (index >= 0 && index < 8) {
        currentIndex.value = index;
      }
    }
  }
}
