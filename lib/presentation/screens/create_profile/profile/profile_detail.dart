import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/profile_controller.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/static_profile.dart';

import '../../../constants/color.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import 'profile2.dart';

class ProfileDetail extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final FormController formController = Get.put(FormController());
  final TextEditingController skillsController = TextEditingController();
  final ProfileController profileController = Get.put(ProfileController());
  // final LoadingController loadingController = Get.put(LoadingController());

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
      middleContentBuilder: () => Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            EditCreateProfile(
              ontap: () {},
              validator: (value) => formController.validateSkills(value),
              controller: skillsController,
              text: 'First, add a title to tell the world what you do.',
              text1: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              feildText: 'Example Web developer | Web & Mobile',
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
}
