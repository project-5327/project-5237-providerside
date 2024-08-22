import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/my_project.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/customize_button.dart';
import '../update_Project/chat_screen.dart';

class SuccesfullyScreen extends StatefulWidget {
  const SuccesfullyScreen({super.key});

  @override
  State<SuccesfullyScreen> createState() => _SuccesfullyScreenState();
}

class _SuccesfullyScreenState extends State<SuccesfullyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // _pages[currentIndex],
              SvgPicture.asset(Assets.successImg),
              SizedBox(
                height: 18.h,
              ),
              Text(
                'Projects Details',
                style: TextStyle(
                    color: MyColors.btnColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 13.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.black),
              ),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: CustomizeButton(
                    borderColor: MyColors.btnColor,
                    radius: 100.r,
                    text: 'Visit Applicaiton',
                    height: 50.h,
                    width: 327.w,
                    color: MyColors.btnColor,
                    textColor: MyColors.white,
                    onTap: () {
                      Get.to(() => MyProjectScreen());
                    }
                    //)

                    ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
