import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';

class ProjectComp extends StatelessWidget {
  final String text1;
  final String username;
  final String time;
  final String image;
  final String rate;
  final String text2;
  final String text3;
  final int count;
  final List<String> skill;
  const ProjectComp({
    super.key,
    required this.text1,
    required this.text2,
    required this.image,
    required this.text3,
    required this.username,
    required this.time,
    required this.rate,
    required this.skill,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                  height: 40.h,
                  width: 40.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Container(
                margin: EdgeInsets.only(right: 8.w),
                width: 200.w,
                child: Text(
                  username,
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
              Text(
                time,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: MyColors.black.withOpacity(0.40),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          Text(
            text1,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 15.sp,
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
                    text2,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                count,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
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
                        skill[index],
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: MyColors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
