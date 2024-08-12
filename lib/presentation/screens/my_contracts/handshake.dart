import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/contract_widgets.dart';

class HandshakeWidget extends StatelessWidget {
  const HandshakeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          ProjectTile1(
            image: Assets.bag,
            title: 'Project 1',
            title1: 'Abiodun Taiwo',
            subtitle: 'Monday, 5th January - 11:50pm',
            tralingicon: Assets.message,
            tralingtext: '\$Rate',
            btnText: 'Booked',
            btnColor: MyColors.grey2,
            btntextColor: MyColors.black1,
            image1: 'assets/images/girl2.png',
          ),

          SizedBox(
            height: 16.h,
          ),
          // Text(
          //   "Lorem Ipsum has been the industry's standard \ndummy text ever since the 1500s",
          //   style: TextStyle(
          //       fontSize: 12.sp,
          //       fontWeight: FontWeight.w600,
          //       color: MyColors.black),
          // ),
          // SizedBox(
          //   height: 18.h,
          // ),
          // Text(
          //   "Heading1",
          //   style: TextStyle(
          //       fontSize: 12.sp,
          //       fontWeight: FontWeight.w500,
          //       color: MyColors.black),
          // ),
          // Text(
          //   "Joseph Aina",
          //   style: TextStyle(
          //       fontSize: 14.sp,
          //       fontWeight: FontWeight.w400,
          //       color: MyColors.black),
          // ),
          // SizedBox(
          //   height: 18.h,
          // ),
          // Text(
          //   "Heading2",
          //   style: TextStyle(
          //       fontSize: 12.sp,
          //       fontWeight: FontWeight.w500,
          //       color: MyColors.black),
          // ),
          // Text(
          //   "Monday, 5th January - 11:50pm",
          //   style: TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //       color: MyColors.black),
          // ),
          // SizedBox(
          //   height: 15.h,
          // ),
          // const Divider(
          //   color: Color(0xffEAEEF0),
          //   height: 1,
          // ),
          // SizedBox(
          //   height: 15.h,
          // ),
          // Text(
          //     textAlign: TextAlign.justify,
          //     style: TextStyle(
          //         fontSize: 12,
          //         fontWeight: FontWeight.w400,
          //         color: MyColors.black),
          //     softWrap: true,
          //     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"),
          // SizedBox(
          //   height: 20.h,
          // ),
          ProjectTile1(
            btntextColor: MyColors.black,
            image: Assets.bag,
            title: 'Project 1',
            title1: 'Joseph Aina',
            subtitle: 'Monday, 5th January - 11:50pm',
            tralingicon: Assets.message,
            image1: 'assets/images/girl2.png',
            tralingtext: '\$Rate',
            btnText: 'Pending',
            btnColor: MyColors.orange,
          ),
        ],
      ),
    );
  }
}
