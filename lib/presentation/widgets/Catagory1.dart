import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';
import 'package:project_5237_provider/presentation/screens/update_Project/chat_screen.dart';

import '../constants/color.dart';
import '../screens/login_register/EditProfile.dart';

class Catagory1 extends StatelessWidget {
  const Catagory1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatScreen()));
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: CustomizeListTile(
                      image: 'assets/images/girl2.png',
                      title: 'Barbiana Liu',
                      subTitle: 'Thanks, Ajay! We look forward to it as...',
                      time: '5 mins ago'),
                ),
              );
            }),
      ),
    );
  }
}

class CustomizeListTile extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String time;
  const CustomizeListTile(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Image.asset(
            image,
            height: 48.h,
            width: 43.w,
            fit: BoxFit.cover,
          )),
      SizedBox(
        width: 10.w,
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.black),
                ),
                SizedBox(
                  width: 120.w,
                ),
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.black.withOpacity(0.4)),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              subTitle,
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.black),
            ),
          ]),
    ]);
  }
}
