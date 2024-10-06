import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';
import 'package:project_5237_provider/desktop/home/AcceptProposalScreen.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/map_screen.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';
import 'package:project_5237_provider/presentation/widgets/discover_project_cont.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProposalDetailScreen extends StatelessWidget {
  final bool isFromHomeScreen;
  final ProposalListData proposalListData;
  const ProposalDetailScreen(
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
                                'Proposal Details',
                                style: TextStyle(
                                    color: MyColors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  Get.to(const NotificationScreen());
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
                                width: 67.w,
                                height: 71.h,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset('assets/images/image.jpeg',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              proposalListData.clientId?.userName ?? "",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.white),
                            ),
                            Text(
                              //  "",
                              timeago.format(
                                createdAt,
                              ),
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
                                proposalListData.title ?? "",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.black2),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Text(
                                'Budget',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.black2),
                              ),
                              Text(
                                '\$${proposalListData.budget?.min} - \$${proposalListData.budget?.max}',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black2),
                              ),
                              SizedBox(
                                height: 18.h,
                              ),
                              Text(
                                'Time Range',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.black),
                              ),
                              Row(
                                children: [
                                  Text(
                                    proposalListData.timelineType ?? "medium",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.black),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => Get.to(const MapScreen()),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(Assets.location),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "Location",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: MyColors.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                                proposalListData.description ?? "",
                              ),
                              SizedBox(
                                height: 26.h,
                              ),
                              Row(
                                  children: List.generate(
                                proposalListData.skillsRequired?.length ?? 0,
                                (index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 12.w),
                                    child: CustomizeTagContainer(
                                      tag: proposalListData
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
                              _showDialogBox(
                                  context,
                                  "Do you want to reject this proposal?",
                                  "Yes",
                                  "No");
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

  void _showDialogBox(
    BuildContext context,
    String text,
    //String text1,
    String btntext1,
    String btntext2,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(
                child: TextWidget(
                  text: 'Are you Sure?',
                  color: MyColors.btnColor,
                  size: 20.sp,
                  fontweight: FontWeight.w700,
                ),
              ),
              content: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextWidget(
                  text: text,
                  color: MyColors.black,
                  size: 12.sp,
                  fontweight: FontWeight.w500,
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: MyColors.btnColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: MyColors.btnColor),
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                      child: TextWidget(
                        text: btntext1,
                        color: MyColors.white,
                        size: 12.sp,
                        fontweight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: MyColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: MyColors.btnColor),
                            borderRadius: BorderRadius.circular(100),
                          )),
                      onPressed: () {
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextWidget(
                          text: btntext2,
                          color: MyColors.black,
                          size: 12.sp,
                          fontweight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ]);
        });
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
