import 'package:get/get.dart';

class ProfileController extends GetxController {
  var currentIndex = 0.obs;
  var skills = <String>[].obs;
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

  void addSkill(String skill) {
    if (skills.length < 15 && !skills.contains(skill)) {
      skills.add(skill);
    }
  }

  void removeSkill(String skill) {
    skills.remove(skill);
  }
}
