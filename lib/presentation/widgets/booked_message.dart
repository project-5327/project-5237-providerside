import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';
import 'customize_button.dart';

class BookedMessage extends StatelessWidget {
  final String text;
  final String text1;
  final String btntext;
  final VoidCallback onTap;
  const BookedMessage(
      {super.key,
      required this.text,
      required this.text1,
      required this.btntext,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: 326.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
                color: MyColors.black1),
          ),
          SizedBox(
            height: 23.h,
          ),
          Text(
            text1,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black),
          ),
          SizedBox(
            height: 23.h,
          ),
          CustomizeButton(
            borderColor: MyColors.btnColor,
            radius: 100.r,
            text: btntext,
            height: 40.h,
            width: 152.w,
            color: MyColors.btnColor,
            textColor: MyColors.white,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
