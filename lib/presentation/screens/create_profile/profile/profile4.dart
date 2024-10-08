import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controller/country_controller.dart';
import '../../../../controller/form_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../constants/responsive_view.dart';

import '../../../constants/strings.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import '../../my_contracts/send_screen.dart';
import 'components/profilewidget4.dart';

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
  final List<String> _languages = ['English', 'Hindi', 'Spanish', 'German'];
  List<String> _selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => Form(key: formKey, child: Profilewidget4()),
    );
  }

  _deskTopView(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            child: Container(
              child: SvgPicture.asset(
                Assets.createProfile1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
              child: Center(
            child: Container(
              //  height: 450.h,
              width: 336.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 200.h),
                  Row(
                    children: [
                      Text(
                        AppStrings.createProfile,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: MyColors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 100.w),
                      Obx(() => Text(
                            '${profileController.currentIndex.value + 1}/8',
                            style: TextStyle(
                              color: MyColors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  LinearProgressIndicator(
                    value: (profileController.currentIndex.value + 1) / 8,
                    color: MyColors.btnColor,
                    borderRadius: BorderRadius.circular(4.r),
                    minHeight: 5.h,
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(height: 25.h),
                  TextWidget(
                    align: TextAlign.start,
                    text: AppStrings.addLanguages,
                    color: MyColors.black,
                    size: 22.sp,
                    fontweight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    text: AppStrings.createProfileLorem1,
                    color: MyColors.grey,
                    size: 13.sp,
                    fontweight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
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
                                  height: 38.h,
                                  decoration: BoxDecoration(
                                    color: MyColors.blueContainer,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
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
                            DropdownButton<String>(
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomizeButton(
                        borderColor: MyColors.btnColor,
                        radius: 100.r,
                        text: AppStrings.privious,
                        height: 45.h,
                        width: 160.w,
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
                          height: 45.h,
                          width: 160.w,
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
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
