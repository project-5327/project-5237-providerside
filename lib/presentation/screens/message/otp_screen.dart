import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../constants/responsive_view.dart';
import '../../constants/strings.dart';
import '../../widgets/customize_button.dart';

import '../my_contracts/send_screen.dart';
import 'change_password.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
            AppStrings.enter4Digit,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
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
                  Text(
                    AppStrings.enter4DigitCodeYour,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.textColor),
                  ),
                  SizedBox(
                    height: 78.h,
                  ),
                  Center(
                    child: Container(
                      height: 64.h,
                      width: 300.w,
                      child: PinFieldAutoFill(
                        keyboardType: TextInputType.number,
                        decoration: BoxLooseDecoration(
                          strokeColorBuilder:
                              FixedColorBuilder(Color(0xffE6E6E6)),
                          bgColorBuilder: FixedColorBuilder(Colors.white),
                          radius: Radius.circular(8),
                        ),
                        codeLength: 4,
                        onCodeChanged: (code) {
                          if (code != null && code.length == 4) {
                            print("OTP Code: $code");
                          }
                        },
                        cursor: Cursor(
                          width: 2,
                          color: Colors.black,
                          enabled: true,
                        ),
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
                          color: Color(0xff808080),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.defaultDialog(
                                  titlePadding: EdgeInsets.only(top: 20),
                                  title: AppStrings.resendOtp,
                                  titleStyle: TextStyle(
                                      fontSize: 15.sp,
                                      color: MyColors.btnColor,
                                      fontWeight: FontWeight.w400),
                                  content: Column(
                                    children: [
                                      TextWidget(
                                        text: AppStrings.otpCodeSent,
                                        color: MyColors.black1,
                                        size: 12.sp,
                                        fontweight: FontWeight.w600,
                                      ),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      CustomizeButton(
                                        borderColor: MyColors.btnColor,
                                        radius: 100.r,
                                        text: AppStrings.ok,
                                        height: 40.h,
                                        width: 134.w,
                                        color: MyColors.btnColor,
                                        textColor: MyColors.white,
                                        onTap: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                                //   Column(
                                //   children: [

                                //   ],
                                // ));
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
                  CustomizeButton(
                    borderColor: MyColors.btnColor,
                    radius: 100.r,
                    text: AppStrings.continueText,
                    height: 40.h,
                    width: 334.w,
                    color: MyColors.btnColor,
                    textColor: MyColors.white,
                    onTap: () {
                      Get.to(() => ChangePassword());
                    },
                  ),
                  SizedBox(
                    height: 53.h,
                  ),
                ],
              ),
            )
          ]),
        ),
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
            padding: const EdgeInsets.symmetric(
              horizontal: 90.0,
            ),
            child: Center(
              child: Container(
                  height: 420,
                  // width: 300.w,
                  decoration: BoxDecoration(
                      color: MyColors.blueContainer,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            AppStrings.verifyAccount,
                            style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.w500,
                                color: MyColors.textC),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          AppStrings.codeHasBeenSend,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black1),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          AppStrings.enetrCode,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black1),
                        ),
                        SizedBox(
                          height: 53,
                        ),
                        Text(
                          textAlign: TextAlign.left,
                          AppStrings.enterCODE,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: MyColors.grey4),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Center(
                          child: Container(
                            // height: 64.0,
                            // width: 90.0,
                            child: PinFieldAutoFill(
                              keyboardType: TextInputType.number,
                              decoration: BoxLooseDecoration(
                                strokeColorBuilder:
                                    FixedColorBuilder(MyColors.otpCont),
                                bgColorBuilder:
                                    FixedColorBuilder(MyColors.otpCont),
                                radius: Radius.circular(11.r),
                              ),
                              codeLength: 4,
                              onCodeChanged: (code) {
                                if (code != null && code.length == 4) {
                                  print("OTP Code: $code");
                                }
                              },
                              cursor: Cursor(
                                width: 2,
                                color: Colors.black,
                                enabled: true,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        Text(
                          AppStrings.didnotReceiveCode,
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              // decorationColor: MyColors.black1,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black1),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          AppStrings.resendCodeTime,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black1),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: CustomizeButton(
                            borderColor: MyColors.btnColor,
                            radius: 8.0,
                            text: 'Verify Account',
                            height: 48.0,
                            width: 327.0,
                            color: MyColors.btnColor,
                            textColor: MyColors.white,
                            onTap: () {
                              Get.to(() => ChangePassword());
                            },
                          ),
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
