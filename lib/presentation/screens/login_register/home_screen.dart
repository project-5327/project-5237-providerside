import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/desktop/projects/components/project_comp.dart';
import 'package:project_5237_provider/desktop/projects/project_detail_screen.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/discover_project_cont.dart';
import '../../widgets/search_field.dart';

import '../main_screen .dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSwitched = true;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return responsive.isMobile || responsive.isTablet
        ? SafeArea(
            child: Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {
                      Get.to(const NotificationScreen());
                    },
                    child: Stack(alignment: Alignment.topRight, children: [
                      SvgPicture.asset(Assets.bell),
                      SvgPicture.asset(Assets.dot)
                    ]),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discover Projects',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    Switch(
                      value: _isSwitched,
                      onChanged: _toggleSwitch,
                      activeColor: Colors.blue,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey[300],
                    )
                    //SvgPicture.asset(Assets.filter),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  _pages[currentIndex],
                      const SearchField(),
                      SizedBox(
                        height: 27.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent Proposal ',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black2),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                color: MyColors.blue),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => MainScreen()),
                          );
                        },
                        child: DiscoverContainer(
                            text1:
                                "Lorem Ipsum has been the industry's standard dummy text ever since the  1500s",
                            text2: '\$1000 - \$2000',
                            image: 'assets/images/image.jpeg',
                            text3: 'Location',
                            username: 'Jason Jones',
                            time: '5 hours agoo',
                            rate: 'Rate'),
                      ),
                      Divider(
                        color: MyColors.grey.withOpacity(0.4),
                        thickness: 1,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => MainScreen()),
                          );
                        },
                        child: DiscoverContainer(
                            text1:
                                "Lorem Ipsum has been the industry's standard dummy text ever since the  1500s",
                            text2: '\$1000 - \$2000',
                            image: 'assets/images/image.jpeg',
                            text3: 'Location',
                            username: 'Jason Jones',
                            time: '5 hours agoo',
                            rate: 'Budget'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 31.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.home,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: MyColors.black),
                          ),
                        ),
                        SvgPicture.asset(Assets.filter)
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.recentProposal,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black),
                          ),
                        ),
                        Text(
                          AppStrings.seeAll,
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: MyColors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 14,
                              crossAxisSpacing: 35,
                              childAspectRatio: 3 / 2,
                              mainAxisExtent: 207),
                      itemCount: 6,
                      itemBuilder: (context, gridIndex) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProjectDetailScreen(),
                                ),
                              );
                            },
                            child: const ProjectComp());
                      },
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
