import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_5237_provider/data/models/proposal_by_user.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';

import '../constants/color.dart';
import '../screens/my_contracts/send_screen.dart';
import '../screens/update_Project/chat_screen.dart';

class ProjectTile1 extends StatefulWidget {
  final Data proposal;
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
  final VoidCallback? onTap;
  final IconData? icon;

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
      this.btntextColor,
      required this.proposal,
      this.onTap,
      this.icon});

  @override
  _ProjectTile1State createState() => _ProjectTile1State();
}

class _ProjectTile1State extends State<ProjectTile1> {
  String formatDateTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    String day = DateFormat('EEEE').format(dateTime);
    String date = DateFormat('d MMMM').format(dateTime);
    String time = DateFormat('h:mm a').format(dateTime);
    return "$day, $date - $time";
  }

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return responsive.isMobile || responsive.isTablet
        ? GestureDetector(
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
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 45.h,
                            width: 45.w,
                            child: SvgPicture.asset(widget.image!)),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title!,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(widget.image1!,
                                      height: 18.h,
                                      width: 18.w,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.network(
                                                'https://th.bing.com/th/id/R.e5fe7d5b03fa11c16c80a7bddb63dc6c?rik=KPCJr8sgAungvw&riu=http%3a%2f%2fcdn.wallpapersafari.com%2f18%2f4%2ff6SdYa.jpg&ehk=cq1hCv1JtLpCF40gnczGRCHjMcMVlnCCGg7NKrGHhuc%3d&risl=&pid=ImgRaw&r=0',
                                                height: 18.h,
                                                width: 18.w,
                                                fit: BoxFit.cover,
                                              )),
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
                                    size: 18,
                                  ),
                                )
                              ],
                            ),
                            Text(formatDateTime(widget.subtitle!),
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.lightGrey)),
                          ],
                        ),
                        // SizedBox(
                        //   width: 10.w,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Column(
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
                                height: 28.h,
                                width: 85.w,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Text(widget.btnText!,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: _getButtonColors(
                                              widget.proposal.status ??
                                                  "")['textColor'],
                                        )),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.r),
                                  color: _getButtonColors(
                                      widget.proposal.status ??
                                          "")['buttonColor'],
                                  // widget.btnColor!
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
                if (_isExpanded) ...[
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    widget.proposal.projectId?.title ?? "",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: MyColors.black),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    "Name",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.black),
                  ),
                  Text(
                    '${widget.proposal.clientDetails?.firstName ?? ''} ${widget.proposal.clientDetails?.lastName ?? ''}',
                    style: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.black),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    "Date & Time",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.black),
                  ),
                  Text(
                    formatDateTime(widget.proposal.createdAt ??
                        "Monday, 5th January - 11:50pm"),
                    style: TextStyle(
                        fontFamily: "Lexend",
                        fontSize: 13.sp,
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
                    widget.proposal.projectId?.description ?? "",
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
                ],
                SizedBox(
                  height: 5.h,
                ),
                Divider(
                  thickness: 0.5,
                  color: MyColors.grey1,
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: MyColors.grey, width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        //  width: 360.w,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 52,
                                  width: 52,
                                  child: SvgPicture.asset(widget.image!)),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: MyColors.black),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        child: Image.network(
                                            height: 18,
                                            width: 18,
                                            widget.image1!,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Image.network(
                                                      'https://th.bing.com/th/id/R.e5fe7d5b03fa11c16c80a7bddb63dc6c?rik=KPCJr8sgAungvw&riu=http%3a%2f%2fcdn.wallpapersafari.com%2f18%2f4%2ff6SdYa.jpg&ehk=cq1hCv1JtLpCF40gnczGRCHjMcMVlnCCGg7NKrGHhuc%3d&risl=&pid=ImgRaw&r=0',
                                                      height: 18,
                                                      width: 18,
                                                      fit: BoxFit.cover,
                                                    )),
                                      ),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      Text(widget.title1!,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: MyColors.black1)),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Get.to(const ChatScreen());
                                        },
                                        icon: const Icon(
                                          CupertinoIcons.chat_bubble_text,
                                          size: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(formatDateTime(widget.subtitle!),
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: MyColors.lightGrey)),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.tralingtext!,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: MyColors.green)),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Container(
                                    height: 26.h,
                                    width: 67.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24.r),
                                      color: _getButtonColors(
                                              widget.proposal.status ?? "")[
                                          'buttonColor'], // Set the text color
                                      // widget.btnColor!
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(widget.btnText!,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: _getButtonColors(
                                                  widget.proposal.status ??
                                                      "")['textColor'],
                                            )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                ],
                              )
                            ]),
                      ),
                      if (_isExpanded) ...[
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          widget.proposal.projectId?.title ??
                              "Lorem Ipsum has been the industry's standard \ndummy text ever since the 1500s",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: MyColors.black),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black),
                        ),
                        Text(
                          '${widget.proposal.clientDetails?.firstName} ${widget.proposal.clientDetails?.lastName}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: MyColors.black),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          "Date & Time",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: MyColors.black),
                        ),
                        Text(
                          formatDateTime(widget.proposal.createdAt ??
                              "Monday, 5th January - 11:50pm"),
                          style: TextStyle(
                              fontSize: 14,
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
                          widget.proposal.projectId?.description ??
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
                      ],
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Map<String, Color> _getButtonColors(String status) {
    switch (status.toLowerCase()) {
      case 'rejected':
        return {
          'buttonColor': const Color(0xffFFB2B2),
          'textColor': MyColors.red
        };
      case 'reviewed':
        return {
          'buttonColor': const Color(0xffFFF2B2),
          'textColor': MyColors.black
        };
      case 'accepted':
        return {
          'buttonColor': const Color(0xff447604),
          'textColor': MyColors.white
        };
      case 'submitted':
        return {
          'buttonColor': const Color(0xffB2D6FF),
          'textColor': MyColors.black
        };
      default:
        return {
          'buttonColor': MyColors.btnColor.withOpacity(0.5),
          'textColor': MyColors.black // Default black text
        };
    }
  }
}

class ProjectTile2 extends StatefulWidget {
  final Data proposal;
  final String? image;
  final String? image1;
  final double? height;
  final double? width;
  final String? title;
  final String? title1;
  final String? subtitle;
  final String? trailingText;

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
    required this.proposal,
  });

  @override
  State<ProjectTile2> createState() => _ProjectTile2State();
}

class _ProjectTile2State extends State<ProjectTile2> {
  String formatDateTime(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    String day = DateFormat('EEEE').format(dateTime);
    String date = DateFormat('d MMMM').format(dateTime);
    String time = DateFormat('h:mm a').format(dateTime);
    return "$day, $date - $time";
  }

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return responsive.isMobile || responsive.isTablet
        ? GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: SizedBox(
              width: 360.w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 47.h,
                          width: 47.w,
                          child: SvgPicture.asset(
                            widget.image!,
                            // fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title!,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: MyColors.black,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(widget.image1!,
                                      height: 18.h,
                                      width: 18.w,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.network(
                                                'https://th.bing.com/th/id/R.e5fe7d5b03fa11c16c80a7bddb63dc6c?rik=KPCJr8sgAungvw&riu=http%3a%2f%2fcdn.wallpapersafari.com%2f18%2f4%2ff6SdYa.jpg&ehk=cq1hCv1JtLpCF40gnczGRCHjMcMVlnCCGg7NKrGHhuc%3d&risl=&pid=ImgRaw&r=0',
                                                height: 18,
                                                width: 18,
                                                fit: BoxFit.cover,
                                              )),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  widget.title1!,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.black1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              formatDateTime(widget.subtitle!),
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: MyColors.lightGrey,
                              ),
                            ),
                            SizedBox(height: 5.h),
                          ],
                        ),
                        const Spacer(),
                        _isExpanded
                            ? Text("")
                            : Text(
                                widget.trailingText!,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: MyColors.green,
                                ),
                              ),
                      ],
                    ),
                    if (_isExpanded) ...[
                      SizedBox(height: 10.h),
                      TextWidget(
                        text: 'Date & Time',
                        color: MyColors.black1,
                        size: 13.sp,
                        fontweight: FontWeight.w700,
                      ),
                      Text(
                        formatDateTime(widget.proposal.createdAt ?? ''),
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff555555),
                        ),
                      ),

                      SizedBox(height: 10.h),
                      TextWidget(
                        text: 'Rate',
                        color: MyColors.black1,
                        size: 13.sp,
                        fontweight: FontWeight.w700,
                      ),
                      TextWidget(
                        text:
                            '\$${(widget.proposal.proposedBudget?.numberDecimal)}',
                        color: const Color(0xff555555),
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
                        text: '${(widget.proposal.address)}',
                        color: const Color(0xff555555),
                        size: 13.sp,
                        fontweight: FontWeight.w500,
                      ),
                      SizedBox(height: 10.h),
                      // TextWidget(
                      //   text: 'Address',
                      //   color: MyColors.black1,
                      //   size: 13.sp,
                      //   fontweight: FontWeight.w700,
                      // ),
                      // TextWidget(
                      //   text: 'Lorem Ipsum is simply dummy text',
                      //   color: Color(0xff555555),
                      //   size: 13.sp,
                      //   fontweight: FontWeight.w500,
                      // ),
                      // SizedBox(height: 10.h),
                      TextWidget(
                        text: 'Attached Image',
                        color: MyColors.black1,
                        size: 13.sp,
                        fontweight: FontWeight.w700,
                      ),
                      SizedBox(height: 10.h),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PdfContainer(
                            fileName: 'Image.pdf',
                            fileSize: '532 kb',
                          ),
                          PdfContainer(
                            fileName: 'Image.pdf',
                            fileSize: '532 kb',
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      TextWidget(
                        text: 'Description',
                        color: MyColors.black1,
                        size: 13.sp,
                        fontweight: FontWeight.w700,
                      ),
                      TextWidget(
                        text: widget.proposal.projectId?.description ??
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        color: const Color(0xff555555),
                        size: 13.sp,
                        fontweight: FontWeight.w500,
                      ),

                      SizedBox(
                        height: 5.h,
                      ),
                      Divider(
                        thickness: 0.5,
                        color: MyColors.grey,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ]),
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                // width: 360.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: MyColors.grey, width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 52,
                              width: 52,
                              child: SvgPicture.asset(
                                widget.image!,
                                // fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        widget.image1!,
                                        height: 18,
                                        width: 18,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      widget.title1!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: MyColors.black1,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  formatDateTime(widget.subtitle!),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.lightGrey,
                                  ),
                                ),
                                const SizedBox(height: 5),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              widget.trailingText!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: MyColors.green,
                              ),
                            ),
                          ],
                        ),
                        if (_isExpanded) ...[
                          const SizedBox(height: 10),
                          TextWidget(
                            text: 'Date & Time',
                            color: MyColors.black1,
                            size: 13,
                            fontweight: FontWeight.w700,
                          ),
                          Text(
                            formatDateTime(widget.proposal.createdAt ??
                                '09/07/2024 & 11:30 AM'),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff555555),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextWidget(
                            text: '\$Rate',
                            color: MyColors.black1,
                            size: 13,
                            fontweight: FontWeight.w700,
                          ),
                          TextWidget(
                            text:
                                '\$${widget.proposal.proposedBudget?.numberDecimal}',
                            color: const Color(0xff555555),
                            size: 13,
                            fontweight: FontWeight.w500,
                          ),
                          const SizedBox(height: 10),
                          TextWidget(
                            text: 'Attached Image',
                            color: MyColors.black1,
                            size: 13,
                            fontweight: FontWeight.w700,
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              PdfContainer(
                                fileName: '',
                                fileSize: '',
                              ),
                              PdfContainer(
                                fileName: '',
                                fileSize: '',
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          TextWidget(
                            text: 'Description',
                            color: MyColors.black1,
                            size: 13,
                            fontweight: FontWeight.w700,
                          ),
                          TextWidget(
                            text: widget.proposal.projectId?.description ??
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            color: const Color(0xff555555),
                            size: 13,
                            fontweight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ]),
                ),
              ),
            ));
  }
}
