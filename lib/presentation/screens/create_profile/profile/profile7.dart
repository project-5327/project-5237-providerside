import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile6.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile8.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:provider/provider.dart';

import '../../../../controller/profile_controller.dart';
import '../../../../provider/onboarding/onbaording_provider.dart';
import '../../../constants/responsive_view.dart';
import '../../../constants/strings.dart';
import '../../../widgets/customize_button.dart';
import 'components/personal-project.dart';
import 'static_profile.dart';

class Profile7 extends StatelessWidget {
  Profile7({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  final FormController formController = Get.put(FormController());
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

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
        middleContentBuilder: () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      TextWidget(
                        align: TextAlign.start,
                        text: AppStrings.addHourlyRate,
                        color: MyColors.black,
                        size: 20.sp,
                        fontweight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextWidget(
                        align: TextAlign.start,
                        text: AppStrings.lorem2,
                        color: MyColors.black,
                        size: 10.sp,
                        fontweight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextWidget(
                        fontFamily: 'Lexend',
                        align: TextAlign.start,
                        text: AppStrings.hourlyRate,
                        color: MyColors.black,
                        size: 12.sp,
                        fontweight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              controller:
                                  onboardingProvider.hourlyRateController,
                              //onChanged: onChanged,
                              //obscureText: obscureText,
                              validator: (value) => onboardingProvider
                                  .validateHourlyRate(value ?? ''),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  child: Text(
                                    textAlign: TextAlign.left,
                                    '\$',
                                    style: TextStyle(
                                      color: MyColors.black1,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                hintText: '50.00',
                                hintStyle: TextStyle(
                                  color: MyColors.black1,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          TextWidget(
                            text: '/hr',
                            color: MyColors.black.withOpacity(0.3),
                            size: 16.sp,
                            fontweight: FontWeight.w600,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 129.h,
                      ),
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
                              print(
                                  '====> decription : ${onboardingProvider.hourlyRateController}');
                              if (formKey.currentState!.validate()) {
                                profileController.previousPage();
                                Get.to(() => Profile6());
                              }
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
                                  '====> decription : ${onboardingProvider.hourlyRateController}');

                              if (formKey.currentState!.validate()) {
                                profileController.nextPage();
                                Get.to(() => const AddYourPersonalProject());
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 42.h,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      );
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
                            text: AppStrings.addHourlyRate,
                            color: MyColors.black,
                            size: 20.sp,
                            fontweight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextWidget(
                            align: TextAlign.start,
                            text: AppStrings.lorem2,
                            color: MyColors.black,
                            size: 13.sp,
                            fontweight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          TextWidget(
                            fontFamily: 'Lexend',
                            align: TextAlign.start,
                            text: AppStrings.hourlyRate,
                            color: MyColors.black,
                            size: 14.sp,
                            fontweight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.right,
                                  controller:
                                      onboardingProvider.hourlyRateController,
                                  validator: (value) => onboardingProvider
                                      .validateHourlyRate(value ?? ''),
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      child: Text(
                                        textAlign: TextAlign.left,
                                        '\$',
                                        style: TextStyle(
                                          color: MyColors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    hintText: '50.00',
                                    hintStyle: TextStyle(
                                      color: MyColors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 16),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextWidget(
                                text: '/hr',
                                color: MyColors.black.withOpacity(0.3),
                                size: 16.sp,
                                fontweight: FontWeight.w600,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 129.h,
                          ),
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
                                  // if (formKey.currentState != null &&
                                  //     formKey.currentState!.validate()) {
                                  profileController.previousPage();
                                  Get.to(() => Profile6());
                                  //     }
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
                                    // if (formKey.currentState != null &&
                                    //     formKey.currentState!.validate()) {
                                    profileController.nextPage();
                                    Get.to(() => const Profile8());
                                  }
                                  //  },
                                  ),
                            ],
                          ),
                        ]))))
      ]));
    });
  }
}
