import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color.dart';

class CustomInfoWindow extends StatelessWidget {
  final title;
  final subtitle;
  final rate;
  final image;
  final color;
  final h;
  final w;
  const CustomInfoWindow({
    super.key,
    this.title,
    this.subtitle,
    this.rate,
    this.image,
    this.color,
    this.h,
    this.w,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: color,
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
              title!,
              style: TextStyle(
                color: MyColors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w800,
              ),
            ),

            Text(
              subtitle!,
              style: TextStyle(
                color: MyColors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              rate!,
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
