import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';

import '../../../../controller/country_controller.dart';
import '../../../../controller/form_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../constants/color.dart';
import '../../../constants/strings.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import 'profile3.dart';
import 'profile5.dart';
import 'static_profile.dart';

class Profile4 extends StatefulWidget {
  Profile4({super.key});

  @override
  State<Profile4> createState() => _Profile4State();
}

class _Profile4State extends State<Profile4> {
  final ProfileController profileController = Get.put(ProfileController());

  final formKey = GlobalKey<FormState>();

  final FormController formController = Get.put(FormController());

  final DropdownController dropdownController = Get.put(DropdownController());

  final TextEditingController controller = TextEditingController();

  final TextEditingController _languageController = TextEditingController();
  final List<String> _languages = ['English', 'Hindi', 'Spanish', 'Punjabi'];
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  TextWidget(
                    align: TextAlign.start,
                    text: AppStrings.addLanguages,
                    color: MyColors.black,
                    size: 20.sp,
                    fontweight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    text: AppStrings.createProfileLorem1,
                    color: MyColors.grey,
                    size: 10.sp,
                    fontweight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: MyColors.black)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 13.0),
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(6.0),
                        isDense: true,
                        value: _selectedLanguage,
                        hint: const Text(AppStrings.chooseyourLanguages),
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: MyColors.grey,
                          size: 30.sp,
                        ),
                        items: _languages.map((String language) {
                          return DropdownMenuItem<String>(
                            value: language,
                            child: Text(language),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedLanguage = newValue;
                            _languageController.text = newValue ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // TextField(
                  //   controller: _languageController,
                  //   readOnly: true,
                  //   decoration: InputDecoration(
                  //     suffixIcon: Icon(
                  //       Icons.arrow_drop_down,
                  //       color: MyColors.grey,
                  //       size: 30.sp,
                  //     ),
                  //     hintText: AppStrings.chooseyourLanguages,
                  //     hintStyle: TextStyle(
                  //       fontSize: 10.sp,
                  //       color: MyColors.grey,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //     contentPadding: const EdgeInsets.symmetric(
                  //         vertical: 10, horizontal: 16),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8.r),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 78.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomizeButton(
                        borderColor: MyColors.btnColor,
                        radius: 100.r,
                        text: AppStrings.privious,
                        height: 40.h,
                        width: 150.w,
                        color: MyColors.white,
                        textColor: MyColors.btnColor,
                        onTap: () {
                          // if (formKey.currentState!.validate()) {
                          profileController.nextPage();
                          Get.to(() => Profile3());
                          // }
                        },
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomizeButton(
                          borderColor: MyColors.btnColor,
                          radius: 100.r,
                          text: AppStrings.next,
                          height: 40.h,
                          width: 150.w,
                          color: MyColors.btnColor,
                          textColor: MyColors.white,
                          onTap: () {
                            // if (formKey.currentState!.validate()) {
                            profileController.nextPage();
                            Get.to(() => Profile5());
                          }
                          //  },
                          ),
                    ],
                  ),
                  SizedBox(height: 42.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.r),
          height: 300.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _languages.map((language) {
              return ListTile(
                title: Text(language),
                onTap: () {
                  setState(() {
                    _languageController.text = language;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
