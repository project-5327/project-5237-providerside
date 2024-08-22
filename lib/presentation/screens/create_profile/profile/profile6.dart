import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile5.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile7.dart';

import '../../../../controller/profile_controller.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../constants/strings.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import '../../my_contracts/send_screen.dart';
import 'static_profile.dart';

class Profile6 extends StatelessWidget {
  Profile6({super.key});
  final ProfileController profileController = Get.put(ProfileController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StaticProfileLayout(
        middleContentBuilder: () => Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    text: AppStrings.addDescription,
                    color: MyColors.black,
                    size: 20.sp,
                    fontweight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 27.h,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    text: AppStrings.lorem2,
                    color: MyColors.grey,
                    size: 10.sp,
                    fontweight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    text: AppStrings.yourSkills,
                    color: MyColors.black,
                    size: 12.sp,
                    fontweight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: AppStrings.desc,
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
                    height: 20.h,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomizeButton(
                        borderColor: MyColors.btnColor,
                        radius: 100.r,
                        text: AppStrings.privious,
                        height: 40.h,
                        width: 150.w,
                        color: MyColors.white,
                        textColor: MyColors.btnColor,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            profileController.nextPage();
                            Get.to(() => Profile5());
                          }
                        },
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      CustomizeButton(
                        borderColor: MyColors.btnColor,
                        radius: 100.r,
                        text: AppStrings.next,
                        height: 40.h,
                        width: 150.w,
                        color: MyColors.btnColor,
                        textColor: MyColors.white,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            profileController.nextPage();
                            Get.to(() => Profile7());
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 42.h,
                  ),
                ],
              ),
            ));
  }
}
