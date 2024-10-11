import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile_detail.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/create_profile_widget.dart';
import 'package:project_5237_provider/presentation/widgets/divider.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/customize_button.dart';

class CreateYourProfile extends StatelessWidget {
  CreateYourProfile({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CreateProfileWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    SvgPicture.asset(
                      Assets.createProfile,
                      height: 93.h,
                      width: 146.w,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    TextWidget(
                      align: TextAlign.center,
                      text: 'Hey Adam. Ready for your',
                      color: MyColors.black,
                      size: 16.sp,
                      fontweight: FontWeight.w600,
                    ),
                    TextWidget(
                      align: TextAlign.center,
                      text: 'next big opportunity?',
                      color: MyColors.black,
                      size: 16.sp,
                      fontweight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    TextWidget(
                      text: 'Build a profile to show the world what you can do',
                      color: MyColors.black,
                      size: 11.sp,
                      fontweight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const CustomizeDivider(),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextWidget(
                      text:
                          'Apply on jobs posted from clients, around the world',
                      color: MyColors.black,
                      size: 11.sp,
                      fontweight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    const CustomizeDivider(),
                    SizedBox(
                      height: 12.h,
                    ),
                    TextWidget(
                      text: 'Get paid safely and know we’re here to help',
                      color: MyColors.black,
                      size: 11.sp,
                      fontweight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    Center(
                      child: CustomizeButton(
                          borderColor: MyColors.btnColor,
                          radius: 100.r,
                          text: 'Create Your Profile',
                          height: 40.h,
                          width: 334.w,
                          color: MyColors.btnColor,
                          textColor: MyColors.white,
                          onTap: () {
                            Get.to(() => ProfileDetail());
                          }),
                    ),
                    SizedBox(
                      height: 42.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
