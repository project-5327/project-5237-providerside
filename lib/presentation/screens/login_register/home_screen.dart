import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/data/models/project_model.dart';
import 'package:project_5237_provider/desktop/projects/projects_screen.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/filter/filter.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';
import 'package:project_5237_provider/presentation/screens/update_Project/project_details.dart';
import 'package:project_5237_provider/presentation/widgets/discover_project_cont.dart';
import 'package:project_5237_provider/presentation/widgets/search_field.dart';
import 'package:project_5237_provider/provider/onboarding/project_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProjectProvider>(context, listen: false)
          .fetchAllProjects(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: const ProjectsScreen(),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Consumer<ProjectProvider>(
        builder: (context, projectProvider, child) {
      final projects = projectProvider.projectModel?.data?.projects ?? [];
      final filteredProjects = projectProvider.filteredProjects;

      debugPrint("Projects==========> $projects");

      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'App Name',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
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
          body: projectProvider.loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: MyColors.blue,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SearchField(
                            onTap: () async {
                              List<String>? selectedFilters =
                                  await Get.to(const FilterScreen());

                              if (selectedFilters != null &&
                                  selectedFilters.isNotEmpty) {
                                projectProvider
                                    .applySelectedFilters(selectedFilters);
                              }
                            },
                            controller: searchController,
                            onChanged: (value) {
                              projectProvider.filterProjects(value);
                            },
                          ),
                        ),
                        filteredProjects.isNotEmpty
                            ? SizedBox(
                                height: 610.h,
                                child: ListView.builder(
                                  itemCount: filteredProjects.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final project = filteredProjects[index];

                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProjectDetails(
                                              projectModel: project,
                                              title: "Project Details",
                                            ),
                                          ),
                                        );
                                      },
                                      child: DiscoverContainer1(
                                        tags: project.skillsRequired ?? [],
                                        tagsLength:
                                            project.skillsRequired!.length,
                                        // text1: project.description ??
                                        //     "Description",
                                        text2:
                                            "\$${project.budget?.min}-\$${project.budget?.max}",
                                        image: project.attachment ??
                                            "https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev/undefined/vasily-koloda-8CqDvPuo_kI-unsplash.jpg",
                                        text3: project.deadline ?? "deadline",
                                        username: '${project.title}',
                                        time: project.createdAt ??
                                            "2023-09-20 12:34:56",
                                        rate: "Budget",
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: Text(
                                  "No Project Found ",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: MyColors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                      ],
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
