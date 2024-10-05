import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:provider/provider.dart';

import '../../../../provider/onboarding/onbaording_provider.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../widgets/customize_button.dart';

class AddExperience extends StatelessWidget {
  const AddExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OnbaordingProvider>(
        builder: (context, onboardingProvider, child) {
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
            AppStrings.addExperience1,
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
                    padding: const EdgeInsets.all(14.0),
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
                              text: AppStrings.experience1,
                              color: MyColors.black,
                              fontweight: FontWeight.w500,
                              size: 14.sp,
                            ),
                            IconButton(
                              icon: SvgPicture.asset(Assets.closeIC),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
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
                                text: AppStrings.enterHere,
                                title: AppStrings.companyName,
                                validator: (value) => onboardingProvider
                                    .validateCompany(value ?? ''),
                                controller:
                                    onboardingProvider.companyNameController,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Flexible(
                              child: CustomTextFormField(
                                text: AppStrings.enterHere,
                                title: AppStrings.role,
                                validator: (value) => onboardingProvider
                                    .validateRole(value ?? ''),
                                controller: onboardingProvider.roleController,
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
                                validator: (value) => onboardingProvider
                                    .validateDate(value ?? ''),
                                controller:
                                    onboardingProvider.startDateController,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Flexible(
                              child: CustomTextFormField(
                                text: AppStrings.date,
                                title: AppStrings.endDate,
                                validator: (value) => onboardingProvider
                                    .validateDate(value ?? ''),
                                controller:
                                    onboardingProvider.endDateController,
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
                                text: AppStrings.enterHere,
                                title: AppStrings.location,
                                validator: (value) => onboardingProvider
                                    .validateLocation(value ?? ''),
                                controller:
                                    onboardingProvider.locationController,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Flexible(
                              child: CustomTextFormField(
                                text: AppStrings.enterHere,
                                title: AppStrings.employmentType,
                                validator: (value) => onboardingProvider
                                    .validateEmployementType(value ?? ''),
                                controller: onboardingProvider
                                    .employementTypeController,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        CustomTextFormField(
                          maxlines: 2,
                          text: AppStrings.enterHere,
                          title: AppStrings.description,
                          validator: (value) => onboardingProvider
                              .validateDescription(value ?? ''),
                          controller: onboardingProvider.descriptionController,
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
                        text: AppStrings.next,
                        height: 40.h,
                        width: 334.w,
                        color: MyColors.btnColor,
                        textColor: MyColors.white,
                        onTap: () {
                          debugPrint(
                              '====>  Experiance : ${onboardingProvider.companyNameController}');
                          debugPrint(
                              '====>  Experiance : ${onboardingProvider.roleController}');
                          debugPrint(
                              '====>  Experiance : ${onboardingProvider.startDateController}');
                          debugPrint(
                              '====>  Experiance : ${onboardingProvider.endDateController}');
                          debugPrint(
                              '====>  Experiance : ${onboardingProvider.locationController}');
                          debugPrint(
                              '====>  Experiance : ${onboardingProvider.employementTypeController}');
                          debugPrint(
                              '====>  Experiance : ${onboardingProvider.descriptionController}');

                          onboardingProvider.addExperience(
                              onboardingProvider.companyNameController.text,
                              onboardingProvider.roleController.text,
                              onboardingProvider.employementTypeController.text,
                              onboardingProvider.locationController.text,
                              onboardingProvider.startDateController.text,
                              onboardingProvider.endDateController.text,
                              onboardingProvider.descriptionController.text);
                          //if (formKey.currentState!.validate()) {
                          //  profileController.nextPage();
                          Get.back(result: true);
                          //   }
                        })),
                SizedBox(height: 42.h),
              ],
            ),
          ),
        ),
      ));
    });
  }
}
