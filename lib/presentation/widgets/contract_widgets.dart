import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color.dart';

class ProjectTile1 extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(height: 52.h, width: 52.w, child: SvgPicture.asset(image!)),
      SizedBox(
        width: 2.w,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
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
                  image1!,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(title1!,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.black1)),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                CupertinoIcons.chat_bubble_text,
                size: 18.sp,
              )
              //SvgPicture.asset(tralingicon!),
            ],
          ),
          Text(subtitle!,
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
          Text(tralingtext!,
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
                child: Text(btnText!,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: btntextColor)),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r), color: btnColor!),
          )
        ],
      )
    ]);
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

  final String? tralingtext;

  const ProjectTile2({
    super.key,
    this.image,
    this.image1,
    this.height,
    this.width,
    this.title,
    this.title1,
    this.subtitle,
    this.tralingtext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          height: 52.h,
          width: 52.w,
          child: SvgPicture.asset(
            image!,
            fit: BoxFit.cover,
          )),
      SizedBox(
        width: 10.w,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  height: 18.h,
                  width: 18.w,
                  image1!,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(title1!,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.black1)),
              SizedBox(
                width: 5.w,
              ),

              //SvgPicture.asset(tralingicon!),
            ],
          ),
          Text(subtitle!,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.lightGrey)),
        ],
      ),
      SizedBox(
        width: 23.w,
      ),
      Text(tralingtext!,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: MyColors.green)),
      SizedBox(
        height: 4.h,
      )
    ]);
  }
}
