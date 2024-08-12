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
  final controller;
  final validator;
  final VoidCallback ontap;
  EditCreateProfile(
      {super.key,
      required this.text,
      required this.text1,
      required this.feildText,
      this.controller,
      this.validator,
      required this.ontap});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
          onTap: ontap,
          textAlign: TextAlign.center,
          readOnly: true,
          validator: validator,
          controller: controller,
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
        )
      ],
    );
  }
}
