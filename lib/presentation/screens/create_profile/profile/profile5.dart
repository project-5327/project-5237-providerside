import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../../../controller/profile_controller.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import 'profile6.dart';

class Profile5 extends StatelessWidget {
  Profile5({super.key});
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
                    //    backgroundColor: MyColors.grey,
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
                    text: 'Add your skills.',
                    color: MyColors.black,
                    size: 20.sp,
                    fontweight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    text:
                        "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit,sed do eiusmod.",
                    color: MyColors.black,
                    size: 10.sp,
                    fontweight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            color: MyColors.black.withOpacity(0.3),
                            width: 1.w)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 8, bottom: 8, right: 200),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextWidget(
                              text: 'Web design',
                              color: MyColors.white,
                              size: 9.sp,
                              fontweight: FontWeight.w400,
                            ),
                            Icon(
                              Icons.close,
                              color: MyColors.white,
                              size: 14.sp,
                            )
                          ],
                        ),
                        height: 19.h,
                        width: 98.w,
                        decoration: BoxDecoration(
                            color: MyColors.blue,
                            borderRadius: BorderRadius.circular(74.r),
                            border: Border.all(color: MyColors.grey1)),
                      ),
                    ),
                    height: 45.h,
                    width: 319.w,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextWidget(
                      // align: TextAlign.c,
                      text: 'Max 15 skills',
                      color: Color(0xff2A1E17),
                      size: 12.sp,
                      fontweight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 128.h,
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
                        Get.to(() => Profile6());
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
