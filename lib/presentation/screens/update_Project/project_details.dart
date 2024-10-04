import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/data/models/project_model.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/login_register/notification.dart';
import 'package:project_5237_provider/presentation/screens/login_register/proposal_send_new.dart.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../widgets/customize_button.dart';
import '../../widgets/discover_project_cont.dart';
import '../../widgets/project_detail_widget.dart';
import 'send_proposal.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProjectDetails extends StatefulWidget {
  final Projects? projectModel;
  final String title;
  const ProjectDetails(
      {super.key, required this.projectModel, required this.title});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    final projects = widget.projectModel;

    debugPrint("project details=========> $projects");
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: CustomizeButton(
                text: 'Send proposal',
                radius: 100.r,
                height: 40.h,
                // width: 154.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                borderColor: MyColors.btnColor,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProposalSendScreen(
                                projects: projects,
                              )));
                },
              ),
            ),
            body: SingleChildScrollView(
                child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 276.h,
                decoration: BoxDecoration(color: MyColors.blue),
                child: Column(
                  children: [
                    SizedBox(
                      height: 14.h,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      leading: Icon(
                        Icons.arrow_back_ios,
                        color: MyColors.white,
                      ),
                      title: Text(
                        widget.title,
                        style: TextStyle(
                            color: MyColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen()),
                          );
                        },
                        child: Stack(alignment: Alignment.topRight, children: [
                          Icon(
                            CupertinoIcons.bell,
                            color: MyColors.white,
                          ),
                          SvgPicture.asset(Assets.dot)
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Container(
                        width: 68.w,
                        height: 71.h,
                        child: Image.network(
                            projects?.clientId?.profileImage ?? "",
                            fit: BoxFit.cover),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '${projects?.clientId?.userName ?? "Username"}',
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.white),
                    ),
                    Text(
                      '${timeago.format(DateTime.parse(projects?.createdAt ?? "2023-09-20 12:34:56"), locale: 'en_short')} agoo', //

                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.white),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconContainer(icon: Assets.callWhite),
                        SizedBox(
                          width: 8.w,
                        ),
                        IconContainer(icon: Assets.chatWhite)
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 33.h,
                      ),
                      Text(
                        projects?.title ?? "Project name",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black2),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Text(
                        'Budget',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black),
                      ),
                      Text(
                        '\$${projects?.budget?.min.toString()}-\$${projects?.budget?.max.toString()}' ??
                            '\$1,000 - \$2,000',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'Heading2',
                      //       style: TextStyle(
                      //           fontSize: 12.sp,
                      //           fontWeight: FontWeight.w500,
                      //           color: MyColors.black),
                      //     ),
                      //     Spacer(),
                      //     InkWell(
                      //       onTap: () => Get.to(MapScreen()),
                      //       child: Row(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           SvgPicture.asset(Assets.location),
                      //           SizedBox(width: 4.w),
                      //           Text(
                      //             freelancer?.address ?? '',
                      //             style: TextStyle(
                      //                 fontSize: 12.sp,
                      //                 fontWeight: FontWeight.w500,
                      //                 color: MyColors.blue),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Text(
                        "Experience",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black),
                      ),
                      Text(
                        projects?.experienceLevel ?? "",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black),
                      ),
                      Text(
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: MyColors.black),
                          softWrap: true,
                          projects?.description ??
                              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,"),
                      SizedBox(
                        height: 26.h,
                      ),
                      SizedBox(
                        height: 22,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: projects?.skillsRequired!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CustomizeTagContainer(
                                  tag: projects?.skillsRequired![index] ?? ""),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Divider(
                        color: MyColors.grey1,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
              // freelancer!.personalProjects!.isEmpty ||
              //         freelancer.personalProjects == null
              //     ? Padding(
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 10, vertical: 40),
              //         child: Center(
              //             child: Text("Personal Projects not found",
              //                 style: GoogleFonts.inter(
              //                   textStyle: TextStyle(
              //                       fontSize: 14.sp,
              //                       fontWeight: FontWeight.w400,
              //                       color: MyColors.black1),
              //                 ))),
              //       )
              //     : SizedBox(
              //         height: 300,
              //         child: ListView.builder(
              //           itemCount: project?.length ??
              //               0, // Use project?.length to handle null safely
              //           itemBuilder: (context, index) {
              //             if (project == null || project.isEmpty) {
              //               return Center(
              //                   child: Text(
              //                 "No projects available",
              //                 style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w600,
              //                     color: MyColors.black),
              //               )); // Handle empty case
              //             }

              //             final projectdata = project[index];
              //             debugPrint(
              //                 "Technology ========> ${projectdata.technologiesUsed}");
              //             return Padding(
              //               padding: EdgeInsets.symmetric(horizontal: 10),
              //               child: GestureDetector(
              //                 onTap: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (context) =>
              //                               PersonalProjectDetails(
              //                                 freelancers: widget.freelancers,
              //                               )));
              //                 },
              //                 child: DiscoverContainer1(
              //                   tags: projectdata.technologiesUsed ?? "Skills",
              //                   itemsLength:
              //                       projectdata.technologiesUsed?.length ?? 2,
              //                   text1: projectdata.description ?? "Description",
              //                   image: Assets.bag,
              //                   text3: freelancer?.address ?? "123 stain",
              //                   username: projectdata.projectName ?? "Title",
              //                   // link: projectdata.projectLink ?? "Link",
              //                   time:
              //                       '${projectdata.startDate ?? "Start Date"}-${projectdata.endDate ?? "End Date"} ', // Handle nulls for dates
              //                 ),
              //               ),
              //);
              //   },
              // ),
              //  )
            ]))));
  }
}
