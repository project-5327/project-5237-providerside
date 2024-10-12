import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/receive.dart';

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
  TabController? _tabController;
  bool showSendDetails = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      tablet: _mobileView(context),
      desktop: _deskTopView(context),
    );
  }

  _mobileView(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainScreen()));
              },
              icon: Icon(Icons.arrow_back_ios)),
          //automaticallyImplyLeading: false,
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
                dividerHeight: 0,
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
                  Tab(child: Image.asset("assets/images/receive.png"))
                ],
                labelColor: Colors.black,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    HandshakeWidget(),
                    HandShakeTick(),
                    SendScreen(),
                    ReceivedProposal(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _deskTopView(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text(
            'My Contracts',
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: MyColors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.32,
              child: Column(
                children: [
                  //  _pages[currentIndex],
                  SizedBox(
                    height: 10.h,
                  ),

                  TabBar(
                    dividerHeight: 0,
                    indicator: BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          color: MyColors.btnColor, // Underline color
                          width: 2.w, // Underline thickness
                        ),
                      ),
                    ),
                    controller: _tabController,
                    tabs: [
                      Tab(child: SvgPicture.asset(Assets.handshake)),
                      Tab(child: SvgPicture.asset(Assets.handshake_tick)),
                      Tab(child: SvgPicture.asset(Assets.send)),
                      Tab(child: SvgPicture.asset(Assets.send))
                    ],
                    labelColor: Colors.black,
                  ),

                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        HandshakeWidget(),
                        HandShakeTick(),
                        SendScreen(),
                        ReceivedProposal(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
