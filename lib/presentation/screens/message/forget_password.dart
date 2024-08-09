import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import 'otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: MyColors.black,
        ),
        title: Text(
          'Forgot Password',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //   _pages[currentIndex],
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Enter your email for the verification process. \nWe will send 4 digits code to your email.',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.textColor),
              ),
              SizedBox(
                height: 64.h,
              ),
              Center(
                child: CustomTextFormField(
                  controller: emailController,
                  text: 'Vishal@gmail.com',
                  title: 'Email',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff222222)),
                ),
              ),
              SizedBox(
                height: 376.h,
              ),
              CustomizeButton(
                borderColor: MyColors.btnColor,
                radius: 100.r,
                text: 'Send Code',
                height: 40.h,
                width: 334.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                onTap: () {
                  Get.to(() => OtpScreen());
                },
              ),
              SizedBox(
                height: 53.h,
              ),
            ],
          ),
        ),
      ),

      //
    );
  }
}
