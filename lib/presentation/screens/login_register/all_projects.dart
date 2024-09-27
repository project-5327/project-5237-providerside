import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/desktop/projects/projects_screen.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';

import 'package:project_5237_provider/presentation/widgets/discover_project_cont.dart';
import 'package:project_5237_provider/presentation/widgets/search_field.dart';
import 'package:project_5237_provider/provider/onboarding/project_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/assets.dart';

class AllProjects extends StatefulWidget {
  const AllProjects({super.key});

  @override
  State<AllProjects> createState() => _AllProjectsState();
}

class _AllProjectsState extends State<AllProjects> {
  final TextEditingController searchController = TextEditingController();
  bool _isSwitched = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProjectProvider>(context, listen: false)
          .fetchAllProjects(context);
    });
  }

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitched = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: _mobileView(context),
      desktop: ProjectsScreen(),
      tablet: _mobileView(context),
    );
  }

  _mobileView(BuildContext context) {
    return Consumer<ProjectProvider>(
        builder: (context, projectProvider, child) {
      final projects = projectProvider.projectmodel?.data;
      debugPrint("Projects==========> ${projects}");
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen())),
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
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
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
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  _pages[currentIndex],
                  SearchField(
                      //controller: searchController,
                      ),
                  SizedBox(
                    height: 27.h,
                  ),

                  SizedBox(
                    height: 750.h,
                    child: ListView.builder(
                        itemCount: projects?.projects?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final project = projects?.projects?[index];

                          return DiscoverContainer1(
                            tags: project!.skillsRequired ?? [],
                            tagsLength: project.skillsRequired!.length,
                            text1: project.description ?? "Description",
                            text2:
                                "\$${project.budget?.min}-\$${project.budget?.max}",
                            image:
                                "https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev/undefined/vasily-koloda-8CqDvPuo_kI-unsplash.jpg",
                            text3: project.deadline ?? "deadline",
                            username: '${project.title}',
                            time: project.createdAt ?? "2023-09-20 12:34:56",
                            rate: "Budget",
                          );
                        }),
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
