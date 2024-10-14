import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';
import 'package:project_5237_provider/desktop/projects/components/project_comp.dart';
import 'package:project_5237_provider/desktop/projects/project_detail_screen.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/filter/filter.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';

import 'package:project_5237_provider/presentation/widgets/discover_project_cont.dart';
import 'package:project_5237_provider/presentation/widgets/search_field.dart';
import 'package:project_5237_provider/provider/home/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../constants/assets.dart';

class RecentProposal extends StatefulWidget {
  const RecentProposal({super.key});

  @override
  State<RecentProposal> createState() => _RecentProposalState();
}

class _RecentProposalState extends State<RecentProposal> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).proposalGetApi();
      _focusNode.addListener(() {
        setState(() {
          _isFocused = _focusNode.hasFocus;
        });
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return responsive.isMobile || responsive.isTablet
        ? Consumer<HomeProvider>(builder: (context, homeProvider, child) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Recent Proposal',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 15),
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
                  ],
                ),
                body: homeProvider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: MyColors.blue,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SearchField(
                                  onTap: () async {
                                    List<String>? selectedFilters =
                                        await Get.to(const FilterScreen());

                                    if (selectedFilters != null &&
                                        selectedFilters.isNotEmpty) {
                                      homeProvider.applySelectedFilters(
                                          selectedFilters);
                                    }
                                  },
                                  controller: searchController,
                                  onChanged: (value) {
                                    homeProvider.filterProposals(value);
                                  },
                                ),
                              ),
                              SizedBox(height: 20.h),
                              homeProvider.filteredProposals?.isEmpty ?? true
                                  ? Container(
                                      alignment: Alignment.center,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.14,
                                      child: Text(
                                        "No Proposals Found",
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: MyColors.black,
                                          ),
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: homeProvider
                                          .filteredProposals?.length,
                                      itemBuilder: (context, index) {
                                        final project = homeProvider
                                            .filteredProposals?[index];
                                        DateTime createdAt = DateTime.parse(
                                          project?.createdAt ?? "",
                                        );
                                        return Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                //     Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             ProposalDetailScreen(
                                                //           isFromHomeScreen: true,
                                                //           proposalListData:
                                                //               project ??
                                                //                   ProposalListData(),
                                                //         ),
                                                //       ),
                                                //     );
                                                //   },
                                                final result =
                                                    await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProposalDetailScreen(
                                                      isFromHomeScreen: true,
                                                      proposalListData:
                                                          project ??
                                                              ProposalListData(),
                                                    ),
                                                  ),
                                                );

                                                // If the proposal was accepted or rejected, remove it locally
                                                if (result == 'accepted' ||
                                                    result == 'rejected') {
                                                  homeProvider.removeProposal(
                                                      project?.sId ?? "");
                                                }
                                              },
                                              child: DiscoverContainer(
                                                timerange:
                                                    project?.deadline ?? "",
                                                time: timeago.format(createdAt),
                                                image:
                                                    project?.attachment ?? "",
                                                username: project
                                                        ?.clientId?.userName ??
                                                    "",
                                                text1: project?.title ?? "",
                                                text2:
                                                    "\$${project?.budget?.min} - \$${project?.budget?.max}",
                                                text3: "Location",
                                                rate: 'Rate',
                                              ),
                                            ),
                                            Divider(
                                              color: MyColors.grey
                                                  .withOpacity(0.4),
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
          })
        : Consumer<HomeProvider>(builder: (context, homeprovider, child) {
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 33.w, vertical: 31.h),
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 35,
                            childAspectRatio: 3 / 2,
                            mainAxisExtent: 180,
                          ),
                          itemCount:
                              homeprovider.proposalDataDoc?.projects?.length ??
                                  0,
                          itemBuilder: (context, gridIndex) {
                            // Debugging: Check the length of the projects list
                            print(
                                "Projects length: ${homeprovider.proposalDataDoc?.projects?.length}");
                            print("Accessing index: $gridIndex");

                            // Check if projects is null or if the index is out of bounds
                            if (homeprovider.proposalDataDoc?.projects ==
                                    null ||
                                gridIndex < 0 ||
                                gridIndex >=
                                    homeprovider
                                        .proposalDataDoc!.projects!.length) {
                              print(
                                  "Returning empty container for index: $gridIndex");
                              return Container(); // Placeholder for empty item
                            }

                            var project = homeprovider
                                .proposalDataDoc!.projects![gridIndex];

                            // Safeguard for missing or null budget data
                            String budgetText = (project.budget?.min != null &&
                                    project.budget?.max != null)
                                ? "\$${project.budget?.min} - \$${project.budget?.max}"
                                : "No budget info";

                            // Safeguard for clientId and username
                            String username =
                                project.clientId?.userName ?? "Unknown";

                            // Ensure createdAt is properly formatted
                            DateTime createdAt =
                                DateTime.tryParse(project.createdAt ?? "") ??
                                    DateTime.now();

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProposalDetailScreen(
                                      isFromHomeScreen: true,
                                      proposalListData: project,
                                    ),
                                  ),
                                );
                              },
                              child: ProjectComp(
                                  count: project.skillsRequired?.length ?? 0,
                                  time: timeago.format(createdAt),
                                  image: project.attachment ??
                                      "", // Check if attachment is null
                                  username: username,
                                  text1: project.title ?? "No title",
                                  text2: budgetText,
                                  text3:
                                      'Location', // Hardcoded for now; can modify if needed
                                  rate:
                                      'Rate', // Also hardcoded; modify as needed
                                  skill: project.skillsRequired ?? []),
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
