import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/profile_controller.dart';

import '../constants/assets.dart';
import '../constants/color.dart';
import '../screens/my_contracts/send_screen.dart';

class CreateProfileWidget extends StatelessWidget {
  CreateProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160.h,
      decoration: BoxDecoration(color: MyColors.blue),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Register',
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.white),
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              'Create your account',
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.white),
            ),
            SizedBox(
              height: 39.h,
            ),
          ],
        ),
      ),
    );
  }
}

class EditCreateProfile extends StatelessWidget {
  final String text;
  final String text1;
  final String feildText;
  EditCreateProfile(
      {super.key,
      required this.text,
      required this.text1,
      required this.feildText});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: MyColors.blue1, shape: BoxShape.circle),
                  child: TextWidget(
                    text: 'M',
                    color: MyColors.white,
                    size: 20.sp,
                    fontweight: FontWeight.w700,
                  ),
                  height: 42.h,
                  width: 42.w,
                ),
                SizedBox(
                  width: 44.w,
                ),
                TextWidget(
                    text: 'Create Profile',
                    color: MyColors.black,
                    size: 24.sp,
                    fontweight: FontWeight.w500),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Assets.arrowLeft,
                  height: 22.h,
                  width: 11.w,
                  fit: BoxFit.cover,
                ),
                TextWidget(
                    text: '${profileController.currentIndex.value + 1}/8',
                    color: MyColors.black,
                    size: 14.sp,
                    fontweight: FontWeight.w400),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            LinearProgressIndicator(
              value: (profileController.currentIndex.value + 1) / 8,
              color: MyColors.btnColor,
              borderRadius: BorderRadius.circular(4.r),
              minHeight: 5.h,
            ),
            SizedBox(
              height: 25.h,
            ),
            TextWidget(
              align: TextAlign.start,
              text: text,
              color: MyColors.black,
              size: 20.sp,
              fontweight: FontWeight.w600,
            ),
            SizedBox(
              height: 15.h,
            ),
            TextWidget(
              align: TextAlign.start,
              text: text1,
              color: MyColors.black,
              size: 10.sp,
              fontweight: FontWeight.w500,
            ),
            SizedBox(
              height: 25.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: feildText,
                hintStyle: TextStyle(
                    fontSize: 10.sp,
                    color: MyColors.blue,
                    fontWeight: FontWeight.w600),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ]),
    );
  }
}
