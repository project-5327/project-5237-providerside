import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/my_account.dart';
import 'package:project_5237_provider/presentation/screens/login_register/login.dart';

import '../../constants/color.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import '../main_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController repeatPasswordController = TextEditingController();
  String _selectedValue = 'Client';

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: 160.h,
              decoration: BoxDecoration(color: MyColors.blue),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.white),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      'Create your account',
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.white),
                    ),
                    SizedBox(
                      height: 39.h,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 23.h,
                  ),
                  Center(
                    child: CustomTextFormField(
                      controller: nameController,
                      text: 'Enter your name',
                      title: 'Name',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222222)),
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Center(
                    child: CustomTextFormField(
                      controller: emailController,
                      text: 'Enter your email',
                      title: 'Email',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222222)),
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Center(
                    child: CustomTextFormField(
                      controller: passwordController,
                      text: '****************',
                      title: 'Password',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222222)),
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  Center(
                    child: CustomTextFormField(
                      controller: repeatPasswordController,
                      text: '****************',
                      title: 'Repeat Password',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222222)),
                    ),
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Center(
                    child: Text(
                      'I am a :',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                        color: MyColors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Center(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                              color: MyColors.black.withOpacity(0.5)),
                        ),
                        height: 30.h,
                        width: 270.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 28.h,
                              width: 135.w,
                              decoration: BoxDecoration(
                                color: _selectedValue == 'Freelancer'
                                    ? MyColors.btnColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio<String>(
                                    activeColor: Colors.white,
                                    value: 'Freelancer',
                                    groupValue: _selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedValue = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Freelancer',
                                    style: TextStyle(
                                      color: _selectedValue == 'Freelancer'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Provider Option
                            Container(
                              height: 28.h,
                              width: 133.w,
                              decoration: BoxDecoration(
                                color: _selectedValue == 'Client'
                                    ? MyColors.btnColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                //  crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio<String>(
                                    activeColor: Colors.white,
                                    value: 'Client',
                                    groupValue: _selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedValue = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Client',
                                    style: TextStyle(
                                      color: _selectedValue == 'Client'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 23.h,
                  ),
                  Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: 'Register',
                      height: 40.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {
                        Get.to(() => MyAccountScreen());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'I have an account ?  ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: MyColors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(LoginScreen());
                              },
                            text: 'Login',
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
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
