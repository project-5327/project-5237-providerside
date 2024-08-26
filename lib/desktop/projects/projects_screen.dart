import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_5237_provider/desktop/projects/components/project_comp.dart';
import 'package:project_5237_provider/desktop/projects/project_detail_screen.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final List<String> categories = ['Category 1', 'Category 2'];
  @override
  Widget build(BuildContext context) {
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
              behavior: const ScrollBehavior().copyWith(scrollbars: false),
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              categories[index],
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black2),
                              ),
                            ),
                            Text(
                              "250 Result Found",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.blue),
                              ),
                            ),
                          ],
                        ),
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
                                    builder: (context) => ProjectDetailScreen(
                                      isFromHomeScreen: false,
                                    ),
                                  ),
                                );
                              },
                              child: const ProjectComp());
                        },
                      ),
                      const SizedBox(
                        height: 28,
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
