import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';

class CustomInfoWindow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String rate;
  const CustomInfoWindow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 144.w,
      decoration: BoxDecoration(
        color: MyColors.btnColor.withOpacity(0.75),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   Assets.bluedot,
            //   height: 10.h,
            //   width: 10.w,
            //   fit: BoxFit.cover,
            // ),
            Text(
              title,
              style: TextStyle(
                color: MyColors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: MyColors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              rate,
              style: TextStyle(
                color: MyColors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
