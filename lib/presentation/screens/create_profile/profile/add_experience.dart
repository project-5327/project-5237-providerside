import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';

import '../../../constants/assets.dart';
import '../../../constants/color.dart';

class AddExperience extends StatelessWidget {
  const AddExperience({super.key});

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
          AppStrings.addExperience1,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 37.h,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(14.0),
              height: 382.h,
              width: 335.w,
              decoration: BoxDecoration(
                  color: MyColors.blueContainer,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: AppStrings.experience1,
                        color: MyColors.black,
                        fontweight: FontWeight.w500,
                        size: 14.sp,
                      ),
                      SvgPicture.asset(Assets.closeIC)
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  const Flexible(
                    child: Row(
                      children: [
                        CustomTextFormField(
                          text: AppStrings.enterHere,
                          title: AppStrings.companyName,
                        ),
                        CustomTextFormField(
                          text: AppStrings.enterHere,
                          title: AppStrings.role,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
