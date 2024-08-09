import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/customize_button.dart';
import '../../widgets/discover_project_cont.dart';
import '../../widgets/project_detail_widget.dart';
import 'send_proposal.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 20.h,
                ),
                ListTile(
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
                  trailing: Stack(alignment: Alignment.topRight, children: [
                    Icon(
                      CupertinoIcons.bell,
                      color: MyColors.white,
                      size: 26,
                    ),
                    SvgPicture.asset(
                      Assets.dot,
                      height: 14.h,
                      width: 14.w,
                      fit: BoxFit.cover,
                    )
                  ]),
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
                    height: 23.h,
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
                  Text(
                    'Heading2',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.black),
                  ),
                  Text(
                    'Intermediate',
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

          Center(
              child: CustomizeButton(
            borderColor: MyColors.btnColor,
            radius: 100.r,
            text: 'Payment',
            height: 40.h,
            width: 334.w,
            color: MyColors.btnColor,
            textColor: MyColors.white,
            onTap: () {
              Get.to(() => SendProposalScreen());
            },
          )),
          SizedBox(
            height: 20.h,
          ),
          // )
        ],
      )),
    );
  }
}
