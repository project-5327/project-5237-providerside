import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile2.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile4.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:provider/provider.dart';

import '../../../../provider/onboarding/onbaording_provider.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../widgets/customize_button.dart';

class AddEducation extends StatelessWidget {
  const AddEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnbaordingProvider>(builder: (context, onboardingProvider, child) {
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
                           CustomTextFormField(
                            text: AppStrings.enterHere,
                            title: AppStrings.degree,
                             validator: (value) =>
                                 onboardingProvider.validateDegreeOrCertifcate(value ?? ''),
                             controller: onboardingProvider.degreeORCertificateController,
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                           CustomTextFormField(
                            text: AppStrings.enterHere,
                            title: AppStrings.institutionName,
                             validator: (value) =>
                                 onboardingProvider.validateInstituteName(value ?? ''),
                             controller: onboardingProvider.instituteNameController,
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Flexible(
                                child: CustomTextFormField(
                                  text: AppStrings.enterHere,
                                  title: AppStrings.fieldOfStudy,
                                  validator: (value) =>
                                      onboardingProvider.validateFeildOfStudy(value ?? ''),
                                  controller: onboardingProvider.feildOfStudyController,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                               Flexible(
                                child: CustomTextFormField(
                                  text: AppStrings.enterHere,
                                  title: AppStrings.location,
                                  validator: (value) =>
                                      onboardingProvider.validateLocatioon1(value ?? ''),
                                  controller: onboardingProvider.location1Controller,
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
                               Flexible(
                                child: CustomTextFormField(
                                  text: AppStrings.date,
                                  title: AppStrings.startDate,
                                  validator: (value) =>
                                      onboardingProvider.validateDate(value ?? ''),
                                  controller: onboardingProvider.startDate1Controller,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                               Flexible(
                                child: CustomTextFormField(
                                  text: AppStrings.date,
                                  title: AppStrings.endDate,
                                  validator: (value) =>
                                      onboardingProvider.validateDate(value ?? ''),
                                  controller: onboardingProvider.endDate1Controller,
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
    );
  }
}
