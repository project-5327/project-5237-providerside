import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';
import 'package:project_5237_provider/desktop/projects/components/project_comp.dart';
import 'package:project_5237_provider/desktop/projects/project_detail_screen.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/provider/home/home_provider.dart';
import 'package:project_5237_provider/provider/onboarding/project_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProjectProvider>(
      builder: (context, projectProvider, child) {
        final projects = projectProvider.projectmodel?.data;
        debugPrint("Projects==========> ${projects}");
        return Scaffold(
            body: Padding(
                padding: EdgeInsets.only(left: 33.w, right: 33.w, top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 34),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.projects,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: MyColors.black2),
                            ),
                          ),
                          SvgPicture.asset(Assets.filter)
                        ],
                      ),
                    ),
                    Expanded(
                        child: ScrollConfiguration(
                      behavior:
                          const ScrollBehavior().copyWith(scrollbars: false),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 14,
                                crossAxisSpacing: 35,
                                childAspectRatio: 3 / 2,
                                mainAxisExtent: 190),
                        itemCount: projects?.projects?.length,
                        itemBuilder: (context, gridIndex) {
                          final project = projects?.projects?[gridIndex];

                          DateTime createdAt =
                              DateTime.parse(project?.createdAt ?? "");
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProposalDetailScreen(
                                      isFromHomeScreen: false,
                                      proposalListData: ProposalListData(),
                                    ),
                                  ),
                                );
                              },
                              child: ProjectComp(
                                count: project?.skillsRequired?.length ?? 0,
                                time: timeago.format(createdAt,
                                    locale: 'en_short'),
                                image: project?.attachment ?? "",
                                username: project?.clientId?.userName ?? "",
                                text1: project?.title ?? "",
                                text2:
                                    "\$ ${project?.budget?.min} - \$ ${project?.budget?.max}",
                                text3: 'Location',
                                rate: 'Rate',
                                skill: project?.skillsRequired ??
                                    [], // Pass the entire list
                              ));
                        },
                      ),
                    ))
                  ],
                )));
      },
    );
  }
}
