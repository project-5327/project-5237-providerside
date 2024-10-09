import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
import '../../widgets/customize_button.dart';
import '../my_contracts/send_screen.dart';
import 'change_password.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String otp;
  @override
  void dispose() {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    provider.passwordController.dispose();
    provider.confirmPasswordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _otpFieldKey = GlobalKey<FormState>();
  bool validateOtp(String otp) {
    return otp.length == 4 && RegExp(r'^\d{4}$').hasMatch(otp);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: _deskTopView(context),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // leading: IconButton(
            //   onPressed: () {
            //     Get.back();
            //   },
            //   icon: const Icon(Icons.arrow_back_ios),
            //   color: MyColors.black,
            // ),
            title: Text(
              AppStrings.enter4Digit,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: responsive.isTablet
                      ? const EdgeInsets.symmetric(horizontal: 120)
                      : const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      RichText(
                        text: TextSpan(
                          text:
                              "Enter 4 digit code that your receive on your email ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: MyColors.lightGrey,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "(",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: MyColors.lightGrey,
                              ),
                            ),
                            TextSpan(
                              text: "cody.fisher45@example.com",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: MyColors.black1,
                              ),
                            ),
                            TextSpan(
                              text: ")",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: MyColors.lightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 78.h,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: OtpTextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            focusedBorderColor: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            numberOfFields: 4,
                            showFieldAsBox: true,
                            onCodeChanged: (String code) {},
                            onSubmit: (String verificationCode) {
                              if (validateOtp(verificationCode)) {
                                loginProvider.setOtpCode(verificationCode);
                                debugPrint(
                                    "Entered OTP: ${loginProvider.otpCode}");
                              } else {
                                debugPrint(
                                    "Invalid OTP. Please enter a valid 4-digit code.");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Invalid OTP. Please enter a valid 4-digit code."),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: AppStrings.emailNotRecived,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xff808080),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    bool resendSuccess =
                                        await loginProvider.sendOtpPostApi(
                                      context: context,
                                      widget.email,
                                    );

                                    if (resendSuccess) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "OTP has been resent to your email.",
                                          ),
                                          backgroundColor: Colors.black,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                          "Failed to resend OTP. Please try again.",
                                        ),
                                        backgroundColor: Colors.black,
                                      ));
                                    }
                                  },
                                text: AppStrings.resendCode,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 344.h,
                      ),
                      loginProvider.isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: MyColors.btnColor,
                              ),
                            )
                          : CustomizeButton(
                              borderColor: MyColors.btnColor,
                              radius: 100.r,
                              text: 'Continue',
                              height: 40.h,
                              width: 334.w,
                              color: MyColors.btnColor,
                              textColor: MyColors.white,
                              onTap: () async {
                                if (loginProvider.otpCode.isNotEmpty) {
                                  if (!loginProvider.isLoading) {
                                    final password =
                                        loginProvider.passwordController.text ??
                                            '';
                                    final repeatPassword = loginProvider
                                            .confirmPasswordController.text ??
                                        '';

                                    bool otpVerified =
                                        await loginProvider.verifyOTP(
                                      loginProvider.otpCode,
                                      context: context,
                                    );

                                    if (otpVerified) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangePassword()),
                                      );
                                    }
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please enter the OTP'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                            ),
                      SizedBox(
                        height: 53.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  _deskTopView(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
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
              padding: const EdgeInsets.symmetric(horizontal: 120.0),
              child: Center(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    height: 500.h,
                    // width: 300.w,
                    decoration: BoxDecoration(
                        color: MyColors.blueContainer,
                        borderRadius: BorderRadius.circular(14.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Center(
                          child: Text(
                            AppStrings.verifyAccount,
                            style: TextStyle(
                                fontFamily: Fonts.fontsinter,
                                fontSize: 32.0,
                                fontWeight: FontWeight.w500,
                                color: MyColors.textC),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        // Text(
                        //   AppStrings.codeHasBeenSend,
                        //   style: TextStyle(
                        //       fontFamily: Fonts.fontsinter,
                        //       fontSize: 12.0,
                        //       fontWeight: FontWeight.w500,
                        //       color: MyColors.black1),
                        // ),
                        RichText(
                          text: TextSpan(
                            text: 'Code has been sent to ',
                            style: TextStyle(
                                fontFamily: Fonts.fontsinter,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black1),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'josphamdes@gmail.com',
                                style: TextStyle(
                                    fontFamily: Fonts.fontsinter,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.black1),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          AppStrings.enetrCode,
                          style: TextStyle(
                              fontFamily: Fonts.fontsinter,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black1),
                        ),
                        SizedBox(
                          height: 53.h,
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          AppStrings.enterCODE,
                          style: TextStyle(
                              fontFamily: Fonts.fontsinter,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: OtpTextField(
                            //alignment: Alignment.centerLeft,
                            showFieldAsBox: true,
                            fieldWidth: 50,
                            borderColor:
                                MyColors.otpCont, // Border color for each field

                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            focusedBorderColor: MyColors.otpCont,
                            borderRadius: BorderRadius.circular(10),
                            numberOfFields: 4,

                            decoration: InputDecoration(
                              filled: true,
                              fillColor: MyColors
                                  .otpCont, // Set the background color here
                            ),
                            onCodeChanged: (String code) {},
                            onSubmit: (String verificationCode) {
                              loginProvider.setOtpCode(verificationCode);
                              debugPrint(
                                  "Entered OTP: ${loginProvider.otpCode}");
                            },
                          ),
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Didn’t Receive Code? ',
                            style: TextStyle(
                                fontFamily: Fonts.fontsinter,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black1),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Resend Code ',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontFamily: Fonts.fontsinter,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black1),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          AppStrings.resendCodeTime,
                          style: TextStyle(
                              fontFamily: Fonts.fontsinter,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black1),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (loginProvider.otpCode.isNotEmpty) {
                                if (!loginProvider.isLoading) {
                                  final password =
                                      loginProvider.passwordController.text ??
                                          '';
                                  final repeatPassword = loginProvider
                                          .confirmPasswordController.text ??
                                      '';

                                  await loginProvider.changePassword(
                                    loginProvider.otpCode,
                                    //  password,
                                    context: context,
                                  );

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              //StockHubPage()
                                              // AddStockRequest()
                                              const ChangePassword()));
                                } else {
                                  // Loading Indicator
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Processing, please wait...')),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please enter the OTP')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.blue,
                              padding: const EdgeInsets.all(10),
                              textStyle: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.verifyAccount,
                                  style: TextStyle(
                                      fontFamily: Fonts.fontsinter,
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: 5),
                                SvgPicture.asset(Assets.check),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    )),
              ),
            ),
          )),
        ],
      ));
    });
  }
}
