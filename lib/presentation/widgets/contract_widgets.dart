import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/color.dart';
import '../screens/my_contracts/send_screen.dart';
import '../screens/update_Project/chat_screen.dart';

class ProjectTile1 extends StatefulWidget {
  final String? image;
  final String? image1;
  final double? height;
  final double? width;
  final String? title;
  final String? title1;
  final String? subtitle;
  final String? tralingicon;
  final String? tralingtext;
  final String? btnText;
  final Color? btnColor;
  final Color? btntextColor;

  const ProjectTile1(
      {super.key,
      this.image,
      this.image1,
      this.height,
      this.width,
      this.title,
      this.title1,
      this.subtitle,
      this.tralingicon,
      this.tralingtext,
      this.btnText,
      this.btnColor,
      this.btntextColor});

  @override
  _ProjectTile1State createState() => _ProjectTile1State();
}

class _ProjectTile1State extends State<ProjectTile1> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 360.w,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  height: 52.h,
                  width: 52.w,
                  child: SvgPicture.asset(widget.image!)),
              SizedBox(
                width: 2.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title!,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(
                          height: 18.h,
                          width: 18.w,
                          widget.image1!,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Text(widget.title1!,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: MyColors.black1)),
                      SizedBox(
                        width: 5.w,
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(ChatScreen());
                        },
                        icon: Icon(
                          CupertinoIcons.chat_bubble_text,
                          size: 18.sp,
                        ),
                      )
                    ],
                  ),
                  Text(widget.subtitle!,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.lightGrey)),
                ],
              ),
              SizedBox(
                width: 4.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.tralingtext!,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.green)),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    height: 24.h,
                    width: 67.w,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(widget.btnText!,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: widget.btntextColor)),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        color: widget.btnColor!),
                  )
                ],
              )
            ]),
          ),
          if (_isExpanded) ...[
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Lorem Ipsum has been the industry's standard \ndummy text ever since the 1500s",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.black),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Heading1",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black),
            ),
            Text(
              "Joseph Aina",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.black),
            ),
            SizedBox(
              height: 18.h,
            ),
            Text(
              "Heading2",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black),
            ),
            Text(
              "Monday, 5th January - 11:50pm",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.black),
            ),
            SizedBox(
              height: 15.h,
            ),
            const Divider(
              color: Color(0xffEAEEF0),
              height: 1,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: MyColors.black),
              softWrap: true,
            ),
            SizedBox(
              height: 20.h,
            ),
          ]
        ],
      ),
    );
  }
}

class ProjectTile2 extends StatelessWidget {
  final String? image;
  final String? image1;
  final double? height;
  final double? width;
  final String? title;
  final String? title1;
  final String? subtitle;
  final String? trailingText;
  final bool isExpanded;

  const ProjectTile2({
    super.key,
    this.image,
    this.image1,
    this.height,
    this.width,
    this.title,
    this.title1,
    this.subtitle,
    this.trailingText,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 52.h,
                width: 52.w,
                child: SvgPicture.asset(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.black,
                    ),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          image1!,
                          height: 18.h,
                          width: 18.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        title1!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.black1,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.lightGrey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                trailingText!,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.green,
                ),
              ),
            ],
          ),
          if (isExpanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                TextWidget(
                  text: 'Date & Time',
                  color: MyColors.black1,
                  size: 13.sp,
                  fontweight: FontWeight.w700,
                ),
                TextWidget(
                  text: '09/07/2024 & 11:30 AM',
                  color: Color(0xff555555),
                  size: 13.sp,
                  fontweight: FontWeight.w500,
                ),
                SizedBox(height: 10.h),
                TextWidget(
                  text: '\$Rate',
                  color: MyColors.black1,
                  size: 13.sp,
                  fontweight: FontWeight.w700,
                ),
                TextWidget(
                  text: '100',
                  color: Color(0xff555555),
                  size: 13.sp,
                  fontweight: FontWeight.w500,
                ),
                SizedBox(height: 10.h),
                TextWidget(
                  text: 'Address',
                  color: MyColors.black1,
                  size: 13.sp,
                  fontweight: FontWeight.w700,
                ),
                TextWidget(
                  text: 'Lorem Ipsum is simply dummy text',
                  color: Color(0xff555555),
                  size: 13.sp,
                  fontweight: FontWeight.w500,
                ),
                SizedBox(height: 10.h),
                TextWidget(
                  text: 'Attached Image',
                  color: MyColors.black1,
                  size: 13.sp,
                  fontweight: FontWeight.w700,
                ),
                SizedBox(height: 10.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [PdfContainer(), PdfContainer()],
                ),
                SizedBox(height: 10.h),
                TextWidget(
                  text: 'Description',
                  color: MyColors.black1,
                  size: 13.sp,
                  fontweight: FontWeight.w700,
                ),
                TextWidget(
                  text:
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  color: Color(0xff555555),
                  size: 13.sp,
                  fontweight: FontWeight.w500,
                ),
                SizedBox(height: 16.h),
                const Divider(
                  color: Color(0xffEAEEF0),
                  height: 1,
                ),
                SizedBox(height: 12.h),
              ],
            ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
