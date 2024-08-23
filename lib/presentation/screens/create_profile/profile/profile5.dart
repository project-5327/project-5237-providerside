import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile4.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../../../controller/profile_controller.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../constants/strings.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import 'profile6.dart';
import 'static_profile.dart';

class Profile5 extends StatefulWidget {
  Profile5({super.key});

  @override
  State<Profile5> createState() => _Profile5State();
}

class _Profile5State extends State<Profile5> {
  final ProfileController profileController = Get.put(ProfileController());
  final List<String> _skills = [];

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => SingleChildScrollView(
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
                    size: 12.sp,
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
                          right: 150, left: 20, top: 5, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (_skills.isNotEmpty)
                            Wrap(
                              spacing: 4.0,
                              runSpacing: 4.0,
                              children: _skills.map((skill) {
                                return Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    color: MyColors.blueContainer,
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextWidget(
                                        text: skill,
                                        color: MyColors.black1,
                                        size: 10.sp,
                                        fontweight: FontWeight.w500,
                                      ),
                                      SizedBox(width: 5.w),
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
                                  fontSize: 10.sp,
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
                      color: Color(0xff2A1E17),
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
                          Get.to(() => Profile4());
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
                            Get.to(() => Profile6());
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
}
