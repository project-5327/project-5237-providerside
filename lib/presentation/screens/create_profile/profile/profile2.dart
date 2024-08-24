import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/container_controller.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/add_experience.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile_detail.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';

import '../../../../controller/form_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../constants/responsive_view.dart';
import '../../../constants/strings.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import 'profile3.dart';
import 'static_profile.dart';

class Profile2 extends StatefulWidget {
  Profile2({super.key});

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  final ProfileController profileController = Get.put(ProfileController());

  final formKey = GlobalKey<FormState>();

  final FormController formController = Get.put(FormController());

  final ContainerController containerController =
      Get.put(ContainerController());

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
                      final result = await Get.to(() => const AddExperience());
                      if (result != null && result == true) {
                        setState(() {
                          _isNextButtonEnabled = true;
                        });
                      }
                    },
                    validator: (value) =>
                        formController.validateExperience(value),
                    controller: controller,
                    text: AppStrings.createProfileExperince,
                    text1: AppStrings.createProfileLorem1,
                    feildText: AppStrings.addExperience,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 18.h,
                        width: 18.w,
                        child: containerController.selectedcont[2]
                            ? Icon(
                                size: 12.sp, Icons.check, color: MyColors.white)
                            : null,
                        decoration: BoxDecoration(
                          color: containerController.selectedcont[2]
                              ? Color(0xffFF4C4A)
                              : MyColors.white,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 2.w,
                            color: MyColors.black.withOpacity(0.3),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      TextWidget(
                        text: AppStrings.noExperince,
                        color: MyColors.black.withOpacity(0.3),
                        size: 13.sp,
                        fontweight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(height: 122.h),
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
                          Get.to(() => ProfileDetail());
                          // }
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
                                //  if (formKey.currentState!.validate()) {
                                profileController.nextPage();
                                Get.to(() => Profile3());
                                // }
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
              width: 336.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      final result = await _dialogueBox();
                      if (result != null && result == true) {
                        setState(() {
                          _isNextButtonEnabled = true;
                        });
                      }
                    },
                    validator: (value) =>
                        formController.validateExperience(value),
                    controller: controller,
                    text: AppStrings.createProfileExperince,
                    text1: AppStrings.createProfileLorem1,
                    feildText: AppStrings.addExperience,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 18.h,
                        width: 18.w,
                        child: containerController.selectedcont[2]
                            ? Icon(
                                size: 12.sp, Icons.check, color: MyColors.white)
                            : null,
                        decoration: BoxDecoration(
                          color: containerController.selectedcont[2]
                              ? Color(0xffFF4C4A)
                              : MyColors.white,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 2.w,
                            color: MyColors.black.withOpacity(0.3),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      TextWidget(
                        text: AppStrings.noExperince,
                        color: MyColors.black.withOpacity(0.3),
                        size: 13.sp,
                        fontweight: FontWeight.w400,
                      ),
                    ],
                  ),
                  SizedBox(height: 122.h),
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
                          Get.to(() => ProfileDetail());
                          // }
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
                                //  if (formKey.currentState!.validate()) {
                                profileController.nextPage();
                                Get.to(() => Profile3());
                                // }
                              }
                            : () {},
                      )
                    ],
                  ),
                  SizedBox(height: 42.h),
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
              title: Row(
                children: [
                  SizedBox(
                    width: 310.w,
                  ),
                  TextWidget(
                    text: AppStrings.addExperience1,
                    color: MyColors.black,
                    fontweight: FontWeight.w600,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 200.w,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      CupertinoIcons.clear,
                      color: MyColors.black.withOpacity(0.5),
                      size: 21.sp,
                    ),
                  )
                ],
              ),
              content: Column(children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(14.0),
                    //  height: 683.h,
                    width: 694.w,
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
                  height: 30.h,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: CustomizeButton(
                        borderColor: MyColors.btnColor,
                        radius: 100.r,
                        text: AppStrings.next,
                        height: 45.h,
                        width: 192.w,
                        color: MyColors.btnColor,
                        textColor: MyColors.white,
                        onTap: () {
                          //if (formKey.currentState!.validate()) {
                          //  profileController.nextPage();
                          Get.back(result: true);
                          //   }
                        })),
              ]));
        });
  }
}
