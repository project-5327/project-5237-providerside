import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import '../../constants/color.dart';
import '../../widgets/customize_button.dart';

class AwaitingMilestones extends StatelessWidget {
  const AwaitingMilestones({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return responsive.isMobile || responsive.isTablet
        ? Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  TextWidget(
                    text: AppStrings.workSubmitted,
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
                        text: AppStrings.accept,
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
                      SizedBox(
                        width: 14.w,
                      ),
                      CustomizeButton(
                        text: AppStrings.requestChanges,
                        radius: 100.r,
                        height: 40.h,
                        width: 160.w,
                        color: MyColors.btnColor,
                        textColor: MyColors.white,
                        borderColor: MyColors.btnColor,
                        onTap: () {
                          _showDialogeBox(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              children: [
                Container(
                  height: 300.h,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 19.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 42),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: MyColors.grey3,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(65, 0, 65, 10),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                          color: MyColors.grey3,
                                          width: 1.0,
                                        ),
                                      )),
                                      child: Text(
                                        'Project 1',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w700,
                                            color: MyColors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 13.h,
                                    ),
                                    const RichTextMile(
                                        text: 'Heading1: ', text1: '\$200'),
                                    SizedBox(
                                      height: 13.h,
                                    ),
                                    const RichTextMile(
                                        text: 'Heading1: ', text1: '\$200'),
                                    SizedBox(
                                      height: 13.h,
                                    ),
                                    TextWidget(
                                      text: 'Awaiting Milestone...',
                                      color: MyColors.black,
                                      size: 14.sp,
                                      fontweight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: 13.h,
                                    ),
                                    const RichTextMile(
                                      text: 'Due date - ',
                                      text1: '23 feb 2022',
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 45.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomizeButton(
                      text: AppStrings.requestChanges,
                      radius: 100.r,
                      height: 40.h,
                      width: 160.w,
                      color: MyColors.white,
                      textColor: MyColors.btnColor,
                      borderColor: MyColors.btnColor,
                      onTap: () {
                        _showDialogeBox(context);
                      },
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    CustomizeButton(
                      text: AppStrings.accept,
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
                ),
              ],
            ),
          );
  }

//   void _dialogBox() {}
// }
  void _showDialogeBox(context) {
    final responsive = ResponsiveCheck(context);
    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 20.h, bottom: 10.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      title: AppStrings.areYouSure,
      titleStyle: TextStyle(
          fontSize: 20.sp,
          color: MyColors.btnColor,
          fontWeight: FontWeight.w700),
      content: Column(
        children: [
          Container(
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
            height: 20.h,
          ),
          Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
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
                width: 5.w,
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
            height: 20.h,
          )
        ],
      ),
    );
  }
}

class RichTextMile extends StatelessWidget {
  final String text;
  final String text1;
  const RichTextMile({super.key, required this.text, required this.text1});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
          color: MyColors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
