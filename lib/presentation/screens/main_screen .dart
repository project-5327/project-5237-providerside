import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_5237_provider/presentation/screens/login_register/Add_projects.dart';
import 'package:project_5237_provider/presentation/screens/login_register/add_project1.dart';
import 'package:project_5237_provider/presentation/screens/login_register/booked.dart';
import 'package:project_5237_provider/presentation/screens/login_register/credit.dart';
import 'package:project_5237_provider/presentation/screens/login_register/message.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';
import 'package:project_5237_provider/presentation/screens/login_register/proposal.dart';
import 'package:project_5237_provider/presentation/screens/login_register/succesfully.dart';
import 'package:project_5237_provider/presentation/screens/message/change_password.dart';
import 'package:project_5237_provider/presentation/screens/message/forget_password.dart';
import 'package:project_5237_provider/presentation/screens/message/otp_screen.dart';
import 'package:project_5237_provider/presentation/screens/milestones/milestone.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/my_contacts.dart';
import 'package:project_5237_provider/presentation/screens/update_Project/chat_screen.dart';

import '../constants/assets.dart';
import '../constants/color.dart';
import 'login_register/home_screen.dart';
import 'login_register/EditProfile.dart';

class MainScreen extends StatefulWidget {
  int? selectedIndex;
  MainScreen({super.key, this.selectedIndex});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const MilestoneScreen(),
    const MessageScreen(),
    const ChatScreen(),
    const AddProjects(),

    // //0
    // const HomeProjectDetails(),
    // const ProposalScreen(),
    // const SuccesfullyScreen(),
    // const NotificationScreen(),

    // const BookedClient(),
    // const AddProjects(),
    // const AddProject1(),
    // const ForgetPasswordScreen(),
    // const OtpScreen(),
    // const ChangePassword(),
    // const MilestoneScreen(),
    // const MycontractScreen(),
    // //2
    // const ChatScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      // _selectedIndex = widget.selectedIndex!;
    });
    super.initState();
  }

  final bottomNavKey = GlobalKey();

  // @override
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _screens[widget.selectedIndex ?? 0],
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
                  isSelected: widget.selectedIndex == 0 ||
                      widget.selectedIndex == 5 ||
                      widget.selectedIndex == 6 ||
                      widget.selectedIndex == 7 ||
                      widget.selectedIndex == 8 ||
                      widget.selectedIndex == 9 ||
                      widget.selectedIndex == 10 ||
                      widget.selectedIndex == 11 ||
                      widget.selectedIndex == 12 ||
                      widget.selectedIndex == 13 ||
                      widget.selectedIndex == 14 ||
                      widget.selectedIndex == 15 ||
                      widget.selectedIndex == 16,
                  onTap: () {
                    if (widget.selectedIndex != 0) {
                      setState(() {
                        widget.selectedIndex = 0;
                      });
                    }
                  },
                ),
                bottomNavItem(
                  title: "",
                  icon: Assets.person,
                  isSelected: widget.selectedIndex == 1,
                  onTap: () {
                    if (widget.selectedIndex != 1) {
                      setState(() {
                        widget.selectedIndex = 1;
                      });
                    }
                  },
                ),
                bottomNavItem(
                  title: "",
                  icon: Assets.message,
                  isSelected:
                      widget.selectedIndex == 2 || widget.selectedIndex == 17,
                  onTap: () {
                    if (widget.selectedIndex != 2) {
                      setState(() {
                        widget.selectedIndex = 2;
                      });
                    }
                  },
                ),
                bottomNavItem(
                  title: "",
                  icon: Assets.wallet,
                  isSelected: widget.selectedIndex == 3,
                  onTap: () {
                    if (widget.selectedIndex != 3) {
                      setState(() {
                        widget.selectedIndex = 3;
                      });
                    }
                  },
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.selectedIndex != 4) {
                      setState(() {
                        widget.selectedIndex = 4;
                      });
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/girl2.png',
                      height: 24.h,
                      width: 24.w,
                      fit: BoxFit.cover,
                    ),
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
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.transparent,
                        blurRadius: 5.0,
                      )
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
                  padding: const EdgeInsets.all(10),
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
