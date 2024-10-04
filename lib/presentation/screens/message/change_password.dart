import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
import '../login_register/home_screen.dart';
import '../login_register/login.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final formKey = GlobalKey<FormState>();

  //final FormController formController = Get.put(FormController());
  final TextEditingController repeatPasswordController =
      TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    provider.passwordController.dispose();
    provider.confirmPasswordController.dispose();
    super.dispose();
  }

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
    return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
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
                  CustomTextFormField(
                    readOnly: false,
                    obscureText: loginProvider.obscureText,
                    validator: (value) =>
                        loginProvider.validatePassword(value ?? ''),
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
                          loginProvider.togglePasswordVisibility();
                        },
                        icon: Icon(loginProvider.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility)),
                  ),

                  SizedBox(
                    height: 18.sp,
                  ),
                  Center(
                    child: CustomTextFormField(
                      readOnly: false,
                      obscureText: loginProvider.obscureRepeatText,
                      validator: (value) =>
                          loginProvider.validatePassword(value ?? ''),
                      controller: repeatPasswordController,
                      text: '****************',
                      title: 'Repeat Password',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff222222)),
                      icon: IconButton(
                          onPressed: () {
                            loginProvider.toggleRepeatPasswordVisibility();
                          },
                          icon: Icon(loginProvider.obscureRepeatText
                              ? Icons.visibility_off
                              : Icons.visibility)),
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
                      onTap: () async {
                        if (loginProvider.otpCode.isNotEmpty) {
                          loginProvider.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: MyColors.blue1,
                                ))
                              : await loginProvider.changePassword(
                                  loginProvider.otpCode,
                                  loginProvider.passwordController.text,
                                  context: context,
                                );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      //StockHubPage()
                                      // AddStockRequest()
                                      LoginScreen()));
                          Future.delayed(const Duration(seconds: 5), () {
                            loginProvider.passwordController.clear();
                            loginProvider.confirmPasswordController.clear();
                          });
                        }
                      }),
                  SizedBox(
                    height: 53.h,
                  ),
                ],
              ),
            ),
          ),

          //
        ),
      );
    });
  }

  _deskTopView(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
      return Scaffold(
          body: Row(children: [
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
                            padding: EdgeInsets.all(14.0),
                            height: 575.h,
                            // width: 300.w,
                            decoration: BoxDecoration(
                                color: MyColors.blueContainer,
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.createNewPassword,
                                      style: TextStyle(
                                          fontSize: 32.0,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.textC),
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Text(
                                      AppStrings.pleaseEnterAndConfirm,
                                      style: TextStyle(
                                          fontFamily: Fonts.fontsMontserrat,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.black1),
                                    ),
                                    SizedBox(
                                      height: 39.h,
                                    ),
                                    Text(
                                      textAlign: TextAlign.left,
                                      "PASSWORD",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: Fonts.fontsMontserrat,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff999999),
                                      ),
                                    ),
                                    TextFormField(
                                      obscureText: loginProvider.obscureText,
                                      validator: (value) => loginProvider
                                          .validatePassword(value ?? ""),
                                      controller:
                                          loginProvider.passwordController,
                                      decoration: InputDecoration(
                                        hintText: AppStrings.enterUrPassWord,
                                        hintStyle: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: Fonts.fontsinter,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.black1,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.grey
                                                  .withOpacity(0.7)),
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              loginProvider
                                                  .togglePasswordVisibility();
                                            },
                                            icon: Icon(loginProvider.obscureText
                                                ? Icons.visibility_off
                                                : Icons.visibility)),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.grey
                                                  .withOpacity(0.7)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    Text(
                                      textAlign: TextAlign.left,
                                      "CONFIRM PASSWORD",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: Fonts.fontsMontserrat,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff999999),
                                      ),
                                    ),
                                    TextFormField(
                                      obscureText:
                                          loginProvider.obscureRepeatText,
                                      validator: (value) =>
                                          loginProvider.validateRepeatPassword(
                                              value ?? "",
                                              loginProvider
                                                  .passwordController.text),
                                      controller: loginProvider
                                          .confirmPasswordController,
                                      decoration: InputDecoration(
                                        hintText: AppStrings.enterUrPassWord,
                                        hintStyle: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: Fonts.fontsinter,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.black1,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.grey
                                                  .withOpacity(0.7)),
                                        ),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              loginProvider
                                                  .toggleRepeatPasswordVisibility();
                                            },
                                            icon: Icon(
                                                loginProvider.obscureRepeatText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility)),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: MyColors.grey
                                                  .withOpacity(0.7)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    CustomizeButton(
                                        borderColor: MyColors.btnColor,
                                        radius: 8.r,
                                        text: 'Reset Password',
                                        height: 46.0,
                                        width: 327.0,
                                        color: MyColors.btnColor,
                                        textColor: MyColors.white,
                                        onTap: () async {
                                          if (loginProvider
                                              .otpCode.isNotEmpty) {
                                            loginProvider.isLoading
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                    color: MyColors.blue1,
                                                  ))
                                                : await loginProvider
                                                    .changePassword(
                                                    loginProvider.otpCode,
                                                    loginProvider
                                                        .passwordController
                                                        .text,
                                                    context: context,
                                                  );

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        //StockHubPage()
                                                        // AddStockRequest()
                                                        LoginScreen()));
                                            Future.delayed(
                                                const Duration(seconds: 5), () {
                                              loginProvider.passwordController
                                                  .clear();
                                              loginProvider
                                                  .confirmPasswordController
                                                  .clear();
                                            });
                                          }
                                        }),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ]),
                            ))))))
      ]));
    });
  }
}
