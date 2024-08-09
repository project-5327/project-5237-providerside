import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/bottom_navigation.dart';
import '../../widgets/contract_widgets.dart';
import '../login_register/home_screen.dart';
import '../login_register/EditProfile.dart';
import '../login_register/message.dart';
import '../update_Project/chat_screen.dart';
import 'send_screen.dart';

class MyProjectScreen extends StatefulWidget {
  const MyProjectScreen({super.key});

  @override
  State<MyProjectScreen> createState() => _MyProjectScreenState();
}

class _MyProjectScreenState extends State<MyProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: MyColors.black,
        ),
        title: Text(
          'My Projects',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //  _pages[currentIndex],
              SizedBox(height: 14.h),
              Center(
                child: Container(
                  height: 47.h,
                  width: 336.w,
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(CupertinoIcons.search),
                      hintText: 'Search for projects',
                      hintStyle: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.lightGrey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              InkWell(
                onTap: () => _showDialogBox(context, 'Do you want to Block ',
                    'Joseph Aina ?', 'Yes', 'No'),
                child: ProjectTile1(
                    image: Assets.bag,
                    title: 'Project 1',
                    title1: 'Joseph Aina',
                    subtitle: 'Monday, 5th January - 11:50pm',
                    tralingicon: Assets.message,
                    //$
                    tralingtext: '\$Rate',
                    btnText: 'Active',
                    btnColor: MyColors.skyBlue,
                    btntextColor: MyColors.black1,
                    image1: 'assets/images/girl2.png'),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () => _showDialogBox(context, 'Do you want to Report ',
                    'Joseph Aina ?', 'Report', 'Cancel'),
                child: ProjectTile1(
                    image: Assets.bag,
                    title: 'Project 2',
                    title1: 'Tayo Israel',
                    subtitle: 'Monday, 5th January - 11:50pm',
                    tralingicon: Assets.message,
                    //$
                    tralingtext: '\$Rate',
                    btnText: 'Pending',
                    btnColor: MyColors.orange,
                    btntextColor: MyColors.black,
                    image1: 'assets/images/girl2.png'),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () => _showDialogBox(context, 'Do you want to Remove ',
                    'Joseph Aina ?', 'Remove', 'Cancel'),
                child: ProjectTile1(
                    image: Assets.bag,
                    title: 'Project 3',
                    title1: 'Abiodun Taiwo',
                    subtitle: 'Monday, 5th January - 11:50pm',
                    tralingicon: Assets.message,
                    //$
                    tralingtext: '\$Rate',
                    btnText: 'Booked',
                    btntextColor: MyColors.black,
                    btnColor: MyColors.grey2,
                    image1: 'assets/images/girl2.png'),
              ),
              SizedBox(
                height: 20.h,
              ),
              ProjectTile1(
                  image: Assets.bag,
                  title: 'Project 4',
                  title1: 'Abiodun Taiwo',
                  subtitle: 'Monday, 5th January - 11:50pm',
                  tralingicon: Assets.message,
                  //$
                  tralingtext: '\$Rate',
                  btnText: 'Done',
                  btnColor: MyColors.green,
                  btntextColor: MyColors.white,
                  image1: 'assets/images/girl2.png'),
              SizedBox(
                height: 20.h,
              ),
              ProjectTile1(
                  image: Assets.bag,
                  title: 'Project 5',
                  title1: 'Ismail Ojo',
                  subtitle: 'Monday, 5th January - 11:50pm',
                  tralingicon: Assets.message,
                  //$
                  tralingtext: '\$Rate',
                  btnText: 'Canceled',
                  btntextColor: MyColors.red,
                  btnColor: MyColors.lightred,
                  image1: 'assets/images/girl2.png'),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialogBox(
    BuildContext context,
    String text,
    String text1,
    String btntext1,
    String btntext2,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(
                child: TextWidget(
                  text: 'Are you Sure?',
                  color: MyColors.btnColor,
                  size: 20.sp,
                  fontweight: FontWeight.w700,
                ),
              ),
              content: RichText(
                text: TextSpan(
                  text: text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: MyColors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      //recognizer: TapGestureRecognizer()

                      text: text1,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              // TextWidget(
              //   text: text,
              //   color: MyColors.black,
              //   size: 12,
              //   fontweight: FontWeight.w500,
              // ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: MyColors.btnColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: MyColors.btnColor),
                          )),
                      onPressed: () {
                        Get.back();
                      },
                      child: TextWidget(
                        text: btntext1,
                        color: MyColors.white,
                        size: 12.sp,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: MyColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: MyColors.btnColor),
                            borderRadius: BorderRadius.circular(100),
                          )),
                      onPressed: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextWidget(
                          text: btntext2,
                          color: MyColors.black,
                          size: 12.sp,
                          fontweight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ]);
        });
  }
}
