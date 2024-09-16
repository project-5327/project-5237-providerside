import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

class CustomDailogs {
  void handlePopUpItem(String value, context) {
    switch (value) {
      case 'block':
        showDialogBox(
            context, 'Do you want to Block ', 'Joseph Aina ?', 'Yes', 'No');
        break;
      case 'report':
        showDialogBox(context, 'Do you want to Report ', 'Joseph Aina ?',
            'Report', 'Cancel');
        break;
      case 'remove':
        showDialogBox(context, 'Do you want to Remove ', 'Joseph Aina ?',
            'Remove', 'Cancel');
        break;
    }
  }

  void showDialogBox(
    BuildContext context,
    String text,
    String text1,
    String btntext1,
    String btntext2,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final responsive = ResponsiveCheck(context);
          return AlertDialog(
              title: Center(
                child: TextWidget(
                  text: 'Are you Sure?',
                  color: MyColors.btnColor,
                  size: responsive.isMobile ? 20.sp : 20,
                  fontweight: FontWeight.w700,
                ),
              ),
              content: RichText(
                text: TextSpan(
                  text: text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: responsive.isMobile ? 15.sp : 15,
                    color: MyColors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      //recognizer: TapGestureRecognizer()

                      text: text1,
                      style: TextStyle(
                        fontSize: responsive.isMobile ? 15.sp : 15,
                        fontWeight: FontWeight.w700,
                        color: MyColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // TextWidget(
              //   text: text,
              //   color: MyColors.black,
              //   size: 12,
              //   fontweight: FontWeight.w500,
              // ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: MyColors.btnColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: MyColors.btnColor),
                          )),
                      onPressed: () {
                        Get.back();
                      },
                      child: TextWidget(
                        text: btntext1,
                        color: MyColors.white,
                        size: responsive.isMobile ? 12.sp : 12,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: responsive.isMobile ? 10.sp : 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: MyColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: MyColors.btnColor),
                            borderRadius: BorderRadius.circular(100),
                          )),
                      onPressed: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextWidget(
                          text: btntext2,
                          color: MyColors.black,
                          size: responsive.isMobile ? 12.sp : 12,
                          fontweight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ]);
        });
  }
}
