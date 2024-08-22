import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/profile_controller.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/widgets/create_profile_widget.dart';

import '../../../constants/assets.dart';

class StaticProfileLayout extends StatelessWidget {
  final Widget Function() middleContentBuilder;

  const StaticProfileLayout({Key? key, required this.middleContentBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreateProfileWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        SizedBox(width: 10.w),
                        Text(
                          'Create Profile',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: MyColors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 75.w),
                        Obx(() => Text(
                              '${profileController.currentIndex.value + 1}/8',
                              style: TextStyle(
                                color: MyColors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: 45.h),
                    LinearProgressIndicator(
                      value: (profileController.currentIndex.value + 1) / 8,
                      color: MyColors.btnColor,
                      borderRadius: BorderRadius.circular(4.r),
                      minHeight: 5.h,
                    ),
                    SizedBox(height: 25.h),
                    middleContentBuilder(),
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
