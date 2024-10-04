import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/desktop/projects/projects_screen.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
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
            padding: const EdgeInsets.only(top: 15),
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
          title: Text(
            'App Name',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
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
                      const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SearchField(),
                      ),
                      SizedBox(
                        height: 750.h,
                        child: ListView.builder(
                            itemCount: projects?.projects?.length,
                            itemBuilder: (BuildContext context, int index) {
                              final project = projects?.projects?[index];

                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProjectDetails(
                                              projectModel: project,
                                              title: "Project Details")));
                                },
                                child: DiscoverContainer1(
                                  tags: project!.skillsRequired ?? [],
                                  tagsLength: project.skillsRequired!.length,
                                  text1: project.description ?? "Description",
                                  text2:
                                      "\$${project.budget?.min}-\$${project.budget?.max}",
                                  image:
                                      "https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev/undefined/vasily-koloda-8CqDvPuo_kI-unsplash.jpg",
                                  text3: project.deadline ?? "deadline",
                                  username: '${project.title}',
                                  time: project.createdAt ??
                                      "2023-09-20 12:34:56",
                                  rate: "Budget",
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ));
    });
  }
}
