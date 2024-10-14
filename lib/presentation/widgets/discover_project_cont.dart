import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/map_screen.dart';
import '../constants/assets.dart';
import '../constants/color.dart';
import 'package:timeago/timeago.dart' as timeago;

class DiscoverContainer extends StatelessWidget {
  final String text1;
  final String username;
  final String time;
  final String image;
  final String rate;
  final String text2;
  final String text3;
  final String timerange;

  const DiscoverContainer({
    super.key,
    required this.text1,
    required this.text2,
    required this.image,
    required this.text3,
    required this.username,
    required this.time,
    required this.rate,
    required this.timerange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  height: 200.h,
      //width: 352.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.network(
                  image,
                  height: 35.h,
                  width: 35.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.grey,
                    );
                  },
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Container(
                //  margin: EdgeInsets.only(right: 8.w),
                width: 180.w,
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
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.0001,
              // ),
              Text(
                time,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.black.withOpacity(0.40)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              text1,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.black2),
            ),
          ),
          ListTile(
            title: Text(
              rate,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black),
            ),
            subtitle: Text(
              text2,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black),
            ),
            trailing: InkWell(
              onTap: () {
                Get.to(const MapScreen());
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Assets.location),
                  SizedBox(width: 4.w),
                  Text(
                    text3,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.blue),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 30.h,
            width: 270.w,
            decoration: BoxDecoration(
              color: MyColors.tagCont,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                child: Text(
                  formatDateTime(timerange),
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DiscoverContainer1 extends StatelessWidget {
//  final String text1;
  final String username;
  final String time;
  final String image;
  final String rate;
  final String text2;
  final List<String> tags;
  final int tagsLength;
  final String text3;

  const DiscoverContainer1({
    super.key,
    // required this.text1,
    required this.text2,
    required this.image,
    required this.text3,
    required this.username,
    required this.time,
    required this.rate,
    required this.tags,
    required this.tagsLength,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //   height: 220.h,
      width: 352.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.network(
                  image,
                  height: 35.h,
                  width: 35.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.grey,
                    );
                  },
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 8.w),
                width: 200.w,
                child: Text(
                  username,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.019,
              ),
              Text(
                timeago.format(DateTime.parse(time)),
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.black.withOpacity(0.40)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          // Text(
          //   text1,
          //   softWrap: true,
          //   style: TextStyle(
          //       fontSize: 13.sp,
          //       fontWeight: FontWeight.w500,
          //       color: MyColors.black1),
          // ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            rate,
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.black),
          ),
          Text(
            text2,
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            formatDateTime(text3),
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomizeTagContainer(tag: tags[index]),
                );
              },
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            color: MyColors.grey,
            thickness: 0.5,
          ),
          // SizedBox(
          //   height: 5.h,
          // ),
        ],
      ),
    );
  }
}

class CustomizeTagContainer extends StatelessWidget {
  final String tag;
  const CustomizeTagContainer({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      //  width: 100.w,
      decoration: BoxDecoration(
        color: MyColors.tagCont,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          child: Text(
            tag,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black),
          ),
        ),
      ),
    );
  }
}

String formatDateTime(String createdAt) {
  try {
    DateTime dateTime = DateTime.parse(createdAt);
    String day = DateFormat('EEEE').format(dateTime);
    String date = DateFormat('d MMMM').format(dateTime);
    String time = DateFormat('h:mm a').format(dateTime);
    return "$day, $date - $time";
  } catch (e) {
    return "";
  }
}
