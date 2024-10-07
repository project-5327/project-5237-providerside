import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';

import '../constants/strings.dart';

class TimeLineToggel extends StatefulWidget {
  const TimeLineToggel({super.key});

  @override
  State<TimeLineToggel> createState() => _TimeLineToggelState();
}

class _TimeLineToggelState extends State<TimeLineToggel> {
  String selectedSize = 'Medium';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = AppStrings.small;
            });
          },
          child: Row(
            children: [
              SvgPicture.asset(selectedSize == AppStrings.small
                  ? Assets.circle_dotIC
                  : Assets.circleIC),
              SizedBox(
                width: 2.w,
              ),
              Text(
                AppStrings.small,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: selectedSize == AppStrings.small
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: MyColors.black3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.w),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = AppStrings.medium;
            });
          },
          child: Row(
            children: [
              SvgPicture.asset(selectedSize == AppStrings.medium
                  ? Assets.circle_dotIC
                  : Assets.circleIC),
              SizedBox(
                width: 2.w,
              ),
              Text(
                AppStrings.medium,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: selectedSize == AppStrings.medium
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: MyColors.black3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.w),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = AppStrings.large;
            });
          },
          child: Row(
            children: [
              SvgPicture.asset(selectedSize == AppStrings.large
                  ? Assets.circle_dotIC
                  : Assets.circleIC),
              SizedBox(
                width: 2.w,
              ),
              Text(
                AppStrings.large,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: selectedSize == AppStrings.large
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: MyColors.black3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Toggell1 extends StatefulWidget {
  final ValueChanged<String> onExperienceLevelChanged;

  const Toggell1({super.key, required this.onExperienceLevelChanged});

  @override
  State<Toggell1> createState() => _Toggell1State();
}

class _Toggell1State extends State<Toggell1> {
  String selectedSize = AppStrings.medium;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = AppStrings.fresher;
              widget.onExperienceLevelChanged(selectedSize);
            });
          },
          child: Row(
            children: [
              SvgPicture.asset(selectedSize == AppStrings.fresher
                  ? Assets.circle_dotIC
                  : Assets.circleIC),
              SizedBox(width: 2.w),
              Text(
                AppStrings.fresher,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: selectedSize == AppStrings.fresher
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: MyColors.black3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.w),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = AppStrings.medium;
              widget.onExperienceLevelChanged(selectedSize);
            });
          },
          child: Row(
            children: [
              SvgPicture.asset(selectedSize == AppStrings.medium
                  ? Assets.circle_dotIC
                  : Assets.circleIC),
              SizedBox(width: 2.w),
              Text(
                AppStrings.medium,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: selectedSize == AppStrings.medium
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: MyColors.black3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.w),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = AppStrings.experinced;
              widget.onExperienceLevelChanged(selectedSize);
            });
          },
          child: Row(
            children: [
              SvgPicture.asset(selectedSize == AppStrings.experinced
                  ? Assets.circle_dotIC
                  : Assets.circleIC),
              SizedBox(width: 2.w),
              Text(
                AppStrings.experinced,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: selectedSize == AppStrings.experinced
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: MyColors.black3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
