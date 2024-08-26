import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/container_controller.dart';
import '../../controller/country_controller.dart';
import '../../controller/form_controller.dart';
import '../../presentation/constants/assets.dart';
import '../../presentation/constants/color.dart';
import '../../presentation/constants/strings.dart';
import '../../presentation/screens/create_profile/create_your_profile.dart';
import '../../presentation/screens/my_contracts/send_screen.dart';
import '../../presentation/widgets/Customize_textfield.dart';
import '../../presentation/widgets/customize_button.dart';
import 'appname.dart';
import 'create_profile.dart';

class OnBoardingScreen3 extends StatefulWidget {
  const OnBoardingScreen3({super.key});

  @override
  State<OnBoardingScreen3> createState() => _OnBoardingScreen3State();
}

class _OnBoardingScreen3State extends State<OnBoardingScreen3> {
  final formKey = GlobalKey<FormState>();
  final FormController formcontroller = Get.put(FormController());
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  //final TextEditingController countryController = TextEditingController();
  final ContainerController containerController =
      Get.put(ContainerController());
  final DropdownController dropdownController = Get.put(DropdownController());
  final List<String> countries = ['USA', 'India', 'Canada', 'Japan'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AppNameScreen(),
          Flexible(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    decoration: BoxDecoration(
                      color: MyColors.blueContainer,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    width: 400.0, // Width of the form container
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(CreateYourProfileScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.blue,
                              padding: EdgeInsets.all(10),
                              textStyle: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Small circle at the corners
                              ),
                            ),
                            child: const Text(
                              AppStrings.register,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
