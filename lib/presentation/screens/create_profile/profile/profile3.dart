import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/add_education.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile2.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile4.dart';

import '../../../../controller/form_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../constants/color.dart';
import '../../../constants/strings.dart';
import '../../../widgets/Customize_textfield.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import '../../my_contracts/send_screen.dart';
import 'add_experience.dart';
import 'static_profile.dart';

class Profile3 extends StatefulWidget {
  Profile3({super.key});

  @override
  State<Profile3> createState() => _Profile3State();
}

class _Profile3State extends State<Profile3> {
  final ProfileController profileController = Get.put(ProfileController());
  final formKey = GlobalKey<FormState>();
  final FormController formController = Get.put(FormController());
  final TextEditingController controller = TextEditingController();
  bool _isNextButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  EditCreateProfile(
                    ontap: () async {
                      final result = await Get.to(() => const AddEducation());
                      if (result != null && result == true) {
                        setState(() {
                          _isNextButtonEnabled = true;
                        });
                      }
                    },
                    validator: (value) =>
                        formController.validateExperience(value),
                    controller: controller,
                    text: 'Let us know about your education.',
                    text1: "Example : Bachelor's in Computer Science",
                    feildText: '+Add Education',
                  ),
                  SizedBox(height: 158.h),
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
                          //  if (formKey.currentState!.validate()) {
                          profileController.previousPage();
                          Get.to(() => Profile2());
                          //  }
                        },
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      CustomizeButton(
                        borderColor: MyColors.btnColor,
                        radius: 100.r,
                        text: AppStrings.next,
                        height: 40.h,
                        width: 150.w,
                        color: _isNextButtonEnabled
                            ? MyColors.btnColor
                            : MyColors.btnDisable,
                        textColor: MyColors.white,
                        onTap: _isNextButtonEnabled
                            ? () {
                                // if (formKey.currentState!.validate()) {
                                profileController.nextPage();
                                Get.to(() => Profile4());
                                //  }
                              }
                            : () {},
                      )
                    ],
                  ),
                  SizedBox(height: 42.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _deskTopView(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  DesktopEditCreate(
                    ontap: () async {
                      final result = await Get.to(() => const AddEducation());
                      if (result != null && result == true) {
                        setState(() {
                          _isNextButtonEnabled = true;
                        });
                      }
                    },
                    validator: (value) =>
                        formController.validateExperience(value),
                    controller: controller,
                    text: 'Let us know about your education.',
                    text1: "Example : Bachelor's in Computer Science",
                    feildText: '+Add Education',
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
                          //  if (formKey.currentState!.validate()) {
                          profileController.previousPage();
                          Get.to(() => Profile2());
                          //  }
                        },
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      CustomizeButton(
                        borderColor: MyColors.btnColor,
                        radius: 100.r,
                        text: AppStrings.next,
                        height: 40.h,
                        width: 150.w,
                        color: _isNextButtonEnabled
                            ? MyColors.btnColor
                            : MyColors.btnDisable,
                        textColor: MyColors.white,
                        onTap: _isNextButtonEnabled
                            ? () {
                                // if (formKey.currentState!.validate()) {
                                profileController.nextPage();
                                Get.to(() => Profile4());
                                //  }
                              }
                            : () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  _dialogueBox() {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Column(children: [
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
                        SvgPicture.asset(Assets.closeIC)
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
                            text: AppStrings.enterHere,
                            title: AppStrings.companyName,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Flexible(
                          child: CustomTextFormField(
                            text: AppStrings.enterHere,
                            title: AppStrings.role,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: CustomTextFormField(
                            text: AppStrings.enterHere,
                            title: AppStrings.location,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Flexible(
                          child: CustomTextFormField(
                            text: AppStrings.enterHere,
                            title: AppStrings.employmentType,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    const CustomTextFormField(
                      maxLines: 2,
                      text: AppStrings.enterHere,
                      title: AppStrings.description,
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
                      //if (formKey.currentState!.validate()) {
                      //  profileController.nextPage();
                      Get.back(result: true);
                      //   }
                    })),
            SizedBox(height: 42.h),
          ]));
        });
  }
}
