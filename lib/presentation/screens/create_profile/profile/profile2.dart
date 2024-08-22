import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/container_controller.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/add_experience.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile_detail.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../../../controller/form_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../constants/color.dart';
import '../../../constants/strings.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import 'profile3.dart';
import 'static_profile.dart';

class Profile2 extends StatelessWidget {
  Profile2({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  final formKey = GlobalKey<FormState>();
  final FormController formController = Get.put(FormController());
  final ContainerController containerController =
      Get.put(ContainerController());
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    ontap: () => Get.to(AddExperience()),
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
                      // Obx(
                      //   () => InkWell(
                      //     onTap: () => containerController.toggelSelection(2),
                      //     child:
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
                          if (formKey.currentState!.validate()) {
                            profileController.nextPage();
                            Get.to(() => ProfileDetail());
                          }
                        },
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
                          if (formKey.currentState!.validate()) {
                            profileController.nextPage();
                            Get.to(() => Profile3());
                          }
                        },
                      ),
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

  void _showExperienceOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Wrap(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: TextWidget(
                  text: AppStrings.selectExperience,
                  color: MyColors.black,
                  size: 15.sp,
                  fontweight: FontWeight.w400,
                ),
              ),
              ListTile(
                title: TextWidget(
                  text: AppStrings.fresher,
                  color: MyColors.black,
                  size: 14.sp,
                  fontweight: FontWeight.w400,
                ),
                onTap: () {
                  controller.text = AppStrings.fresher;
                  Get.back();
                },
              ),
              ListTile(
                title: TextWidget(
                  text: '1 year',
                  color: MyColors.black,
                  size: 14.sp,
                  fontweight: FontWeight.w400,
                ),
                onTap: () {
                  controller.text = '1 year';
                  Get.back();
                },
              ),
              ListTile(
                title: TextWidget(
                  text: '2 year',
                  color: MyColors.black,
                  size: 14.sp,
                  fontweight: FontWeight.w400,
                ),
                onTap: () {
                  controller.text = '2 years';
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
