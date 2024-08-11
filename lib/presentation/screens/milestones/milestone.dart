import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_5237_provider/presentation/screens/milestones/active_milestones.dart';
import 'package:project_5237_provider/presentation/screens/milestones/awaiting_milestones.dart';
import 'package:project_5237_provider/presentation/screens/milestones/payments.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../constants/color.dart';

class MilestoneScreen extends StatefulWidget {
  const MilestoneScreen({super.key});

  @override
  State<MilestoneScreen> createState() => _MilestoneScreenState();
}

class _MilestoneScreenState extends State<MilestoneScreen>
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Milestone',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: MyColors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              TabBar(
                indicator: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: BorderSide(
                      color: MyColors.btnColor,
                      width: 2.w,
                    ),
                  ),
                ),
                controller: _tabController,
                tabs: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Tab(
                        child: TextWidget(
                      text: 'Active Milestones',
                      color: MyColors.black,
                      size: 12.sp,
                      fontweight: FontWeight.w600,
                    )),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Tab(
                        child: TextWidget(
                      text: 'Awaiting Milestones',
                      color: MyColors.black,
                      size: 12.sp,
                      fontweight: FontWeight.w600,
                    )),
                  ),
                  Tab(
                      child: TextWidget(
                    text: 'Payments',
                    color: MyColors.black,
                    size: 12.sp,
                    fontweight: FontWeight.w600,
                  )),
                ],
                labelColor: Colors.black,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    ActiveMilestones(),
                    AwaitingMilestones(),
                    PaymentsScreen()
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
