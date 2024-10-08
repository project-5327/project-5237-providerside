import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/discover_project_cont.dart';
import '../../widgets/search_field.dart';
import '../login_register/Add_projects.dart';

class DiscoverProjects extends StatefulWidget {
  final String rate1 = '1000';
  final String rate2 = '2000';
  const DiscoverProjects({super.key});

  @override
  State<DiscoverProjects> createState() => _DiscoverProjectsState();
}

class _DiscoverProjectsState extends State<DiscoverProjects> {
  bool _isSwitched = true;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(alignment: Alignment.topRight, children: [
              SvgPicture.asset(Assets.bell),
              SvgPicture.asset(Assets.dot)
            ]),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discover Projects',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Switch(
                value: _isSwitched,
                onChanged: _toggleSwitch,
                activeColor: Colors.blue,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              )
              //SvgPicture.asset(Assets.filter),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  _pages[currentIndex],
                SearchField(
                  onTap: () {},
                ),
                SizedBox(
                  height: 27.h,
                ),
                Text(
                  'Category 1',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.black2),
                ),
                Text(
                  '250 Result Found',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: MyColors.blue),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    Get.to(const AddProjects());
                  },
                  child: const DiscoverContainer(
                      text1:
                          "Lorem Ipsum has been the industry's standard dummy text ever since the  1500s",
                      text2: '1000 - 2000',
                      image: 'assets/images/image.jpeg',
                      text3: 'Location',
                      username: 'Jason Jones',
                      time: '5 hours agoo',
                      timerange: "range",
                      rate: 'Rate'),
                ),
                const DiscoverContainer(
                    timerange: "range",
                    text1:
                        "Lorem Ipsum has been the industry's standard dummy text ever since the  1500s",
                    text2: '1000 - 2000',
                    image: 'assets/images/image.jpeg',
                    text3: 'Location',
                    username: 'Jason Jones',
                    time: '5 hours agoo',
                    rate: 'Budget'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
