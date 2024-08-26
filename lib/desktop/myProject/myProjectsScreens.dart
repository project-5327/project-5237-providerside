import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/presentation/screens/login_register/Add_projects.dart';

import '../../presentation/constants/assets.dart';
import '../../presentation/constants/color.dart';
import '../../presentation/constants/strings.dart';
import '../../presentation/screens/my_contracts/send_screen.dart';
import '../../presentation/widgets/customize_button.dart';

class MyProjectsScreen extends StatefulWidget {
  const MyProjectsScreen({super.key});

  @override
  State<MyProjectsScreen> createState() => _MyProjectsScreenState();
}

class _MyProjectsScreenState extends State<MyProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 0.w, top: 37.h, right: 10.w),
        children: [
          Wrap(
            children: List.generate(
              12,
              (index) {
                return const ProjectComp();
              },
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomizeButton(
              borderColor: MyColors.btnColor,
              radius: 100.r,
              text: AppStrings.addProject,
              height: 40.h,
              width: 151.w,
              color: MyColors.btnColor,
              textColor: MyColors.white,
              onTap: () {
                Get.to(AddProjects());
              },
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
        ],
      ),
    );
  }
}

class ProjectComp extends StatelessWidget {
  const ProjectComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30.w, bottom: 30.h),
      width: 360.w,
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
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 6.h),
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
