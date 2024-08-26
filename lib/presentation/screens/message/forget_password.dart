import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/form_controller.dart';
import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../constants/responsive_view.dart';
import '../../constants/strings.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';

import 'change_password.dart';
import 'otp_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final FormController formController = Get.put(FormController());
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      tablet: _mobileView(context),
      desktop: _deskTopView(context),
    );
  }

  _mobileView(BuildContext context) {
    final responsive = ResponsiveCheck(context);

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
            padding: responsive.isTablet
                ? const EdgeInsets.symmetric(horizontal: 100)
                : const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Center(
                    child: Text(
                      'Enter your email for the verification process. \nWe will send 4 digits code to your email.',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.textColor),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: CustomTextFormField(
                      readOnly: false,
                      validator: (value) =>
                          formController.validateEmail(value ?? ''),
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
                    height: 200.h,
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
                      formKey.currentState!.validate();
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
        ),

        //
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
            child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0),
            child: Center(
              child: Container(
                  padding: EdgeInsets.all(14.0),
                  height: 350,
                  // width: 200.w,
                  decoration: BoxDecoration(
                      color: MyColors.blueContainer,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: ,
                      children: [
                        Text(
                          AppStrings.forgetPassword,
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: MyColors.textC),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          AppStrings.noWorriessEnter,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black1),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        CustomTextFormField(
                          color: MyColors.black,
                          readOnly: false,
                          title: 'EMAIL',
                          text: 'Enter your email',
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        CustomizeButton(
                          borderColor: MyColors.btnColor,
                          radius: 8.0,
                          text: 'Send Code',
                          height: 48.0,
                          width: 327.0,
                          color: MyColors.btnColor,
                          textColor: MyColors.white,
                          onTap: () {
                            Get.to(() => OtpScreen());
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        )),
      ],
    ));
  }
}
