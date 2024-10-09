import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:provider/provider.dart';

import '../../../../provider/onboarding/onbaording_provider.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../widgets/customize_button.dart';

class AddEducation extends StatefulWidget {
  AddEducation({super.key});

  @override
  State<AddEducation> createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  final educationKey = GlobalKey<FormState>();

  Future<void> _pickDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('MMMM yyyy').format(picked);
      });
    }
  }

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
                    padding: const EdgeInsets.all(14.0),
                    //height: 440.h,
                    width: 335.w,
                    decoration: BoxDecoration(
                        color: MyColors.blueContainer,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Form(
                      key: educationKey,
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
                          CustomTextFormField(
                            errorMessage: 2,
                            text: AppStrings.enterHere,
                            title: AppStrings.degree,
                            validator: (value) => onboardingProvider
                                .validateDegreeOrCertifcate(value ?? ''),
                            controller: onboardingProvider
                                .degreeORCertificateController,
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          CustomTextFormField(
                            errorMessage: 2,
                            text: AppStrings.enterHere,
                            title: AppStrings.institutionName,
                            validator: (value) => onboardingProvider
                                .validateInstituteName(value ?? ''),
                            controller:
                                onboardingProvider.instituteNameController,
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: CustomTextFormField(
                                  errorMessage: 2,
                                  text: AppStrings.enterHere,
                                  title: AppStrings.fieldOfStudy,
                                  validator: (value) => onboardingProvider
                                      .validateFeildOfStudy(value ?? ''),
                                  controller:
                                      onboardingProvider.feildOfStudyController,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Flexible(
                                child: CustomTextFormField(
                                  errorMessage: 2,
                                  text: AppStrings.enterHere,
                                  title: AppStrings.location,
                                  validator: (value) => onboardingProvider
                                      .validateLocatioon1(value ?? ''),
                                  controller:
                                      onboardingProvider.location1Controller,
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
                                child: GestureDetector(
                                  onTap: () => _pickDate(
                                    context,
                                    onboardingProvider.startDateController,
                                  ),
                                  child: AbsorbPointer(
                                    child: CustomTextFormField(
                                      text: AppStrings.date,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.black),
                                      title: AppStrings.startDate,
                                      controller: onboardingProvider
                                          .startDateController,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.w),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () => _pickDate(context,
                                      onboardingProvider.endDateController),
                                  child: AbsorbPointer(
                                    child: CustomTextFormField(
                                      text: AppStrings.date,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.black),
                                      title: AppStrings.endDate,
                                      controller:
                                          onboardingProvider.endDateController,
                                    ),
                                  ),
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
                          debugPrint(
                              '====>  education : ${onboardingProvider.degreeORCertificateController}');
                          debugPrint(
                              '====>  education : ${onboardingProvider.instituteNameController}');
                          debugPrint(
                              '====>  education : ${onboardingProvider.feildOfStudyController}');
                          debugPrint(
                              '====>  education : ${onboardingProvider.location1Controller.text}');
                          debugPrint(
                              '====>  education : ${onboardingProvider.locationController}');
                          debugPrint(
                              '====>  education : ${onboardingProvider.startDate1Controller}');
                          debugPrint(
                              '====>  education : ${onboardingProvider.endDate1Controller}');
                          if (educationKey.currentState!.validate()) {
                            onboardingProvider.addEducation(
                                onboardingProvider.instituteNameController.text,
                                onboardingProvider
                                    .degreeORCertificateController.text,
                                onboardingProvider.feildOfStudyController.text,
                                onboardingProvider.location1Controller.text,
                                onboardingProvider.startDate1Controller.text,
                                onboardingProvider.endDate1Controller.text);
                            Get.back(result: true);
                          }
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
