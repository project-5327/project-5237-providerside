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
import 'my_contracts/map_screen.dart';
import 'my_contracts/my_project.dart';
import 'update_Project/chat_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

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
    Editprofile()
  ];

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
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: MyColors.white,
          elevation: 0,
          selectedItemColor: MyColors.black.withOpacity(0.1),
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Assets.home, 0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Assets.person, 1),
              label: '',
            ),
            // BottomNavigationBarItem(
            //   icon: _buildIcon(Assets.location, 2),
            //   label: '',
            // ),
            BottomNavigationBarItem(
              icon: _buildIcon(Assets.message, 2),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Assets.wallet, 3),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildProfileIcon(4),
              label: '',
            ),
          ],
        ),
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
