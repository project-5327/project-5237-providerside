import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/assets.dart';
import '../constants/color.dart';

class DiscoverContainer extends StatelessWidget {
  final String text1;
  final String username;
  final String time;
  final String image;
  final String rate;
  final String text2;
  final String text3;

  DiscoverContainer({
    super.key,
    required this.text1,
    required this.text2,
    required this.image,
    required this.text3,
    required this.username,
    required this.time,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 352.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  image,
                  height: 35.h,
                  width: 35.w,
                  fit: BoxFit.cover,
                )),
            title: Text(
              username,
              style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black),
            ),
            trailing: Text(
              time,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.grey),
            ),
          ),
          Text(
            text1,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.black2),
          ),
          ListTile(
            title: Text(
              rate,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black),
            ),
            subtitle: Text(
              text2,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(Assets.location),
                SizedBox(width: 4.w),
                Text(
                  text3,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.blue),
                ),
              ],
            ),
          ),
          const CustomizeTagContainer(tag: 'Time range'),
        ],
      ),
    );
  }
}

class CustomizeTagContainer extends StatelessWidget {
  final String tag;
  const CustomizeTagContainer({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 91.w,
      decoration: BoxDecoration(
          color: MyColors.tagCont, borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: Text(
          tag,
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: MyColors.black),
        ),
      ),
    );
  }
}
