import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Messages',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SvgPicture.asset(Assets.search)
          ],
        ),
      ),
      body: Column(
        children: [
          TabBar(
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
    );
  }
}
