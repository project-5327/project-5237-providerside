import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../../../controller/form_controller.dart';
import '../../../../controller/profile_controller.dart';
import '../../../constants/color.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import 'profile3.dart';

class Profile2 extends StatelessWidget {
  Profile2({super.key});
  final ProfileController profileController = Get.put(ProfileController());
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
                          text: 'Add work your experiences.',
                          text1:
                              'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit,sed do eiusmod.',
                          feildText: '+Add Experience'),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 18.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(
                                    width: 2.w,
                                    color: MyColors.black.withOpacity(0.3))),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          TextWidget(
                            text: 'No experience yet.',
                            color: MyColors.black.withOpacity(0.3),
                            size: 13.sp,
                            fontweight: FontWeight.w400,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 122.h,
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
                            Get.to(() => Profile3());
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
