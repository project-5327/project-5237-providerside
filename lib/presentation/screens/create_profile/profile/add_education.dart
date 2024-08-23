import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile2.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile4.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';

import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../widgets/customize_button.dart';

class AddEducation extends StatelessWidget {
  const AddEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColors.black,
          ),
        ),
        title: Text(
          AppStrings.addEducation1,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 37.h,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  height: 440.h,
                  width: 335.w,
                  decoration: BoxDecoration(
                      color: MyColors.blueContainer,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: AppStrings.education1,
                            color: MyColors.black,
                            fontweight: FontWeight.w500,
                            size: 14.sp,
                          ),
                          SvgPicture.asset(Assets.closeIC)
                        ],
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      const CustomTextFormField(
                        text: AppStrings.enterHere,
                        title: AppStrings.degree,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      const CustomTextFormField(
                        text: AppStrings.enterHere,
                        title: AppStrings.institutionName,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: CustomTextFormField(
                              text: AppStrings.enterHere,
                              title: AppStrings.fieldOfStudy,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Flexible(
                            child: CustomTextFormField(
                              text: AppStrings.enterHere,
                              title: AppStrings.location,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: CustomTextFormField(
                              text: AppStrings.date,
                              title: AppStrings.startDate,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Flexible(
                            child: CustomTextFormField(
                              text: AppStrings.date,
                              title: AppStrings.endDate,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: MyColors.blue,
                    size: 20.sp,
                  ),
                  TextWidget(
                    align: TextAlign.right,
                    text: AppStrings.addMore,
                    color: MyColors.blue,
                    fontweight: FontWeight.w500,
                    size: 14.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 150.h,
              ),
              Center(
                  child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: AppStrings.save,
                      height: 40.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {
                        Get.back(result: true);
                      })),
              SizedBox(height: 42.h),
            ],
          ),
        ),
      ),
    ));
  }
}
