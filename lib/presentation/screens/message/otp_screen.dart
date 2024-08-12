import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../constants/color.dart';
import '../../widgets/bottom_navigation.dart';
import '../../widgets/customize_button.dart';
import '../login_register/home_screen.dart';
import '../my_contracts/send_screen.dart';
import '../update_Project/chat_screen.dart';
import '../login_register/EditProfile.dart';
import 'change_password.dart';
import 'forget_password.dart';
import '../login_register/message.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyColors.black,
            ),
          ),
          title: Text(
            'Enter 4 Digit Code',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Enter 4 digit code that your receive on your \nemail (cody.fisher45@example.com).',
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
                        text: 'Email not received? ',
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
                                  title: 'Resend OTP',
                                  titleStyle: TextStyle(
                                      fontSize: 15.sp,
                                      color: MyColors.btnColor,
                                      fontWeight: FontWeight.w400),
                                  content: Column(
                                    children: [
                                      TextWidget(
                                        text: 'OTP code sent on your email.',
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
                                        text: 'Ok',
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
                            text: 'Resend code',
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
                    text: 'Continue',
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
}
