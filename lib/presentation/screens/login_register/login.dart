import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/presentation/screens/message/forget_password.dart';
import 'package:provider/provider.dart';

import '../../../controller/form_controller.dart';
import '../../../provider/auth/login_provider.dart';
import '../../constants/color.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import '../dashboard/dashboard_view.dart';
import 'register.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FormController formController = Get.put(FormController());
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
      return SafeArea(
        child: Scaffold(
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
                                Get.to(() => const RegisterScreen());
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
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 63.5.h),
                        Center(
                          child: CustomTextFormField(
                            validator: (value) =>
                                loginProvider.validateEmail(value ?? ""),
                            controller: loginProvider.emailController,
                            text: 'Enter your name',
                            title: 'Email',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff222222),
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        Center(
                          child: CustomTextFormField(
                            obscureText: loginProvider.obscureText,
                            validator: (value) =>
                                loginProvider.validatePassword(value ?? ""),
                            controller: loginProvider.passwordController,
                            text: '****************',
                            title: 'Password',
                            icon: IconButton(
                                onPressed: () {
                                  loginProvider.togglePasswordVisibility();
                                },
                                icon: Icon(loginProvider.obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff222222),
                            ),
                          ),
                        ),
                        SizedBox(height: 9.7.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Get.to(const ForgetPasswordScreen());
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
                        if (loginProvider.isLoading)
                          Center(
                              child: CircularProgressIndicator(
                            color: MyColors.btnColor,
                          ))
                        else
                          Center(
                            child: CustomizeButton(
                              borderColor: MyColors.btnColor,
                              radius: 100.r,
                              text: 'Login',
                              height: 40.h,
                              width: 334.w,
                              color: MyColors.btnColor,
                              textColor: MyColors.white,
                              onTap: () async {
                                bool loginSuccess = await loginProvider.login(
                                  context: context,
                                  email: loginProvider.emailController.text,
                                  password:
                                      loginProvider.passwordController.text,
                                );
                                print(
                                    "email=======> ${loginProvider.emailController.text}");
                                print(
                                    "password=======> ${loginProvider.passwordController.text}");
                                if (loginFormKey.currentState?.validate() ??
                                    false) {
                                  if (loginSuccess) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DashBoardView()),
                                    );
                                    Future.delayed(const Duration(seconds: 5),
                                        () {
                                      loginProvider.emailController.clear();
                                      loginProvider.passwordController.clear();
                                    });
                                  }
                                  // else {
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //       content: Text(
                                  //         'Login failed. Please check your credentials and try again.',
                                  //         style: TextStyle(
                                  //           fontSize: 15.sp,
                                  //           fontWeight: FontWeight.w500,
                                  //           color: MyColors.black1,
                                  //         ),
                                  //       ),
                                  //       backgroundColor: Colors.red,
                                  //     ),
                                  //   );
                                  // }
                                }
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
                                      Get.to(const RegisterScreen());
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
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
