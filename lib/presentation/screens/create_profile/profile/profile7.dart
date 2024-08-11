import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile8.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/create_profile_widget.dart';

import '../../../../controller/profile_controller.dart';
import '../../../widgets/customize_button.dart';

class Profile7 extends StatelessWidget {
  Profile7({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CreateProfileWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            text:
                                '${profileController.currentIndex.value + 1}/8',
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
                      // backgroundColor: MyColors.grey,
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
                      text: 'Add Hourly Rate',
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
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do  eiusmod.',
                      color: MyColors.black,
                      size: 10.sp,
                      fontweight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    TextWidget(
                      align: TextAlign.start,
                      text: 'Hourly Rate',
                      color: MyColors.black,
                      size: 16.sp,
                      fontweight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            //controller: controller,
                            //onChanged: onChanged,
                            //obscureText: obscureText,
                            //validator: validator,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Text(
                                  textAlign: TextAlign.left,
                                  '\$',
                                  style: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              hintText: '50.00',
                              hintStyle: TextStyle(
                                color: MyColors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        TextWidget(
                          text: '/hr',
                          color: MyColors.black.withOpacity(0.3),
                          size: 16.sp,
                          fontweight: FontWeight.w600,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 129.h,
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
                          Get.to(() => Profile8());
                        },
                      ),
                    ),
                    SizedBox(
                      height: 42.h,
                    ),
                  ]),
            ),
          ],
        ),
      )),
    );
  }
}
