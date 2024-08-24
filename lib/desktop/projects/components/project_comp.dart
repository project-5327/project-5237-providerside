import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

class ProjectComp extends StatelessWidget {
  const ProjectComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: MyColors.grey3),
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
                  'Jason Jones',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.black,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text('5 hours ago',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.black.withOpacity(0.40)),
                  )),
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          Text(
            'Lorem Ipsum has been the industry\'s standard dummy text ever since the  1500s',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.black),
            ),
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
                  Text(
                    AppStrings.rate,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black),
                    ),
                  ),
                  Text(
                    '\$1,000 - \$2,000',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: MyColors.blue,
                  ),
                  Text(
                    'Location',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.blue),
                    ),
                  ),
                  SizedBox(
                    width: 17.w,
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: 18.h,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: MyColors.tagCont),
                  padding:
                      EdgeInsets.symmetric(horizontal: 33.w, vertical: 6.h),
                  child: Text(
                    'Tag1',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.black),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
