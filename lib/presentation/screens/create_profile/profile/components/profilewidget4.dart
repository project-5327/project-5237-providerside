import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';

import '../../../../../controller/country_controller.dart';
import '../../../../../controller/profile_controller.dart';
import '../../../../constants/color.dart';
import '../../../../constants/strings.dart';
import '../../../../widgets/customize_button.dart';
import '../profile3.dart';
import '../profile5.dart';

class Profilewidget4 extends StatefulWidget {
  const Profilewidget4({super.key});

  @override
  State<Profilewidget4> createState() => _Profilewidget4State();
}

class _Profilewidget4State extends State<Profilewidget4> {
  final ProfileController profileController = Get.put(ProfileController());

  final formKey = GlobalKey<FormState>();

  final FormController formController = Get.put(FormController());

  final DropdownController dropdownController = Get.put(DropdownController());

  final TextEditingController controller = TextEditingController();

  final TextEditingController _languageController = TextEditingController();
  final List<String> _languages = ['English', 'Hindi', 'Spanish', 'German'];
  List<String> _selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
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
                height: 55.h,
                width: 307.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: MyColors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_selectedLanguages.isNotEmpty)
                        Wrap(
                          spacing: 4.0,
                          runSpacing: 4.0,
                          children: _selectedLanguages.map((language) {
                            return Container(
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: MyColors.blueContainer,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    language,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      color: MyColors.black1,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedLanguages.remove(language);
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.clear_circled,
                                      size: 13.sp,
                                      color: MyColors.closeBtn,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(6.0),
                            isDense: true,
                            value: null,
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
                              if (newValue != null &&
                                  !_selectedLanguages.contains(newValue)) {
                                setState(() {
                                  _selectedLanguages.add(newValue);
                                });
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 160.h),
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
                      profileController.previousPage();
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
    );
  }
}
