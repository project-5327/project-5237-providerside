import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../constants/color.dart';
import '../../widgets/customize_button.dart';
import '../login_register/proposal.dart';

class AwaitingMilestones extends StatelessWidget {
  const AwaitingMilestones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            TextWidget(
              text: 'Work submitted',
              color: MyColors.black,
              size: 20.sp,
              fontweight: FontWeight.w700,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextWidget(
              text:
                  "Lorem Ipsum has been the industry's standard dummy text ever since the  1500s",
              color: MyColors.black,
              size: 11.sp,
              fontweight: FontWeight.w600,
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomizeButton(
                  text: 'Accept',
                  height: 40.h,
                  width: 154.w,
                  color: MyColors.btnColor,
                  textColor: MyColors.white,
                  borderColor: MyColors.btnColor,
                  radius: 100.r,
                  onTap: () {
                    _showDialogeBox();
                  },
                ),
                SizedBox(
                  width: 14.w,
                ),
                CustomizeButton(
                  text: 'Request Changes',
                  radius: 100.r,
                  height: 40.h,
                  width: 160.w,
                  color: MyColors.btnColor,
                  textColor: MyColors.white,
                  borderColor: MyColors.btnColor,
                  onTap: () {
                    _showDialogeBox();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//   void _dialogBox() {}
// }
  void _showDialogeBox() {
    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 20),
      title: 'Are you Sure?',
      titleStyle: TextStyle(
          fontSize: 20.sp,
          color: MyColors.btnColor,
          fontWeight: FontWeight.w700),
      content: Column(
        children: [
          TextWidget(
            text:
                'If you choose yes then the amount to \$200 first milestone will sent to freelancer account',
            color: MyColors.black1,
            size: 14.sp,
            fontweight: FontWeight.w400,
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              CustomizeButton(
                borderColor: MyColors.btnColor,
                radius: 100.r,
                text: "Yes I'm sure",
                height: 40.h,
                width: 151.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                onTap: () {
                  Get.back();
                },
              ),
              CustomizeButton(
                borderColor: MyColors.btnColor,
                radius: 100.r,
                text: "Cancel",
                height: 40.h,
                width: 151.w,
                color: MyColors.white,
                textColor: MyColors.black,
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
