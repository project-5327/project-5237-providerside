import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/login_register/message.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';

class AcceptedMessage extends StatelessWidget {
  const AcceptedMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "\$Proposal accepted",
            style: TextStyle(
                fontFamily: "Lexend",
                fontSize: 26.sp,
                fontWeight: FontWeight.w400,
                color: MyColors.black1),
          ),
          SizedBox(
            height: 23.h,
          ),
          Text(
            textAlign: TextAlign.center,
            "Lorem ipsum dolor sit amet consectetur. \nEtiam sollicitudin gravida et ornare.",
            style: TextStyle(
                fontFamily: "Lexend",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black1),
          ),
          SizedBox(
            height: 33.h,
          ),
          CustomizeButton(
            borderColor: MyColors.btnColor,
            radius: 100.r,
            text: AppStrings.message,
            height: 40.h,
            width: 130.w,
            color: MyColors.btnColor,
            textColor: MyColors.white,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MessageScreen()),
                (Route<dynamic> route) =>
                    false, // This will remove all previous routes
              );
            },
          ),
        ],
      ),
    ));
  }
}
