import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/login_register/Add_projects.dart';

import '../../../controller/form_controller.dart';
import '../../constants/color.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import '../login_register/home_screen.dart';
import '../main_screen.dart';
import '../update_Project/chat_screen.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final FormController formController = Get.put(FormController());
    final TextEditingController repeatPasswordController =
        TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: MyColors.black,
          ),
          title: Text(
            'Forgot Password',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  _pages[currentIndex],
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Enter your email for the verification process.\nWe will send 4 digits code to your email.',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.textColor),
                  ),
                  SizedBox(
                    height: 64.h,
                  ),
                  Center(
                    child: Obx(
                      () => CustomTextFormField(
                        obscureText: formController.obscureText.value,
                        validator: (value) =>
                            formController.validatePassword(value ?? ''),
                        controller: passwordController,
                        text: '****************',
                        title: 'Add Password',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222222),
                        ),
                        icon: IconButton(
                            onPressed: () {
                              formController.togglePasswordVisibility();
                            },
                            icon: Icon(formController.obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18.sp,
                  ),
                  Center(
                    child: Obx(
                      () => CustomTextFormField(
                        obscureText: formController.obscureRepeatText.value,
                        validator: (value) =>
                            formController.validateRepeatPassword(
                                value ?? '', passwordController.toString()),
                        controller: repeatPasswordController,
                        text: '****************',
                        title: 'Repeat Password',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff222222)),
                        icon: IconButton(
                            onPressed: () {
                              formController.toggleRepeatPasswordVisibility();
                            },
                            icon: Icon(formController.obscureRepeatText.value
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 276.h,
                  ),
                  CustomizeButton(
                    borderColor: MyColors.btnColor,
                    radius: 100.r,
                    text: 'Continue',
                    height: 40.h,
                    width: 334.w,
                    color: MyColors.btnColor,
                    textColor: MyColors.white,
                    onTap: () {
                      formKey.currentState!.validate();
                      Get.to(() => AddProjects());
                    },
                  ),
                  SizedBox(
                    height: 53.h,
                  ),
                ],
              ),
            ),
          ),
        ),

        //
      ),
    );
  }
}
