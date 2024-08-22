import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile4.dart';

import '../../../../controller/form_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../constants/color.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import '../../my_contracts/send_screen.dart';
import 'static_profile.dart';

class Profile3 extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  final formKey = GlobalKey<FormState>();
  final FormController formController = Get.put(FormController());
  final TextEditingController controller = TextEditingController();

  Profile3({super.key});

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  EditCreateProfile(
                    ontap: () {
                      _showExperienceOptions(context);
                    },
                    validator: (value) =>
                        formController.validateExperience(value),
                    controller: controller,
                    text: 'Let us know about your education.',
                    text1: "Example : Bachelor's in Computer Science",
                    feildText: '+Add Education',
                  ),
                  SizedBox(height: 158.h),
                  Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: 'Next',
                      height: 40.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          profileController.nextPage();
                          Get.to(() => Profile4());
                        }
                      },
                    ),
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
                  text: 'Select Education',
                  color: MyColors.black,
                  size: 15.sp,
                  fontweight: FontWeight.w400,
                ),
              ),
              ListTile(
                title: TextWidget(
                  text: "Bacheler's",
                  color: MyColors.black,
                  size: 14.sp,
                  fontweight: FontWeight.w400,
                ),
                onTap: () {
                  controller.text = "Bacheler's";
                  Get.back();
                },
              ),
              ListTile(
                title: TextWidget(
                  text: "Master's",
                  color: MyColors.black,
                  size: 14.sp,
                  fontweight: FontWeight.w400,
                ),
                onTap: () {
                  controller.text = "Master's";
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
