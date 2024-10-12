import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/Catagory1.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyColors.black,
            ),
          ),
          title: isSearching
              ? Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: SizedBox(
                    height: 50.h,
                    width: 277.w,
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(CupertinoIcons.search),
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: MyColors.lightGrey),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Messages',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSearching = true;
                        });
                      },
                      child: SvgPicture.asset(Assets.search),
                    )
                  ],
                ),
          actions: isSearching
              ? [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          isSearching = false;
                          searchController.clear();
                        });
                      },
                    ),
                  )
                ]
              : [],
        ),
        body: Column(
          children: [
            TabBar(
              dividerHeight: 0,
              indicator: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: MyColors.black,
                    width: 2.0,
                  ),
                ),
              ),
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Category 1',
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Category 2',
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.black),
                  ),
                ),
                Tab(
                  child: Text(
                    'Category 3',
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                        color: MyColors.black),
                  ),
                ),
              ],
              labelColor: Colors.black,
            ),
            SizedBox(height: 8.h),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [Catagory1(), Catagory1(), Catagory1()],
              ),
            ),
            //  CustomizeBottomNavigation()
          ],
        ),
      ),
    );
  }
}
