import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/screens/update_Project/edit_project.dart';
import 'package:project_5237_provider/provider/freelancer_provider/freelancer_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/color.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import 'package:timeago/timeago.dart' as timeago;

class Editprofile extends StatefulWidget {
  final freelancer;
  const Editprofile({super.key, this.freelancer});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => MainScreen())),
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyColors.black,
            ),
          ),
          title: Text(
            'Edit Your Profile',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                dividerHeight: 0,
                indicator: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: BorderSide(
                      color: MyColors.btnColor,
                      width: 2.w,
                    ),
                  ),
                ),
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Text(
                      'Category 1',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Projects',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
                labelColor: MyColors.btnColor,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    EditFDetails(),
                    ProjectListView(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EditFDetails extends StatefulWidget {
  const EditFDetails({super.key});

  @override
  State<EditFDetails> createState() => _EditFDetailsState();
}

class _EditFDetailsState extends State<EditFDetails> {
  final TextEditingController userController = TextEditingController();
  final GlobalKey<FormState> _editKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final freelancerProvider =
          Provider.of<FreelancerProvider>(context, listen: false);
      freelancerProvider.fetchFreelancerDetail(context);
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        debugPrint('No image selected.');
        _selectedImage = null;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FreelancerProvider>(
      builder: (context, freelancerProvider, child) {
        final freelancer =
            freelancerProvider.freelancerModel?.data?.userDetails;

        return SingleChildScrollView(
          child: Form(
            key: _editKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Stack(
                  children: [
                    SizedBox(
                      height: 158.h,
                      width: 150.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: _selectedImage != null
                              ? Image.file(
                                  _selectedImage!,
                                  height: 148.h,
                                  width: 140.w,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(freelancer?.profileImage ?? "",
                                  height: 148.h,
                                  width: 140.w,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                  print("Error=======> ${error}");
                                  return Image.network(
                                    "https://wallpaperaccess.com/full/7205205.jpg",
                                    fit: BoxFit.cover,
                                  );
                                })),
                    ),
                    Positioned(
                      top: 110,
                      left: 120,
                      child: Container(
                        height: 36.h,
                        width: 34.w,
                        decoration: BoxDecoration(
                          color: MyColors.darkBlue,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.person,
                            size: 22,
                            color: MyColors.white,
                          ),
                          onPressed: _pickImage,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Center(
                  child: CustomTextFormField(
                    readOnly: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid username';
                      }
                      return null;
                    },
                    controller: userController
                      ..text = freelancer?.user?.userName ?? '',
                    //text: freelancer?.user?.userName,
                    title: 'Full Name',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff222222),
                    ),
                    icon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.edit)),
                  ),
                ),
                SizedBox(height: 12.h),
                Center(
                  child: CustomTextFormField(
                    readOnly: true,
                    text: freelancer?.user?.email ?? '',
                    title: 'Email',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff222222),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(height: 30.h),
                if (freelancerProvider.loading)
                  Center(
                      child: CircularProgressIndicator(
                    color: MyColors.btnColor,
                  ))
                else
                  Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: 'Update',
                      height: 40.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () async {
                        bool isUpdated = await freelancerProvider.updateProfile(
                          imagePath: _selectedImage!.path,
                          context: context,
                          username: userController.text,
                        );

                        if (isUpdated) {
                          final updatedData = {
                            'userName': userController.text,
                            'imagePath': _selectedImage!.path,
                          };
                          debugPrint("User data =======> ${updatedData}");
                          debugPrint(
                              " image path=======> ${_selectedImage!.path}");
                          Navigator.pop(context, updatedData);
                        }
                      },
                    ),
                  ),
                SizedBox(height: 53.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProjectListView extends StatefulWidget {
  const ProjectListView({super.key});

  @override
  State<ProjectListView> createState() => _ProjectListViewState();
}

class _ProjectListViewState extends State<ProjectListView> {
  final TextEditingController userController = TextEditingController();
  final FormController formController = FormController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FreelancerProvider>(
        builder: (context, freelancerProvider, child) {
      final freelancer = freelancerProvider.freelancerModel?.data?.userDetails;
      return SingleChildScrollView(
        child: Column(
          children: [
            freelancer != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SizedBox(
                      height: 800.h,
                      child: ListView.builder(
                        itemCount: freelancer?.personalProjects?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final project = freelancer?.personalProjects?[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditProject(
                                            projectDetails: project,
                                          )));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    TextWidget(
                                      text: project?.projectName ?? "",
                                      //personalProject?.projectName ?? "",
                                      color: MyColors.black,
                                      size: 17.sp,
                                      fontweight: FontWeight.w500,
                                    ),
                                    SizedBox(width: 140.w),
                                    TextWidget(
                                      text: timeago.format(
                                        DateTime.tryParse(
                                                project?.startDate ?? "") ??
                                            DateTime.now(),
                                      ),
                                      color: MyColors.grey,
                                      size: 12.sp,
                                      fontweight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                                Text(project?.description ?? "",
                                    softWrap: true,
                                    style: TextStyle(
                                      color: MyColors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      "No Projects found",
                      style: TextStyle(
                          fontSize: 16,
                          color: MyColors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            SizedBox(height: 53.h),
          ],
        ),
      );
    });
  }
}
