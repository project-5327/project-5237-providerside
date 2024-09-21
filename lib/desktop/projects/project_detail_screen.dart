import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';
import 'package:project_5237_provider/desktop/home/AcceptProposalScreen.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';
import 'package:project_5237_provider/presentation/widgets/discover_project_cont.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProjectDetailScreen extends StatelessWidget {
  final bool isFromHomeScreen;
  final ProposalListData proposalListData;

  const ProjectDetailScreen(
      {super.key,
      required this.isFromHomeScreen,
      required this.proposalListData});
  @override
  Widget build(BuildContext context) {
    DateTime createdAt = DateTime.parse(proposalListData.createdAt ?? "");
    final responsive = ResponsiveCheck(context);
    return responsive.isMobile || responsive.isTablet
        ? Builder(builder: (context) {
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 276.h,
                        decoration: BoxDecoration(color: MyColors.blue),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 14.h,
                            ),
                            ListTile(
                              leading: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: MyColors.white,
                                ),
                              ),
                              title: Text(
                                'Projects Details',
                                style: TextStyle(
                                    color: MyColors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  Get.to(NotificationScreen());
                                },
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Icon(
                                        CupertinoIcons.bell,
                                        color: MyColors.white,
                                      ),
                                      SvgPicture.asset(Assets.dot)
                                    ]),
                              ),

                              //SvgPicture.asset(Assets.bell),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: Container(
                                width: 71.h,
                                height: 71.w,
                                child: Image.asset('assets/images/image.jpeg',
                                    fit: BoxFit.cover),
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                                proposalListData.clientId?.userName ??
                              "",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.white),
                            ),
                            Text(
                              "",
                              // timeago.format(
                              //   createdAt,
                              // ),
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.white),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
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
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 33.h,
                              ),
                              Text(
                                proposalListData.title ??
                                "",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.black2),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Text(
                                'Budget',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black),
                              ),
                              Text(
                               '\$${proposalListData.budget?.min} - \$${proposalListData.budget?.max}',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Text(
                                'Time Range',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black),
                              ),
                              Text(
                                proposalListData.timelineType ?? "",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black),
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              const Divider(
                                color: Color(0xffEAEEF0),
                                height: 1,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Text(
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.black),
                                softWrap: true,
                                 proposalListData.description ??
                                "",
                              ),
                              SizedBox(
                                height: 26.h,
                              ),
                              Row(
                                  children: List.generate(
                                3,
                                (index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 12.w),
                                    child: CustomizeTagContainer(
                                      tag:
                                           proposalListData
                                                 .skillsRequired?[index] ??
                                          "",
                                    ),
                                  );
                                },
                              )),
                              SizedBox(
                                height: 24.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomizeButton(
                            text: 'Accept',
                            height: 40.h,
                            width: 154.w,
                            color: MyColors.btnColor,
                            textColor: MyColors.white,
                            borderColor: MyColors.btnColor,
                            radius: 100.r,
                            onTap: () {
                              Get.to(() => AcceptProposalScreen(
                                    proposalListData: proposalListData,
                                  ));
                            },
                          ),
                          CustomizeButton(
                            text: 'Reject',
                            radius: 100.r,
                            height: 40.h,
                            width: 154.w,
                            color: MyColors.btnColor,
                            textColor: MyColors.white,
                            borderColor: MyColors.btnColor,
                            onTap: () {
                              //  Get.to(() => SendProposalScreen());
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
              ),
            );
          })
        : Scaffold(
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
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                          ),
                          padding: EdgeInsets.only(
                              left: 47.w, top: 30.h, right: 52.w, bottom: 15.h),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 60.r,
                                    backgroundImage: NetworkImage(
                                      proposalListData.attachment ??
                                          "", // Placeholder image
                                    ),
                                  ),
                                  SizedBox(width: 32.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        proposalListData.clientId?.userName ??
                                            "",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500,
                                              color: MyColors.white),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        timeago.format(
                                          createdAt,
                                        ),
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            color: MyColors.white
                                                .withOpacity(0.60),
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
                          padding: EdgeInsets.only(
                              left: 48.w, top: 39.h, right: 62.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                proposalListData.title ?? "",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.black),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Budget',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.black),
                                ),
                              ),
                              Text(
                                '\$${proposalListData.budget?.min} - \$${proposalListData.budget?.max}',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.black),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Time Range',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.black),
                                ),
                              ),
                              Text(
                                proposalListData.timelineType ?? "",
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
                                proposalListData.description ?? "",
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
                                          borderRadius:
                                              BorderRadius.circular(12.r)),
                                      child: Text(
                                        proposalListData
                                                .skillsRequired?[index] ??
                                            "",
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
                          padding: EdgeInsets.only(
                              right: 62.w, bottom: 24.h, top: 28.h),
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
                                  Get.to(() => AcceptProposalScreen(
                                        proposalListData: proposalListData,
                                      ));
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
