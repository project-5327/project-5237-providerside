import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_5237_provider/presentation/screens/login_register/credit.dart';
import 'package:project_5237_provider/presentation/screens/login_register/message.dart';
import 'package:project_5237_provider/presentation/screens/milestones/milestone.dart';

import '../constants/assets.dart';
import '../constants/color.dart';
import 'login_register/home_screen.dart';
import 'login_register/EditProfile.dart';
import 'login_register/projetct_detals1.dart';
import 'my_contracts/map_screen.dart';
import 'my_contracts/my_project.dart';
import 'update_Project/chat_screen.dart';

class MainScreen extends StatefulWidget {
  final int selectedIndex;
  MainScreen({super.key, required this.selectedIndex});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const MilestoneScreen(),
    const MessageScreen(),
    DebitCredit(),
    Editprofile(),
    HomeProjectDetails(),
    DebitCredit(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
    super.initState();
  }

  final bottomNavKey = GlobalKey();

  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 65,
        key: bottomNavKey,
        color: MyColors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                bottomNavItem(
                  title: "",
                  icon: Assets.home,
                  isSelected: _selectedIndex == 0 ||
                      _selectedIndex == 5 ||
                      _selectedIndex == 6,
                  onTap: () {
                    if (_selectedIndex != 0) {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    }
                  },
                ),
                bottomNavItem(
                  title: "",
                  icon: Assets.person,
                  isSelected: _selectedIndex == 1,
                  onTap: () {
                    if (_selectedIndex != 1) {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    }
                  },
                ),
                bottomNavItem(
                  title: "",
                  icon: Assets.message,
                  isSelected: _selectedIndex == 2,
                  onTap: () {
                    if (_selectedIndex != 2) {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    }
                  },
                ),
                bottomNavItem(
                  title: "",
                  icon: Assets.wallet,
                  isSelected: _selectedIndex == 3,
                  onTap: () {
                    if (_selectedIndex != 3) {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    }
                  },
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/girl2.png',
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget bottomNavItem({
    required String title,
    required String icon,
    required bool isSelected,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected
              ? Container(
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    icon,
                    height: 27,
                    width: 27,
                    color: MyColors.black,
                  ),
                )
              : Container(
                  height: 45,
                  width: 45,
                  padding: EdgeInsets.all(10),
                  color: Colors.transparent,
                  child: SvgPicture.asset(
                    icon,
                    height: 25,
                    width: 25,
                    color: MyColors.grey.withOpacity(.5),
                  ),
                )
        ],
      ),
    );
  }

  Widget _buildIcon(String asset, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          asset,
          color: _selectedIndex == index
              ? MyColors.black
              : MyColors.black.withOpacity(0.5),
        ),
        if (_selectedIndex == index)
          Container(
            margin: EdgeInsets.only(top: 4.h),
            height: 2.h,
            width: 24.w,
            color: MyColors.black,
          ),
      ],
    );
  }

  Widget _buildProfileIcon(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/images/girl2.png',
            height: 24.h,
            width: 24.w,
            fit: BoxFit.cover,
          ),
        ),
        if (_selectedIndex == index)
          Container(
            margin: EdgeInsets.only(top: 4.h),
            height: 2.h,
            width: 24.w,
            color: MyColors.black,
          ),
      ],
    );
  }
}
