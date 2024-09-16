import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/dashboard/dashboard_view.dart';

import '../../../controller/form_controller.dart';
import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../constants/responsive_view.dart';
import '../../constants/strings.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import '../login_register/home_screen.dart';
import '../main_screen .dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final formKey = GlobalKey<FormState>();
  final FormController formController = Get.put(FormController());
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      desktop: _deskTopView(context),
      mobile: _mobileView(context),
      tablet: _mobileView(context),
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
                ? EdgeInsets.symmetric(horizontal: 100.sp)
                : EdgeInsets.symmetric(horizontal: 20.sp),
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
                        readOnly: false,
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
                        readOnly: false,
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
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashBoardView()),
                        (Route<dynamic> route) =>
                            false, // Remove all previous routes
                      );
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
                    height: 420,
                    // width: 300.w,
                    decoration: BoxDecoration(
                        color: MyColors.blueContainer,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Text(
                            AppStrings.createNewPassword,
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                                color: MyColors.textC),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            AppStrings.pleaseEnterAndConfirm,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black1),
                          ),
                          SizedBox(
                            height: 39,
                          ),
                          CustomTextFormField(
                            color: MyColors.black,
                            readOnly: false,
                            title: 'Password',
                            text: 'Enter your password',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CustomTextFormField(
                            color: MyColors.black,
                            readOnly: false,
                            title: 'Confirm Password',
                            text: 'Enter your password',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          CustomizeButton(
                            borderColor: MyColors.btnColor,
                            radius: 8.0,
                            text: 'Reset Password',
                            height: 48.0,
                            width: 327.0,
                            color: MyColors.btnColor,
                            textColor: MyColors.white,
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashBoardView()),
                                (Route<dynamic> route) =>
                                    false, // Remove all previous routes
                              );
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
