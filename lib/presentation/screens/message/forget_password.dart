import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth/login_provider.dart';
import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../constants/fonts.dart';
import '../../constants/responsive_view.dart';
import '../../constants/strings.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import 'otp_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  // final FormController formController = Get.put(FormController());
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    provider.emailController.dispose();

    super.dispose();
  }

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
    return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: MyColors.black,
            ),
            title: Text(
              'Forgot Password',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
          body:
              Consumer<LoginProvider>(builder: (context, loginProvider, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: responsive.isTablet
                    ? const EdgeInsets.symmetric(horizontal: 100)
                    : const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Text(
                        'Enter your email for the verification process. \nWe will send 4 digits code to your email.',
                        style: TextStyle(
                            fontFamily: Fonts.fontsinter,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: MyColors.textColor),
                      ),
                    ),
                    SizedBox(
                      height: 64.h,
                    ),
                    Center(
                      child: CustomTextFormField(
                        readOnly: false,
                        validator: (value) =>
                            loginProvider.validateEmail(value ?? ''),
                        controller: loginProvider.emailController,
                        text: 'Vishal@gmail.com',
                        title: 'Email',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff222222)),
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
                      onTap: () async {
                        // //  formKey.currentState!.validate();
                        bool loginSuccess = await loginProvider.sendOtpPostApi(
                            context: context,
                            loginProvider.emailController.text);

                        if (loginSuccess) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OtpScreen()),
                          );
                          Future.delayed(const Duration(seconds: 5), () {
                            loginProvider.emailController.clear();
                            // loginProvider.passwordController.clear();
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Otp  does not get. ',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.black1,
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }

                        debugPrint(
                            "email =========> ${loginProvider.emailController.text} ");
                      },
                    ),
                    SizedBox(
                      height: 53.h,
                    ),
                  ],
                ),
              ),
            );
          }),

          //
        ),
      );
    });
  }

  _deskTopView(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          return Row(
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
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                  child: Center(
                    child: Container(
                        padding: const EdgeInsets.all(16.0),
                        height: 300.0,
                        // width: 200.w,
                        decoration: BoxDecoration(
                            color: MyColors.blueContainer,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  AppStrings.forgetPassword,
                                  style: TextStyle(
                                      fontFamily: Fonts.fontsinter,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.textC),
                                ),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                AppStrings.noWorriessEnter,
                                style: TextStyle(
                                    fontFamily: Fonts.fontsMontserrat,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black1),
                              ),
                              SizedBox(
                                height: 17.h,
                              ),
                              // CustomTextFormField(
                              //   color: MyColors.black,
                              //   readOnly: false,
                              //   title: 'EMAIL',
                              //   text: AppStrings.enterHere,
                              //   controller: loginProvider.emailController,
                              Text(
                                textAlign: TextAlign.left,
                                "EMAIL",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: Fonts.fontsMontserrat,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff999999),
                                ),
                              ),
                              TextFormField(
                                validator: (value) =>
                                    loginProvider.validateEmail(value ?? ""),
                                controller: loginProvider.emailController,
                                decoration: InputDecoration(
                                  hintText: AppStrings.enterUrEmail,
                                  hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: Fonts.fontsinter,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black1,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyColors.grey.withOpacity(0.7)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: MyColors.grey.withOpacity(0.7)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 35.h,
                              ),
                              CustomizeButton(
                                borderColor: MyColors.btnColor,
                                radius: 8.r,
                                text: 'Send Code',
                                height: 46.0,
                                width: 327.0,
                                color: MyColors.btnColor,
                                textColor: MyColors.white,

                                onTap: () async {
                                  bool loginSuccess =
                                      await loginProvider.sendOtpPostApi(
                                          context: context,
                                          loginProvider.emailController.text);
                                  if (loginSuccess) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const OtpScreen()),
                                    );
                                    Future.delayed(const Duration(seconds: 5),
                                        () {
                                      loginProvider.emailController.clear();
                                      // loginProvider.passwordController.clear();
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Otp  does not get. ',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: MyColors.black1,
                                          ),
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }

                                  debugPrint(
                                      "email =========> ${loginProvider.emailController.text} ");
                                },

                                //  }
                                // else {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(
                                //       content: Text(
                                //         'Otp  does not get. ',
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

                                //   debugPrint(
                                //       "email =========> ${loginProvider.emailController} ");
                                // },
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}
