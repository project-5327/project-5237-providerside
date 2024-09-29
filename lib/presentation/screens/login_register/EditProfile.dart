import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/provider/freelancer_provider/freelancer_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/color.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import '../message/forget_password.dart';
import 'Add_projects.dart';

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
                    Catagory(),
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

class Catagory extends StatefulWidget {
  Catagory({super.key});

  @override
  State<Catagory> createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory> {
  final TextEditingController userController = TextEditingController();

  final FormController formController = FormController();
  final GlobalKey<FormState> _editKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

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
                        child: _image != null
                            ? Image.file(
                                _image!,
                                height: 148.h,
                                width: 140.w,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                freelancer?.profileImage ?? "",
                                height: 148.h,
                                width: 140.w,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      top: 90,
                      left: 110,
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
                    validator: (value) =>
                        formController.validateUserName(value ?? ''),
                    controller: userController,
                    text: freelancer?.user?.userName,
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
                Center(
                  child: CustomTextFormField(
                    readOnly: false,
                    // validator: (value) =>
                    //     formController.validateEmail(value ?? ''),
                    controller: emailController,
                    text: freelancer?.user?.email,
                    title: 'Email',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff222222),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                // CustomTextFormField(
                //   readOnly: true,
                //   // obscureText: !formController.obscureText.value,
                //   // validator: (value) =>
                //   //     formController.validatePassword(value ?? ''),
                //   controller: passwordController,
                //   text: "***********",
                //   //  freelancer?.user?.password.toString(),
                //   title: 'Password',
                //   style: TextStyle(
                //     fontSize: 13.sp,
                //     fontWeight: FontWeight.w500,
                //     color: Color(0xff222222),
                //   ),
                //   icon: IconButton(
                //     onPressed: () {
                //       formController.togglePasswordVisibility();
                //     },
                //     icon: Icon(
                //       formController.obscureText.value
                //           ? Icons.visibility_off
                //           : Icons.visibility,
                //     ),
                //   ),
                // ),
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
                          // if (userController.text.isNotEmpty && _image != null) {
                          bool isUpdated =
                              await freelancerProvider.updateProfile(
                            imagePath:
                                // "https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev/undefined/Screenshot 2024-07-14 at 16.00.40.png",
                                _image!.path,
                            context: context,
                            username: "harsh",
                            // userController
                            //     .text,
                          );
                          if (isUpdated) {
                            Get.to(MainScreen());
                          }
                        }
                        // },
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

class Catagory2 extends StatelessWidget {
  Catagory2({super.key});
  final TextEditingController userController = TextEditingController();
  final FormController formController = FormController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FreelancerProvider>(
        builder: (context, freelancerProvider, child) {
      final freelancer = freelancerProvider
          .freelancerModel?.data?.userDetails?.personalProjects;
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  itemCount: freelancer?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final projects = freelancer?[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: Row(
                            children: [
                              TextWidget(
                                text: "Project name",
                                color: MyColors.black,
                                size: 17.sp,
                                fontweight: FontWeight.w500,
                              ),
                              SizedBox(
                                width: 100.w,
                              ),
                              TextWidget(
                                text: '17 days ago',
                                color: MyColors.grey,
                                size: 12.sp,
                                fontweight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        TextWidget(
                          text: "Lorem ipsum dolor sit amet consectetur...",
                          color: MyColors.black,
                          size: 12.sp,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 400.h,
                        ),
                      ],
                    );
                  }),
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
                  }),
            ),
            SizedBox(
              height: 53.h,
            ),
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
