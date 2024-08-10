import 'package:get/get.dart';

class ProfileController extends GetxController {
  var currentIndex = 0.obs;
  void nextPage() {
    if (currentIndex < 7) {
      currentIndex++;
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      currentIndex--;
    }
    void goToPage(int index) {
      currentIndex.value = index;
    }
  }
}
