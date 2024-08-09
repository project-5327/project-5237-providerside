import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../constants/color.dart';
import '../../widgets/customize_button.dart';
import '../login_register/proposal.dart';

class AwaitingMilestones extends StatelessWidget {
  const AwaitingMilestones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            TextWidget(
              text: 'Work submitted',
              color: MyColors.black,
              size: 20.sp,
              fontweight: FontWeight.w700,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextWidget(
              text:
                  "Lorem Ipsum has been the industry's standard dummy text ever since the  1500s",
              color: MyColors.black,
              size: 11.sp,
              fontweight: FontWeight.w600,
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomizeButton(
                  text: 'Accept',
                  height: 40.h,
                  width: 154.w,
                  color: MyColors.btnColor,
                  textColor: MyColors.white,
                  borderColor: MyColors.btnColor,
                  radius: 100.r,
                  onTap: () {
                    Get.to(() => ProposalScreen());
                  },
                ),
                SizedBox(
                  width: 14.w,
                ),
                CustomizeButton(
                  text: 'Request Changes',
                  radius: 100.r,
                  height: 40.h,
                  width: 160.w,
                  color: MyColors.btnColor,
                  textColor: MyColors.white,
                  borderColor: MyColors.btnColor,
                  onTap: () {
                    Get.to(() => ProposalScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//   void _dialogBox() {}
// }
