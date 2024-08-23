import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../presentation/constants/assets.dart';
import '../../presentation/constants/color.dart';
import '../../presentation/screens/my_contracts/send_screen.dart';

class ProjectComp extends StatelessWidget {
  const ProjectComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: MyColors.textColor),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                child: SvgPicture.asset(
                  Assets.profile_img,
                  height: 35.h,
                  width: 35.w,
                ),
              ),
              SizedBox(
                width: 12.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 8.w),
                width: 200.w,
                child: Text(
                  'Project Name',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.black),
                ),
              ),
              Spacer(),
              Text(
                '5 hours ago',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.black.withOpacity(0.40)),
              ),
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          Text(
            'Lorem Ipsum has been the industry\'s standard dummy text ever since the  1500s',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.black),
          ),
          SizedBox(
            height: 13.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Rate',
                    color: MyColors.black,
                    size: 12.sp,
                    fontweight: FontWeight.w500,
                  ),
                  TextWidget(
                    text: '\$1,000 - \$2,000',
                    color: MyColors.black,
                    size: 12.sp,
                    fontweight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 18.h, right: 17.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: MyColors.tagCont),
                  padding:
                      EdgeInsets.symmetric(horizontal: 33.w, vertical: 6.h),
                  child: Text(
                    'Tag1',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.black),
                  ),
                );
              })),
        ],
      ),
    );
  }
}
