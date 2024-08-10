import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../../constants/color.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import 'profile5.dart';

class Profile4 extends StatelessWidget {
  const Profile4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreateProfileWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  EditCreateProfile(
                      text: 'Add languages.',
                      text1:
                          "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit,sed do eiusmod.",
                      feildText: '+Add Language'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Languagecontiner(
                      text: 'English',
                      text1: 'My level is',
                      color: MyColors.grey),
                  SizedBox(
                    height: 16.h,
                  ),
                  Languagecontiner(
                      text: 'Spanish', text1: 'Fluent', color: MyColors.black),
                  SizedBox(
                    height: 78.h,
                  ),
                  Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: 'Next',
                      height: 40.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {
                        Get.to(() => Profile5());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Languagecontiner extends StatelessWidget {
  final String text;
  final String text1;
  final Color color;
  const Languagecontiner(
      {super.key,
      required this.text,
      required this.text1,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: text,
          size: 9.sp,
          fontweight: FontWeight.w600,
          color: Color(0xff040200),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: text1,
                  color: color,
                  size: 9.sp,
                  fontweight: FontWeight.w600,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 19.sp,
                  color: MyColors.black,
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: MyColors.grey)),
          height: 32.h,
          width: 140.w,
        ),
        SizedBox(
          width: 14.w,
        ),
        Icon(
          CupertinoIcons.trash,
          color: MyColors.grey,
          size: 14.sp,
        )
      ],
    );
  }
}
