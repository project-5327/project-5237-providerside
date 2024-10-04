import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/login_register/login.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth/register_provider.dart';
import '../../constants/color.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> regisKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: screenWidth,
                  height: 160.h,
                  decoration: BoxDecoration(color: MyColors.blue),
                  child: Stack(
                    children: [
                      Padding(
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
                      Positioned(
                        top: -30,
                        right: 0,
                        height: 200,
                        width: 200,
                        child: SvgPicture.asset(
                          'assets/svg_icon/circle3.svg',
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: regisKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 23.h,
                        ),
                        /* Center(
                            child: CustomTextFormField(
                              obscureText: formController.obscureText.value,
                              validator: (value) =>
                                  registerProvider.validateUserName(value ?? ''),
                              controller: registerProvider.nameController,
                              text: 'Enter your name',
                              title: 'Name',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff222222)),
                            ),
                          ),*/
                        SizedBox(
                          height: 22.h,
                        ),
                        Center(
                          child: CustomTextFormField(
                            readOnly: false,
                            validator: (value) =>
                                registerProvider.validateUserName(value ?? ''),
                            controller: registerProvider.fullNameController,
                            text: 'Enter Full Name',
                            title: 'Full Name',
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
                            readOnly: false,
                            validator: (value) =>
                                registerProvider.validateEmail(value ?? ''),
                            controller: registerProvider.emailController,
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
                              obscureText: registerProvider.obscureText,
                              icon: IconButton(
                                  onPressed: () {
                                    registerProvider.togglePasswordVisibility();
                                  },
                                  icon: Icon(registerProvider.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              readOnly: false,
                              validator: (value) => registerProvider
                                  .validatePassword(value ?? ""),
                              controller: registerProvider.passwordController,
                              text: '****************',
                              title: 'Add Password',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff222222),
                              )),
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Center(
                          child: CustomTextFormField(
                            obscureText: registerProvider.obscureRepeatText,
                            readOnly: false,
                            // keyboardType: TextInputType.visiblePassword,
                            validator: (value) =>
                                registerProvider.validateRepeatPassword(
                                    value ?? '',
                                    registerProvider.passwordController
                                        .text), // Use .text to get the value
                            controller:
                                registerProvider.repeatPasswordController,
                            text: '****************',
                            title: 'Repeat Password',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff222222)),
                            icon: IconButton(
                                onPressed: () {
                                  registerProvider
                                      .toggleRepeatPasswordVisibility();
                                },
                                icon: Icon(registerProvider.obscureRepeatText
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                          ),
                        ),
                        // SizedBox(
                        //   height: 34.h,
                        // ),
                        // Center(
                        //   child: Text(
                        //     'I am a :',
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.w700,
                        //       fontSize: 12.sp,
                        //       color: MyColors.black,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 16.h,
                        // ),
                        // Center(
                        //   child: Container(
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(4.r),
                        //         border: Border.all(
                        //             color: MyColors.black.withOpacity(0.5)),
                        //       ),
                        //       height: 30.h,
                        //       width: 252.w,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           Container(
                        //             // height: 28.h,
                        //             // width: 130.w,
                        //             decoration: BoxDecoration(
                        //               color: _selectedValue == 'Freelancer'
                        //                   ? MyColors.btnColor
                        //                   : Colors.white,
                        //               borderRadius: BorderRadius.circular(4.r),
                        //             ),
                        //             child: Row(
                        //               // crossAxisAlignment: CrossAxisAlignment.center,
                        //               children: [
                        //                 Radio<String>(
                        //                   activeColor: Colors.white,
                        //                   value: 'Freelancer',
                        //                   groupValue: _selectedValue,
                        //                   onChanged: (value) {
                        //                     setState(() {
                        //                       _selectedValue = value!;
                        //                     });
                        //                   },
                        //                 ),
                        //                 Text(
                        //                   'Freelancer',
                        //                   style: TextStyle(
                        //                     fontSize: 12.sp,
                        //                     fontWeight: FontWeight.w500,
                        //                     color:
                        //                         _selectedValue == 'Freelancer'
                        //                             ? Colors.white
                        //                             : Colors.black,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //
                        //           // Provider Option
                        //           Container(
                        //             // height: 28.h,
                        //             // width: 120.w,
                        //             decoration: BoxDecoration(
                        //               color: _selectedValue == 'Client'
                        //                   ? MyColors.btnColor
                        //                   : Colors.white,
                        //               borderRadius: BorderRadius.circular(4.r),
                        //             ),
                        //             child: Row(
                        //               //    mainAxisAlignment: MainAxisAlignment.center,
                        //               //  crossAxisAlignment: CrossAxisAlignment.center,
                        //               children: [
                        //                 Radio<String>(
                        //                   activeColor: Colors.white,
                        //                   value: 'Client',
                        //                   groupValue: _selectedValue,
                        //                   onChanged: (value) {
                        //                     setState(() {
                        //                       _selectedValue = value!;
                        //                     });
                        //                   },
                        //                 ),
                        //                 Text(
                        //                   'Client',
                        //                   style: TextStyle(
                        //                     fontSize: 12.sp,
                        //                     fontWeight: FontWeight.w500,
                        //                     color: _selectedValue == 'Client'
                        //                         ? Colors.white
                        //                         : Colors.black,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       )),
                        // ),
                        SizedBox(
                          height: 23.h,
                        ),

                        Row(
                          children: [
                            Checkbox(
                              value: registerProvider.checkBox1,
                              onChanged: (val) {
                                registerProvider.checkBox1 = val!;
                                registerProvider.notifyListeners();
                              },
                              activeColor: Color(0xffFF4C4A),
                            ),
                            const Expanded(
                              child: Text(
                                'Yes! Send me genuinely useful emails every now and then to help me get the most out of Upwork.',
                                softWrap: true,
                                maxLines: 4,
                                overflow: TextOverflow.clip,
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 15),

                        Row(
                          children: [
                            Checkbox(
                              value: registerProvider.checkBox2,
                              onChanged: (val) {
                                registerProvider.checkBox2 = val!;
                                registerProvider.notifyListeners();
                              },
                              activeColor: Color(0xffFF4C4A),
                            ),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Yes, I understand and agree to the ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'UPTECHUNT Terms of Service',
                                      style: TextStyle(
                                        color: Color(0xffFF4C4A),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ', including the ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          'User Agreement and Privacy Policy.',
                                      style: TextStyle(
                                        color: Color(0xffFF4C4A),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        if (registerProvider.isLoading)
                          Center(
                              child: CircularProgressIndicator(
                            color: MyColors.btnColor,
                          ))
                        else
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
                                if (registerProvider.checkBox1 &&
                                    registerProvider.checkBox2) {
                                  if (regisKey.currentState!.validate()) {
                                    registerProvider.signUpBtn(
                                        context: context);
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Accept Terms And Conditions'),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        SizedBox(height: 23.h),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'I have an account?  ',
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
                        SizedBox(height: 23.h),
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
