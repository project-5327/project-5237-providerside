import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/contract_widgets.dart';

class MyProjectScreen extends StatefulWidget {
  const MyProjectScreen({super.key});

  @override
  State<MyProjectScreen> createState() => _MyProjectScreenState();
}

class _MyProjectScreenState extends State<MyProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyColors.black,
            ),
          ),
          title: Text(
            'My Projects',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //  _pages[currentIndex],
                SizedBox(height: 14.h),
                Center(
                  child: Container(
                    height: 47.h,
                    width: 336.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.search),
                        hintText: 'Search for projects',
                        hintStyle: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: MyColors.lightGrey),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                InkWell(
                  child: ProjectTile1(
                      image: Assets.bag,
                      title: 'Project 1',
                      title1: 'Joseph Aina',
                      subtitle: 'Monday, 5th January - 11:50pm',
                      tralingicon: Assets.message,
                      //$
                      tralingtext: '\$Rate',
                      btnText: 'Active',
                      btnColor: MyColors.skyBlue,
                      btntextColor: MyColors.black1,
                      image1: 'assets/images/girl2.png'),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  child: ProjectTile1(
                      image: Assets.bag,
                      title: 'Project 2',
                      title1: 'Tayo Israel',
                      subtitle: 'Monday, 5th January - 11:50pm',
                      tralingicon: Assets.message,
                      //$
                      tralingtext: '\$Rate',
                      btnText: 'Pending',
                      btnColor: MyColors.orange,
                      btntextColor: MyColors.black,
                      image1: 'assets/images/girl2.png'),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  child: ProjectTile1(
                      image: Assets.bag,
                      title: 'Project 3',
                      title1: 'Abiodun Taiwo',
                      subtitle: 'Monday, 5th January - 11:50pm',
                      tralingicon: Assets.message,
                      //$
                      tralingtext: '\$Rate',
                      btnText: 'Booked',
                      btntextColor: MyColors.black,
                      btnColor: MyColors.grey2,
                      image1: 'assets/images/girl2.png'),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ProjectTile1(
                    image: Assets.bag,
                    title: 'Project 4',
                    title1: 'Abiodun Taiwo',
                    subtitle: 'Monday, 5th January - 11:50pm',
                    tralingicon: Assets.message,
                    //$
                    tralingtext: '\$Rate',
                    btnText: 'Done',
                    btnColor: MyColors.green,
                    btntextColor: MyColors.white,
                    image1: 'assets/images/girl2.png'),
                SizedBox(
                  height: 20.h,
                ),
                ProjectTile1(
                    image: Assets.bag,
                    title: 'Project 5',
                    title1: 'Ismail Ojo',
                    subtitle: 'Monday, 5th January - 11:50pm',
                    tralingicon: Assets.message,
                    //$
                    tralingtext: '\$Rate',
                    btnText: 'Canceled',
                    btntextColor: MyColors.red,
                    btnColor: MyColors.lightred,
                    image1: 'assets/images/girl2.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
