import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile7.dart';

import '../../../../controller/profile_controller.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import '../../my_contracts/send_screen.dart';

class Profile6 extends StatelessWidget {
  Profile6({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreateProfileWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: MyColors.blue1, shape: BoxShape.circle),
                        child: TextWidget(
                          text: 'M',
                          color: MyColors.white,
                          size: 20.sp,
                          fontweight: FontWeight.w700,
                        ),
                        height: 42.h,
                        width: 42.w,
                      ),
                      SizedBox(
                        width: 44.w,
                      ),
                      TextWidget(
                          text: 'Create Profile',
                          color: MyColors.black,
                          size: 24.sp,
                          fontweight: FontWeight.w500),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        Assets.arrowLeft,
                        height: 22.h,
                        width: 11.w,
                        fit: BoxFit.cover,
                      ),
                      TextWidget(
                          text: '${profileController.currentIndex.value + 1}/8',
                          color: MyColors.black,
                          size: 14.sp,
                          fontweight: FontWeight.w400),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  LinearProgressIndicator(
                    value: (profileController.currentIndex.value + 1) / 8,
                    color: MyColors.btnColor,
                    //  backgroundColor: MyColors.grey,
                    borderRadius: BorderRadius.circular(4.r),
                    minHeight: 5.h,
                    //  valueColor:
                    //MyColors.blue,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    text: 'Profile Description',
                    color: MyColors.black,
                    size: 20.sp,
                    fontweight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  TextFormField(
                    maxLines: 6,
                    // controller: controller,
                    // onChanged: onChanged,
                    // obscureText: obscureText,
                    // validator: validator,
                    decoration: InputDecoration(
                      hintText:
                          "Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed do \neiusmod.Lorem \nipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod.Lorem ipsum \ndolor sit amet, consectetur adipiscing elit,sed do eiusmod.",
                      hintStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2A1E17)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 47.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextWidget(
                      // align: TextAlign.c,
                      text: '500 characters',
                      color: Color(0xff2A1E17),
                      size: 12.sp,
                      fontweight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 57.h,
                  ),
                  Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: 'Next',
                      height: 40.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {
                        profileController.nextPage();
                        Get.to(() => Profile7());
                      },
                    ),
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
