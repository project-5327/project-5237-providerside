import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';
import 'package:project_5237_provider/desktop/projects/components/project_comp.dart';
import 'package:project_5237_provider/desktop/projects/project_detail_screen.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';
import 'package:project_5237_provider/presentation/widgets/discover_project_cont.dart';
import 'package:project_5237_provider/presentation/widgets/search_field.dart';
import 'package:project_5237_provider/provider/home/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).proposalGetApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return responsive.isMobile || responsive.isTablet
        ? Consumer<HomeProvider>(
      builder: (context, homeprovider, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: InkWell(
                  onTap: () {
                    Get.to(const NotificationScreen());
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      SvgPicture.asset(Assets.bell),
                      SvgPicture.asset(Assets.dot),
                    ],
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discover Projects',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Switch(
                    value: _isSwitched,
                    onChanged: _toggleSwitch,
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchField(),
                    SizedBox(height: 27.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Proposal',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black2,
                          ),
                        ),
                        homeprovider.proposalDataDoc?.projects?.isEmpty ?? true
                            ? SizedBox.shrink()
                            : InkWell(
                          onTap: () {
                            // Handle 'See All' tap here
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: MyColors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    homeprovider.proposalDataDoc?.projects?.isEmpty ?? true
                        ? Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: Text(
                        "No Categories Found",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black,
                          ),
                        ),
                      ),
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: homeprovider.proposalDataDoc?.projects?.length,
                      itemBuilder: (context, index) {
                        DateTime createdAt = DateTime.parse(
                          homeprovider.proposalDataDoc?.projects?[index].createdAt ?? "",
                        );
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectDetailScreen(
                                      isFromHomeScreen: true,
                                      proposalListData: homeprovider.proposalDataDoc?.projects?[index] ?? ProposalListData(),
                                    ),
                                  ),
                                );
                              },
                              child: DiscoverContainer(
                                time: timeago.format(createdAt),
                                image: homeprovider.proposalDataDoc?.projects?[index].attachment ?? "",
                                username: homeprovider.proposalDataDoc?.projects?[index].clientId?.userName ?? "",
                                text1: homeprovider.proposalDataDoc?.projects?[index].title ?? "",
                                text2: "\$${homeprovider.proposalDataDoc?.projects?[index].budget?.min} - \$${homeprovider.proposalDataDoc?.projects?[index].budget?.max}",
                                text3: 'Location',
                                rate: 'Rate',
                              ),
                            ),
                            Divider(
                              color: MyColors.grey.withOpacity(0.4),
                              thickness: 1,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    )
        : Consumer<HomeProvider>(builder: (context, homeprovider, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 31.h),
              child: Column(
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
                            color: MyColors.black,
                          ),
                        ),
                      ),
                      SvgPicture.asset(Assets.filter),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.recentProposal,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black,
                          ),
                        ),
                      ),
                      Text(
                        AppStrings.seeAll,
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: MyColors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 35,
                      childAspectRatio: 3 / 2,
                      mainAxisExtent: 207,
                    ),
                    itemCount: homeprovider.proposalDataDoc?.projects?.length,
                    itemBuilder: (context, gridIndex) {
                      DateTime createdAt = DateTime.parse(
                        homeprovider.proposalDataDoc?.projects?[gridIndex].createdAt ?? "",
                      );
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectDetailScreen(
                                isFromHomeScreen: true,
                                proposalListData: homeprovider.proposalDataDoc?.projects?[gridIndex] ?? ProposalListData(),
                              ),
                            ),
                          );
                        },
                        child: ProjectComp(
                          time: timeago.format(createdAt),
                          image: homeprovider.proposalDataDoc?.projects?[gridIndex].attachment ?? "",
                          username: homeprovider.proposalDataDoc?.projects?[gridIndex].clientId?.userName ?? "",
                          text1: homeprovider.proposalDataDoc?.projects?[gridIndex].title ?? "",
                          text2: "\$${homeprovider.proposalDataDoc?.projects?[gridIndex].budget?.min} - \$${homeprovider.proposalDataDoc?.projects?[gridIndex].budget?.max}",
                          text3: 'Location',
                          rate: 'Rate',
                          skill: homeprovider.proposalDataDoc?.projects?[gridIndex].title != null
                              ? [homeprovider.proposalDataDoc?.projects?[gridIndex].title ?? ""]
                              : [],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
