import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile4.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:provider/provider.dart';

import '../../../../controller/profile_controller.dart';
import '../../../../provider/onboarding/onbaording_provider.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../constants/responsive_view.dart';
import '../../../constants/strings.dart';
import '../../../widgets/customize_button.dart';
import 'profile6.dart';
import 'static_profile.dart';

class Profile5 extends StatefulWidget {
  const Profile5({super.key});

  @override
  State<Profile5> createState() => _Profile5State();
}

class _Profile5State extends State<Profile5> {
  final ProfileController profileController = Get.put(ProfileController());
  final List<String> _skills = ['JavaScript', 'Node.js', 'MongoDB', 'React'];
  final List<String> _selectedSkills = [];

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    return Consumer<OnbaordingProvider>(
        builder: (context, onboardingProvider, child) {
      return StaticProfileLayout(
        middleContentBuilder: () => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.h),
                    TextWidget(
                      align: TextAlign.start,
                      text: AppStrings.addYourSkills,
                      color: MyColors.black,
                      size: 20.sp,
                      fontweight: FontWeight.w600,
                    ),
                    SizedBox(height: 15.h),
                    TextWidget(
                      align: TextAlign.start,
                      text: AppStrings.createProfileLorem,
                      color: MyColors.black,
                      size: 10.sp,
                      fontweight: FontWeight.w500,
                    ),
                    SizedBox(height: 25.h),
                    TextWidget(
                      align: TextAlign.start,
                      text: AppStrings.yourSkills,
                      color: MyColors.black,
                      size: 13.sp,
                      fontweight: FontWeight.w600,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      height: 100,
                      child: DropDownMultiSelect(
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          focusColor: Theme.of(context).colorScheme.onPrimary,
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: MyColors.blue,
                                width: 1.5,
                              )),
                        ),
                        options: _skills,
                        selectedValues: _selectedSkills,
                        onChanged: (List<String> value) {
                          //   value = selectedCheckBoxValue;
                          /* print("====> _selected languagelist ${_selectedLanguages.length}");*/
                        },
                        whenEmpty: 'Select skills',
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextWidget(
                        text: 'Max 15 skills',
                        color: const Color(0xff2A1E17),
                        size: 12.sp,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 150.h),
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
                            Get.to(() => const Profile4());
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
                              if (_selectedSkills.isEmpty ||
                                  _selectedSkills == []) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please select at least one skill".',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                debugPrint(
                                    "====> _selected skills ${_selectedSkills.length}");
                                onboardingProvider.setSkill = _selectedSkills;
                                // if (formKey.currentState!.validate()) {
                                profileController.nextPage();
                                Get.to(() => Profile6());
                              }
                              //  },
                            }),
                      ],
                    ),
                    SizedBox(height: 70.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _deskTopView(BuildContext context) {
    return Consumer<OnbaordingProvider>(
        builder: (context, onboardingProvider, child) {
      return Scaffold(
          body: Row(children: [
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
          child: SizedBox(
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
                  size: 13.sp,
                  fontweight: FontWeight.w500,
                ),
                SizedBox(
                  height: 25.h,
                ),
                TextWidget(
                  align: TextAlign.start,
                  text: AppStrings.yourSkills,
                  color: MyColors.black,
                  size: 14.sp,
                  fontweight: FontWeight.w500,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 307.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: MyColors.black.withOpacity(0.3),
                      width: 1.w,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 150.0,
                      left: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_skills.isNotEmpty)
                          Wrap(
                            spacing: 4.0,
                            runSpacing: 4.0,
                            children: _skills.map((skill) {
                              return Container(
                                height: 55.h,
                                decoration: BoxDecoration(
                                  color: MyColors.blueContainer,
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextWidget(
                                      text: skill,
                                      color: MyColors.black1,
                                      size: 12.sp,
                                      fontweight: FontWeight.w500,
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _skills.remove(skill);
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
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Add a skill',
                              hintStyle: TextStyle(
                                color: MyColors.black1,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                            onSubmitted: (String newSkill) {
                              if (newSkill.isNotEmpty &&
                                  !_skills.contains(newSkill)) {
                                setState(() {
                                  _skills.add(newSkill);
                                });
                              }
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.topRight,
                  child: TextWidget(
                    text: 'Max 15 skills',
                    color: const Color(0xff2A1E17),
                    size: 12.sp,
                    fontweight: FontWeight.w500,
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
                      height: 40.h,
                      width: 150.w,
                      color: MyColors.white,
                      textColor: MyColors.btnColor,
                      onTap: () {
                        // if (formKey.currentState!.validate()) {
                        profileController.previousPage();
                        Get.to(() => const Profile4());
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
                        width: 150.w,
                        color: MyColors.btnColor,
                        textColor: MyColors.white,
                        onTap: () {
                          // if (formKey.currentState!.validate()) {
                          print(
                              "====> _selected skills ${_selectedSkills.length}");
                          onboardingProvider.setSkill = _selectedSkills;
                          profileController.nextPage();
                          Get.to(() => Profile6());
                        }
                        //  },
                        ),
                  ],
                ),
              ],
            ),
          ),
        ))
      ]));
    });
  }
}
