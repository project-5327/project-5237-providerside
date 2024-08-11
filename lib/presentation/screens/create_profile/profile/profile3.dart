import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile4.dart';

import '../../../../controller/form_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../constants/color.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';

class Profile3 extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  Profile3({super.key});
  final formKey = GlobalKey<FormState>();
  final FormController formController = Get.put(FormController());

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CreateProfileWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      EditCreateProfile(
                          validator: (value) =>
                              formController.validateExperience(value),
                          controller: controller,
                          text: 'Let us know about your education.',
                          text1: "Example : Bachelor's in Computer Science",
                          feildText: '+Add Education'),
                      SizedBox(
                        height: 158.h,
                      ),
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
                            formKey.currentState!.validate();
                            profileController.nextPage();
                            Get.to(() => Profile4());
                          },
                        ),
                      ),
                      SizedBox(
                        height: 42.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
