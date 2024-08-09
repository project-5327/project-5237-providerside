import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';

import '../constants/color.dart';

class CustomizeBottomNavigation extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomizeBottomNavigation({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  State<CustomizeBottomNavigation> createState() =>
      _CustomizeBottomNavigationState();
}

class _CustomizeBottomNavigationState extends State<CustomizeBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget.onTap,
      currentIndex: widget.currentIndex,
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
    );
  }

  Widget _buildIcon(String asset, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          asset,
          color: widget.currentIndex == index
              ? MyColors.black
              : MyColors.black.withOpacity(0.5),
        ),
        if (widget.currentIndex == index)
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
        if (widget.currentIndex == index)
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
