import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/profile_controller.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile2.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/create_profile_widget.dart';

import '../../../constants/assets.dart';
import '../../../widgets/Customize_textfield.dart';
import '../../../widgets/customize_button.dart';

class ProfileDetail extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());
  ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreateProfileWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  EditCreateProfile(
                      text: 'First, add a title to tell the world what you do.',
                      text1:
                          'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit,sed do eiusmod.',
                      feildText: 'Example Web developer | Web & Mobile'),
                  SizedBox(
                    height: 158.h,
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
                        Get.to(() => Profile2());
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
