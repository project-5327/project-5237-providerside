import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/desktop/myProject/myProfileScreen.dart';
import 'package:project_5237_provider/desktop/myProject/myProjectsScreens.dart';

import '../../presentation/constants/color.dart';
import '../../presentation/constants/strings.dart';

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      initialIndex: 1,
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'My Project',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: MyColors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              TabBar(
                isScrollable: true,
                labelColor: MyColors.btnColor,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: MyColors.btnColor,
                tabAlignment: TabAlignment.start,
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Text(
                      AppStrings.myProfile,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      AppStrings.myProjects,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    MyProfileScreen(),
                    MyProjectsScreen()
                    // PaymentsScreen()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
