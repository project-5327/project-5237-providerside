import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../constants/color.dart';
import '../../widgets/customize_button.dart';
import '../my_contracts/map_screen.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
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
                onTap: () {
                  Get.to(() => MapScreen());
                },
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
                  Get.to(() => MapScreen());
                },
              ),
            ],
          );
  }
}
