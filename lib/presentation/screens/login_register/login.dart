import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/presentation/screens/main_screen.dart';
import 'package:project_5237_provider/presentation/screens/message/forget_password.dart';

import '../../constants/color.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import 'register.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: 265.h,
              decoration: BoxDecoration(color: MyColors.blue),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 36.h), // responsive height
                    Text(
                      'Sign in to your \naccount',
                      style: TextStyle(
                        fontSize: 24.sp, // responsive text size
                        fontWeight: FontWeight.w400,
                        color: MyColors.white,
                      ),
                    ),
                    SizedBox(height: 5.7.h),
                    Text(
                      'Sign in to your account',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.white,
                      ),
                    ),
                    SizedBox(height: 22.7.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomizeButton(
                          text: 'Seek Service',
                          radius: 100.r,
                          height: 40.h,
                          width: 151.5.w,
                          color: MyColors.btnColor,
                          textColor: MyColors.white,
                          borderColor: MyColors.white,
                          onTap: () {
                            Get.to(() => RegisterScreen());
                          },
                        ),
                        CustomizeButton(
                          text: 'Post Service',
                          height: 40.h,
                          width: 151.5.w,
                          color: MyColors.white,
                          textColor: Colors.grey,
                          borderColor: MyColors.white,
                          radius: 100.r,
                          onTap: () {
                            // Get.to(() => SendProposalScreen());
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30.8.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 63.5.h),
                  Center(
                    child: CustomTextFormField(
                      controller: emailController,
                      text: 'Enter your name',
                      title: 'Email',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff222222),
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Center(
                    child: CustomTextFormField(
                      controller: passwordController,
                      text: '****************',
                      title: 'Password',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff222222),
                      ),
                    ),
                  ),
                  SizedBox(height: 9.7.h),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.to(ForgetPasswordScreen());
                      },
                      child: Text(
                        textAlign: TextAlign.right,
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 27.5.h),
                  Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: 'Login',
                      height: 40.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {
                        Get.to(MainScreen());
                      },
                    ),
                  ),
                  SizedBox(height: 27.5.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Don’t have an account ? ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: MyColors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(RegisterScreen());
                              },
                            text: 'Register',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: MyColors.btnColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
