import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/profile_controller.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/static_profile.dart';

import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../constants/strings.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import 'profile2.dart';

class ProfileDetail extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final FormController formController = Get.put(FormController());
  final TextEditingController skillsController = TextEditingController();
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopview(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            EditCreateProfile(
              align: TextAlign.start,
              ontap: () {},
              validator: (value) => formController.validateSkills(value),
              controller: skillsController,
              text: AppStrings.createProfileText1,
              text1: AppStrings.createProfileLorem,
              feildText: AppStrings.titletext,
              color: MyColors.lightGrey,
            ),
            SizedBox(height: 158.h),
            Center(
                child: CustomizeButton(
                    borderColor: MyColors.btnColor,
                    radius: 100.r,
                    text: AppStrings.next,
                    height: 40.h,
                    width: 334.w,
                    color: MyColors.btnColor,
                    textColor: MyColors.white,
                    onTap: () {
                      //if (formKey.currentState!.validate()) {
                      profileController.nextPage();
                      Get.to(() => Profile2());
                      //   }
                    })),
            SizedBox(height: 42.h),
          ],
        ),
      ),
    );
  }

  _deskTopview(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            child: Container(
              child: SvgPicture.asset(
                Assets.createProfile1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            child: Center(
              child: Container(
                  //  height: 450.h,
                  width: 336.w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 100.h),
                        Row(
                          children: [
                            Text(
                              AppStrings.createProfile,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: MyColors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 100.w),
                            Obx(() => Text(
                                  '${profileController.currentIndex.value + 1}/8',
                                  style: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        LinearProgressIndicator(
                          value: (profileController.currentIndex.value + 1) / 8,
                          color: MyColors.btnColor,
                          borderRadius: BorderRadius.circular(4.r),
                          minHeight: 5.h,
                        ),
                        SizedBox(height: 30.h),
                        Center(
                          child: DesktopEditCreate(
                            align: TextAlign.start,
                            ontap: () {},
                            validator: (value) =>
                                formController.validateSkills(value),
                            controller: skillsController,
                            text: AppStrings.createProfileText1,
                            text1: AppStrings.lorem2,
                            title: AppStrings.title,
                            feildText: AppStrings.titletext,
                            color: MyColors.lightGrey,
                          ),
                        ),
                        SizedBox(height: 60.h),
                        Center(
                            child: CustomizeButton(
                                borderColor: MyColors.btnColor,
                                radius: 100.r,
                                text: AppStrings.next,
                                height: 45.h,
                                width: 334.w,
                                color: MyColors.btnColor,
                                textColor: MyColors.white,
                                onTap: () {
                                  //if (formKey.currentState!.validate()) {
                                  profileController.nextPage();
                                  Get.to(() => Profile2());
                                  //   }
                                })),
                        SizedBox(height: 20.h),
                      ])),
            ),
          )
        ],
      ),
    );
  }
}
