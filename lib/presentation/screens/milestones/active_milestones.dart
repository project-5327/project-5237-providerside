import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/screens/filter/filter.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

class ActiveMilestones extends StatelessWidget {
  const ActiveMilestones({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35.h,
            ),
            const RichTextMile(text: 'Heading1: ', text1: '\$200'),
            SizedBox(
              height: 13.h,
            ),
            const RichTextMile(text: 'Heading1: ', text1: '\$200'),
            SizedBox(
              height: 13.h,
            ),

            TextWidget(
              text: 'Waiting for submission...',
              color: MyColors.black,
              size: 14.sp,
              fontweight: FontWeight.w400,
            ),
            SizedBox(
              height: 13.h,
            ),

            const RichTextMile(
              text: 'Due date- ',
              text1: '23 feb 2022',
            )

            // TextWidget(text: '', color: MyColors.black,size: ,fontweight: FontWeight.w400,)
          ],
        ),
      ),
    );
  }
}

class RichTextMile extends StatelessWidget {
  final String text;
  final String text1;
  const RichTextMile({super.key, required this.text, required this.text1});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.sp,
          color: MyColors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
