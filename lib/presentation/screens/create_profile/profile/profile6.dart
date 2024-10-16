import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile5.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile7.dart';
import 'package:provider/provider.dart';

import '../../../../controller/profile_controller.dart';
import '../../../../provider/onboarding/onbaording_provider.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../constants/responsive_view.dart';
import '../../../constants/strings.dart';
import '../../../widgets/customize_button.dart';
import '../../my_contracts/send_screen.dart';
import 'static_profile.dart';

class Profile6 extends StatelessWidget {
  Profile6({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  final _profile5Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    return Consumer<OnbaordingProvider>(
        builder: (context, onboardingProvider, child) {
      return StaticProfileLayout(
          middleContentBuilder: () => Form(
                key: _profile5Key,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      TextWidget(
                        align: TextAlign.start,
                        text: AppStrings.addDescription,
                        color: MyColors.black,
                        size: 20.sp,
                        fontweight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      TextWidget(
                        align: TextAlign.start,
                        text: AppStrings.lorem2,
                        color: MyColors.grey,
                        size: 10.sp,
                        fontweight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextWidget(
                        align: TextAlign.start,
                        text: AppStrings.yourSkills,
                        color: MyColors.black,
                        size: 13.sp,
                        fontweight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Description can't be empty";
                          } else if (value.length < 3) {
                            return 'Description must be more than 10 characters and less than 500 characters.';
                          }
                          return null;
                        },
                        maxLines: 4,
                        controller:
                            onboardingProvider.profileDescriptionController,
                        decoration: InputDecoration(
                          errorMaxLines: 3,
                          hintText: AppStrings.desc,
                          hintStyle: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff2A1E17)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextWidget(
                          // align: TextAlign.c,
                          text: '500 characters',
                          color: const Color(0xff2A1E17),
                          size: 12.sp,
                          fontweight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 57.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomizeButton(
                              borderColor: MyColors.btnColor,
                              radius: 100.r,
                              text: AppStrings.privious,
                              height: 40.h,
                              width: 150.w,
                              color: MyColors.white,
                              textColor: MyColors.btnColor,
                              onTap: () {
                                /*print('====> decription : ${onboardingProvider.descriptionController}');*/

                                profileController.previousPage();
                                Get.to(() => const Profile5());
                              },
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            CustomizeButton(
                              borderColor: MyColors.btnColor,
                              radius: 100.r,
                              text: AppStrings.next,
                              height: 40.h,
                              width: 150.w,
                              color: MyColors.btnColor,
                              textColor: MyColors.white,
                              onTap: () {
                                debugPrint(
                                    '====> decription : ${onboardingProvider.profileDescriptionController}');
                                if (_profile5Key.currentState!.validate()) {
                                  profileController.nextPage();
                                  Get.to(() => Profile7());
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 150.h,
                      ),
                    ],
                  ),
                ),
              ));
    });
  }

  _deskTopView(BuildContext context) {
    return Consumer<OnbaordingProvider>(
        builder: (context, onboardingProvider, child) {
      return Scaffold(
          body: Row(children: [
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
                child: SizedBox(
                    //  height: 450.h,
                    width: 336.w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 200.h),
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
                            value:
                                (profileController.currentIndex.value + 1) / 8,
                            color: MyColors.btnColor,
                            borderRadius: BorderRadius.circular(4.r),
                            minHeight: 5.h,
                          ),
                          SizedBox(height: 30.h),
                          TextWidget(
                            align: TextAlign.start,
                            text: AppStrings.addDescription,
                            color: MyColors.black,
                            size: 20.sp,
                            fontweight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 27.h,
                          ),
                          TextWidget(
                            align: TextAlign.start,
                            text: AppStrings.lorem2,
                            color: MyColors.grey,
                            size: 13.sp,
                            fontweight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextWidget(
                            align: TextAlign.start,
                            text: AppStrings.yourSkills,
                            color: MyColors.black,
                            size: 13.sp,
                            fontweight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextFormField(
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: AppStrings.desc,
                              hintStyle: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff2A1E17)),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 7),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextWidget(
                              // align: TextAlign.c,
                              text: '500 characters',
                              color: const Color(0xff2A1E17),
                              size: 13.sp,
                              fontweight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 100.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomizeButton(
                                borderColor: MyColors.btnColor,
                                radius: 100.r,
                                text: AppStrings.privious,
                                height: 40.h,
                                width: 150.w,
                                color: MyColors.white,
                                textColor: MyColors.btnColor,
                                onTap: () {
                                  // if (formKey.currentState!.validate()) {
                                  profileController.previousPage();
                                  Get.to(() => const Profile5());
                                  // }
                                },
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              CustomizeButton(
                                borderColor: MyColors.btnColor,
                                radius: 100.r,
                                text: AppStrings.next,
                                height: 40.h,
                                width: 150.w,
                                color: MyColors.btnColor,
                                textColor: MyColors.white,
                                onTap: () {
                                  //    if (formKey.currentState!.validate()) {
                                  profileController.nextPage();
                                  Get.to(() => Profile7());
                                  //  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 42.h,
                          ),
                        ]))))
      ]));
    });
  }
}
