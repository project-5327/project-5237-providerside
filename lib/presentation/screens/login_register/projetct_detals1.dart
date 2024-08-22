import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/login_register/credit.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';
import 'package:project_5237_provider/presentation/screens/login_register/proposal.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/map_screen.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/customize_button.dart';
import '../../widgets/discover_project_cont.dart';
import '../../widgets/project_detail_widget.dart';
import '../filter/filter.dart';
import '../main_screen .dart';
import 'message.dart';

class HomeProjectDetails extends StatefulWidget {
  const HomeProjectDetails({super.key});

  @override
  State<HomeProjectDetails> createState() => _HomeProjectDetailsState();
}

class _HomeProjectDetailsState extends State<HomeProjectDetails> {
  @override
  Widget build(BuildContext context) {
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
                      onTap: () => Get.back(),
                      leading: Icon(
                        Icons.arrow_back_ios,
                        color: MyColors.white,
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
                        child: Stack(alignment: Alignment.topRight, children: [
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
                        decoration: BoxDecoration(shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Jason Jones',
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.white),
                    ),
                    Text(
                      '5 hours agoo',
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
                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black2),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Text(
                        'Heading1',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black),
                      ),
                      Text(
                        '\$1,000 - \$2,000',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      ListTile(
                        title: Text(
                          'Heading2',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black),
                        ),
                        subtitle: Text(
                          'Intermediate',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black),
                        ),
                        trailing: InkWell(
                          onTap: () => Get.to(MapScreen()),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(Assets.location),
                              SizedBox(width: 4.w),
                              Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // ),
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
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"),
                      SizedBox(
                        height: 26.h,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomizeTagContainer(tag: 'Tag 1'),
                          CustomizeTagContainer(tag: 'Tag 2'),
                          CustomizeTagContainer(tag: 'Tag 3')
                        ],
                      ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => MainScreen(selectedIndex: 6)),
                      );
                    },
                  ),
                  SizedBox(
                    width: 14.w,
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
                      Get.to(() => ProposalScreen());
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
  }
}
