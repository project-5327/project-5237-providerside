import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../constants/color.dart';
import '../../widgets/customize_button.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return responsive.isMobile || responsive.isTablet
        ? Column(
            children: [
              SizedBox(
                height: 35.h,
              ),
              TextWidget(
                text: AppStrings.payemntsSend,
                color: MyColors.black,
                size: 20.sp,
                fontweight: FontWeight.w700,
              ),
              SizedBox(
                height: 55.h,
              ),
              CustomizeButton(
                text: AppStrings.done,
                height: 40.h,
                width: 154.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                borderColor: MyColors.btnColor,
                radius: 100.r,
                onTap: () {},
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: AppStrings.payemntsSend,
                color: MyColors.black,
                size: 20.sp,
                fontweight: FontWeight.w700,
              ),
              Container(
                margin: EdgeInsets.only(top: 21.h, bottom: 41.h),
                width: 412.w,
                child: TextWidget(
                  text:
                      'Lorem Ipsum has been the industry\'s standard dummy text ever since the  1500s, when an unknown.',
                  color: MyColors.black,
                  size: 14.sp,
                  fontweight: FontWeight.w400,
                  align: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 55.h,
              ),
              CustomizeButton(
                text: AppStrings.done,
                height: 40.h,
                width: 154.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                borderColor: MyColors.btnColor,
                radius: 100.r,
                onTap: () {
                  _showDialogeBox(context);
                },
              ),
            ],
          );
  }

  void _showDialogeBox(context) {
    final responsive = ResponsiveCheck(context);
    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 86.h, bottom: 25.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 55.w),
      title: AppStrings.areYouSure,
      titleStyle: TextStyle(
          fontSize: 20.sp,
          color: MyColors.btnColor,
          fontWeight: FontWeight.w700),
      content: Column(
        children: [
          SizedBox(
            width: responsive.isMobile || responsive.isTablet
                ? double.infinity
                : 240.w,
            child: TextWidget(
              align: TextAlign.center,
              text:
                  'If you choose yes then the amount to \$200 first milestone will sent to freelancer account',
              color: MyColors.black1,
              size: 14.sp,
              fontweight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomizeButton(
                borderColor: MyColors.btnColor,
                radius: 100.r,
                text: AppStrings.cancel,
                height: 40.h,
                width: 130.w,
                color: MyColors.white,
                textColor: MyColors.black,
                onTap: () {
                  Get.back();
                },
              ),
              SizedBox(
                width: 10.w,
              ),
              CustomizeButton(
                borderColor: MyColors.btnColor,
                radius: 100.r,
                text: AppStrings.yesImSure,
                height: 40.h,
                width: 130.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
          SizedBox(
            height: 89.h,
          )
        ],
      ),
    );
  }
}
