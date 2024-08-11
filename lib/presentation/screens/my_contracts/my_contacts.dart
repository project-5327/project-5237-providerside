import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';

import 'handshake.dart';
import 'handshake_tick.dart';
import 'send_screen.dart';

class MycontractScreen extends StatefulWidget {
  const MycontractScreen({super.key});

  @override
  State<MycontractScreen> createState() => _MycontractScreenState();
}

class _MycontractScreenState extends State<MycontractScreen>
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
            'My Contracts',
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
                  Tab(child: SvgPicture.asset(Assets.handshake)),
                  Tab(child: SvgPicture.asset(Assets.handshake_tick)),
                  Tab(child: SvgPicture.asset(Assets.send)),
                ],
                labelColor: Colors.black,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    HandshakeWidget(),
                    HandShakeTick(),
                    SendDetails()
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
