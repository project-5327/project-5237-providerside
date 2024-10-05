import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/presentation/screens/login_register/EditProfile.dart';

import '../../constants/color.dart';
import '../../widgets/Catagory1.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
            'Your Notifications',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Today',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.grey),
                ),
                SizedBox(
                  height: 19.sp,
                ),
                InkWell(
                  onTap: () {
                    //Payment page
                    Get.to(() => const Editprofile());
                  },
                  child: const CustomizeListTile(
                      image: 'assets/images/girl1.png',
                      title: 'Jason Jones',
                      subTitle: 'Thanks, Ajay! We look forward to it as...',
                      time: '5 mins ago'),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const CustomizeListTile(
                    image: 'assets/images/girl2.png',
                    title: 'Barbiana Liu',
                    subTitle: 'Thanks, Ajay! We look forward to it as...',
                    time: '10 mins ago'),
                SizedBox(
                  height: 15.h,
                ),
                const CustomizeListTile(
                    image: 'assets/images/girl1.png',
                    title: 'Jason Jones',
                    subTitle: 'Thanks, Ajay! We look forward to it as...',
                    time: '23 mins ago'),
                SizedBox(
                  height: 15.h,
                ),
                const CustomizeListTile(
                    image: 'assets/images/girl2.png',
                    title: 'Barbiana Liu',
                    subTitle: 'Thanks, Ajay! We look forward to it as...',
                    time: '43 mins ago'),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Yesterday',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: MyColors.grey),
                ),
                SizedBox(
                  height: 17.h,
                ),
                const CustomizeListTile(
                    image: 'assets/images/girl1.png',
                    title: 'Jason Jones',
                    subTitle: 'Thanks, Ajay! We look forward to it as...',
                    time: '23 mins ago'),
                SizedBox(
                  height: 15.h,
                ),
                const CustomizeListTile(
                    image: 'assets/images/girl2.png',
                    title: 'Barbiana Liu',
                    subTitle: 'Thanks, Ajay! We look forward to it as...',
                    time: '43 mins ago'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
