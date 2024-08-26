// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/login_register/succesfully.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/my_project.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';
import '../../constants/color.dart';
import '../../constants/strings.dart';
import '../../widgets/Details_textfield.dart';

class AddProjects extends StatelessWidget {
  const AddProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobile(),
      tablet: _desktop(context),
      desktop: _desktop(context),
    );
  }

  Widget _mobile() {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColors.black,
          ),
        ),
        title: Text(
          AppStrings.addYourProjects,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(child: DetailsTextfield(
        onTap: () {
          Get.to(() => const SuccesfullyScreen());
        },
      )),
    );
  }

  Widget _desktop(context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColors.black,
          ),
        ),
        title: Text(
          AppStrings.addYourProjects,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 400,
            child: SingleChildScrollView(child: DetailsTextfield(
              onTap: () {
                _showDialogeBox(context);
              },
            )),
          ),
        ),
      ),
    );
  }

  void _showDialogeBox(context) {
    final responsive = ResponsiveCheck(context);
    Get.defaultDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 55.w),
      title: "",
      content: SizedBox(
        width: 350.w,
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
              AppStrings.updatedSuccessfully,
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
              height: 31.h,
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
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  }
                  //)

                  ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
