import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/desktop/home/AcceptProposalScreen.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';

class ProjectDetailScreen extends StatelessWidget {
  final bool isFromHomeScreen;
  const ProjectDetailScreen({super.key, required this.isFromHomeScreen});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.details,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.grey4),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 32.h, left: 33, right: 33),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: MyColors.blue2,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    padding: EdgeInsets.only(
                        left: 47.w, top: 30.h, right: 52.w, bottom: 15.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 60.r,
                              backgroundImage: const NetworkImage(
                                'https://via.placeholder.com/150', // Placeholder image
                              ),
                            ),
                            SizedBox(width: 32.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Jason Jones',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.white),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '5 hours ago',
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: MyColors.white.withOpacity(0.60),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconContainer(icon: Assets.callWhite),
                            SizedBox(
                              width: 8.w,
                            ),
                            IconContainer(icon: Assets.chatWhite)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 48.w, top: 39.h, right: 62.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Heading1',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black),
                          ),
                        ),
                        Text(
                          '\$1,000 - \$2,000',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Heading2',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black),
                          ),
                        ),
                        Text(
                          'Intermediate',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black),
                          ),
                        ),
                        const SizedBox(height: 13),
                        const Divider(
                          thickness: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, '
                          'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
                          'It has survived not only five centuries, but also the leap into electronic typesetting, '
                          'remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset '
                          'sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like '
                          'Aldus PageMaker including versions of Lorem Ipsum.',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: MyColors.black),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: List.generate(
                            3,
                            (index) {
                              return Container(
                                margin: EdgeInsets.only(right: 12.w),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 3.h),
                                decoration: BoxDecoration(
                                    color: MyColors.tagCont,
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Text(
                                  "Tag ${index + 1}",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: MyColors.black),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: 62.w, bottom: 24.h, top: 28.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 56.w, vertical: 12.h),
                          ),
                          child: Text(
                            isFromHomeScreen
                                ? AppStrings.reject
                                : AppStrings.hire,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => AcceptProposalScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.blue,
                            padding: EdgeInsets.symmetric(
                                horizontal: 38.w, vertical: 12.h),
                          ),
                          child: Text(
                            isFromHomeScreen
                                ? AppStrings.accept
                                : AppStrings.sendProposal,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final String icon;
  const IconContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Stack(
          alignment: Alignment.center,
          children: [SvgPicture.asset(Assets.ellipse), SvgPicture.asset(icon)]),
    );
  }
}
