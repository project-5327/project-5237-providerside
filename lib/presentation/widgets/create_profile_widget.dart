import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/profile_controller.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';

import '../constants/color.dart';
import '../screens/my_contracts/send_screen.dart';

class CreateProfileWidget extends StatelessWidget {
  const CreateProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160.h,
      decoration: BoxDecoration(color: MyColors.blue),
      child: Padding(
        padding: const EdgeInsets.symmetric(
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
  final String? labelText;
  final TextAlign? align;

  final Color? color;
  final controller;
  final validator;
  final VoidCallback ontap;
  EditCreateProfile(
      {super.key,
      required this.text,
      required this.text1,
      required this.feildText,
        this.labelText,
      this.controller,
      this.validator,
      required this.ontap,
      this.color,
      this.align});
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
          fontFamily: 'Montserrat',
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
          fontFamily: 'Montserrat',
          color: MyColors.black,
          size: 10.sp,
          fontweight: FontWeight.w500,
        ),
        SizedBox(
          height: 25.h,
        ),
        TextFormField(
          showCursor: false,
          onTap: ontap,
          textAlign: align ?? TextAlign.center,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: feildText,
            hintStyle: TextStyle(
                fontSize: 11.sp,
                color: color ?? MyColors.blue,
                fontWeight: FontWeight.w500),
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

class DesktopEditCreate extends StatelessWidget {
  final String text;
  final String text1;
  final String feildText;
  final TextAlign? align;
  final String? title;
  final Color? color;
  final controller;
  final validator;
  final VoidCallback ontap;
  DesktopEditCreate(
      {super.key,
      required this.text,
      required this.text1,
      required this.feildText,
      this.controller,
      this.validator,
      required this.ontap,
      this.color,
      this.align,
      this.title});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 25.h,
        ),
        TextWidget(
          fontFamily: 'Montserrat',
          align: TextAlign.start,
          text: text,
          color: MyColors.black,
          size: 22.sp,
          fontweight: FontWeight.w600,
        ),
        SizedBox(
          height: 15.h,
        ),
        TextWidget(
          fontFamily: 'Montserrat',
          align: TextAlign.start,
          text: text1,
          color: MyColors.black.withOpacity(0.3),
          size: 14.sp,
          fontweight: FontWeight.w500,
        ),
        SizedBox(
          height: 25.h,
        ),
        TextWidget(
          fontFamily: 'Montserrat',
          align: TextAlign.start,
          text: title ?? '',
          color: MyColors.black,
          size: 13.sp,
          fontweight: FontWeight.w500,
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          onTap: ontap,
          textAlign: align ?? TextAlign.center,
          readOnly: true,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: feildText,
            hintStyle: TextStyle(
                fontSize: 13.sp,
                color: color ?? MyColors.blue,
                fontWeight: FontWeight.w500),
            // contentPadding:
            //     const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        )
      ],
    );
  }
}
