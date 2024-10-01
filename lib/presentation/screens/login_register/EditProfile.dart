import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/data/models/freelancer_model.dart';
import 'package:project_5237_provider/data/models/proposal_by_user.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/provider/freelancer_provider/freelancer_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/color.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import '../message/forget_password.dart';
import 'Add_projects.dart';
import 'package:timeago/timeago.dart' as timeago;

class Editprofile extends StatefulWidget {
  Editprofile({super.key});

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
                  children: [
                    Category(),
                    Catagory2(),
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

class Category extends StatefulWidget {
  Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _editKey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();
  final FocusNode _focusNode = FocusNode();

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
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        debugPrint('No image selected.');
        _image = null;
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
        final freelancer = freelancerProvider.freelancerModel;

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
                        child: _image != null
                            ? Image.file(
                                _image!,
                                height: 148.h,
                                width: 140.w,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                freelancer?.profileImage ??
                                    "https://s3-alpha-sig.figma.com/img/3f16/acab/f42dbab07ac7002f3428f90210da277d?Expires=1728259200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cMZEA~D1zzHDYPI--zVMXN2IGQHuWUD6UAHMEreq6OaraVmJKvwBtpx2JnWdUWSB5BoR6XHuRiYZXdOnFadnSyFiO326DF5pIFZigIZKpCMCOsB-u9m-kdFtPv8Rkv0ku2xfV72wK6BQfxLzrrNvLwFkxS6hewo18cdDf6qjkkoOpYPuADBVEGvI589cEKqlMFa~EryEJTFBq-TO~yuLZKAp9MOuk2VW9c7x6Pnst7FEUggqqO44g0O4BGdUfkQfyWEVtE2ipzcjExcYORNPRvUY8FWW8v1M0bLtiFWKWPzts~Vm5fKdEJTUhPSbVRNKX-AnqZxjd7nTQJcNPrP~qw__",
                                height: 148.h,
                                width: 140.w,
                                fit: BoxFit.cover,
                              ),
                      ),
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
                    controller: userController,
                    text: freelancer?.user?.userName ?? '',
                    title: 'User Name',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff222222),
                    ),
                    icon: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  ),
                ),
                SizedBox(height: 12.h),

                // Email Field
                Center(
                  child: CustomTextFormField(
                    readOnly: true,
                    controller: emailController,
                    text: freelancer?.user?.email ?? '',
                    title: 'Email',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff222222),
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
                        if (_editKey.currentState!.validate() &&
                            _image != null) {
                          bool isUpdated =
                              await freelancerProvider.updateProfile(
                            imagePath: _image!.path,
                            context: context,
                            username: userController.text,
                          );

                          if (isUpdated) {
                            setState(() {});
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Failed to update profile. Please try again.'),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please enter valid information and select an image'),
                            ),
                          );
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

class Catagory2 extends StatefulWidget {
  Catagory2({super.key});

  @override
  State<Catagory2> createState() => _Catagory2State();
}

class _Catagory2State extends State<Catagory2> {
  final TextEditingController userController = TextEditingController();

  final FormController formController = FormController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final freelancerProvider =
          Provider.of<FreelancerProvider>(context, listen: false);
      freelancerProvider.fetchFreelancerDetail(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FreelancerProvider>(
        builder: (context, freelancerProvider, child) {
      debugPrint(
          "Freelancer Projects ========> ${freelancerProvider.personalProjects}");

      final List<dynamic> personalProjectsList =
          freelancerProvider.freelancerModel?.personalProjects ?? [];

      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 800.h,
                child: freelancerProvider.loading
                    ? Center(
                        child: CircularProgressIndicator(color: MyColors.blue))
                    : personalProjectsList.isEmpty
                        ? Center(
                            child: TextWidget(
                              text: "No Projects found",
                              color: MyColors.black,
                              size: 17.sp,
                              fontweight: FontWeight.w500,
                            ),
                          )
                        : ListView.builder(
                            itemCount: personalProjectsList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final personalProject =
                                  personalProjectsList[index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      TextWidget(
                                        text:
                                            personalProject?.projectName ?? "",
                                        color: MyColors.black,
                                        size: 17.sp,
                                        fontweight: FontWeight.w500,
                                      ),
                                      SizedBox(width: 100.w),
                                      TextWidget(
                                        text: timeago.format(
                                          DateTime.tryParse(
                                                  personalProject?.endDate ??
                                                      "") ??
                                              DateTime.now(),
                                        ),
                                        color: MyColors.grey,
                                        size: 12.sp,
                                        fontweight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  TextWidget(
                                    text: personalProject?.description ??
                                        "No description available.",
                                    color: MyColors.black,
                                    size: 12.sp,
                                    fontweight: FontWeight.w500,
                                  ),
                                ],
                              );
                            },
                          ),
              ),
            ),
            Center(
              child: CustomizeButton(
                borderColor: MyColors.btnColor,
                radius: 100.r,
                text: 'Update',
                height: 40.h,
                width: 334.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                onTap: () {
                  Get.to(MainScreen());
                },
              ),
            ),
            SizedBox(height: 53.h),
          ],
        ),
      );
    });
  }
}
                          

// class Catagory2 extends StatelessWidget {
//   const Catagory2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.h),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               title: TextWidget(
//                 text: 'Project name',
//                 color: MyColors.black,
//                 size: 17,
//                 fontweight: FontWeight.w500,
//               ),
//               subtitle: TextWidget(
//                 text:
//                     "Lorem ipsum dolor sit amet consectetur.Lorem ipsum dolor sit amet consectetur.",
//                 color: MyColors.black,
//                 size: 14,
//                 fontweight: FontWeight.w500,
//               ),
//               trailing: TextWidget(
//                 text: '17 days ago',
//                 color: MyColors.grey,
//                 size: 12,
//                 fontweight: FontWeight.w400,
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Center(
//               child: CustomizeButton(
//                 borderColor: MyColors.btnColor,
//                 radius: 100.r,
//                 text: 'Update',
//                 height: 40.h,
//                 width: 334.w,
//                 color: MyColors.btnColor,
//                 textColor: MyColors.white,
//                 onTap: () {
//                   Get.to(() => AddProjects());
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 53.h,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
