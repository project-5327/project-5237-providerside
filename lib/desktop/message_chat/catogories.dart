import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';

class Catagory3 extends StatelessWidget {
  const Catagory3({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      children: [
        const CustomizeListTile(
          image: 'assets/images/Ellipse 1.png',
          title: 'Jason Jones',
          subTitle: 'Thanks, Ajay! We look forward to it as...',
          time: '5 mins ago',
        ),
        SizedBox(height: 5.h),
        Divider(
          thickness: 0.5,
          color: MyColors.btnText,
        ),
        SizedBox(height: 5.h),
        const CustomizeListTile(
          image: 'assets/images/Ellipse 1.png',
          title: 'Anne Jones',
          subTitle: 'Thanks, Ajay! We look forward to it as...',
          time: '5 mins ago',
        ),
        SizedBox(height: 5.h),
        Divider(
          thickness: 0.5,
          color: MyColors.btnText,
        ),
        SizedBox(height: 5.h),
        const CustomizeListTile(
          image: 'assets/images/Ellipse 1.png',
          title: 'Jason Jones',
          subTitle: 'Thanks, Ajay! We look forward to it as...',
          time: '5 mins ago',
        ),
        SizedBox(height: 5.h),
        Divider(
          thickness: 0.5,
          color: MyColors.btnText,
        ),
        SizedBox(height: 5.h),
        const CustomizeListTile(
          image: 'assets/images/Ellipse 1.png',
          title: 'Anne Jones',
          subTitle: 'Thanks, Ajay! We look forward to it as...',
          time: '5 mins ago',
        ),
        const SizedBox(height: 5),
        Divider(
          thickness: 0.5,
          color: MyColors.btnText,
        ),
        SizedBox(height: 5.h),
        const CustomizeListTile(
          image: 'assets/images/wgirl1.png',
          title: 'Jason Jones',
          subTitle: 'Thanks, Ajay! We look forward to it as...',
          time: '5 mins ago',
        ),
      ],
    );
  }
}

class CustomizeListTile extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String time;

  const CustomizeListTile({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Image.asset(
            image,
            height: 60.h,
            width: 60.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
