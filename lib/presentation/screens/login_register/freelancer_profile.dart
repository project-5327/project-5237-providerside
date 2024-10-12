import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/login_register/EditProfile.dart';
import 'package:project_5237_provider/presentation/screens/login_register/setting_screen.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';
import 'package:project_5237_provider/provider/freelancer_provider/freelancer_provider.dart';
import 'package:provider/provider.dart';

class FreelancerProfile extends StatefulWidget {
  const FreelancerProfile({super.key});

  @override
  State<FreelancerProfile> createState() => _FreelancerProfileState();
}

class _FreelancerProfileState extends State<FreelancerProfile> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final freelancerProvider =
          Provider.of<FreelancerProvider>(context, listen: false);
      freelancerProvider.fetchFreelancerDetail(context).then((_) {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FreelancerProvider>(
        builder: (context, freelancerProvider, child) {
      final freelancer = freelancerProvider.freelancerModel?.data?.userDetails;
      debugPrint(
          "Freelancer image=======> ${freelancer?.profileImage.toString()}");
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyColors.black,
            ),
          ),
          title: Text(
            AppStrings.myProfile,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen()));
                },
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(children: [
              SizedBox(
                height: 50.h,
              ),
              SizedBox(
                  height: 70.h,
                  width: 70.w,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Image.network(
                        freelancer?.profileImage ?? "",
                        height: 70.h,
                        width: 70.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          print("Error=======> ${error}");
                          return Image.network(
                            "https://wallpaperaccess.com/full/7205205.jpg",
                            fit: BoxFit.cover,
                          );
                        },
                      ))),
              Center(
                child: CustomTextFormField(
                  controller: userController,
                  //..text = freelancer?.user?.userName ?? '',
                  text: freelancer?.user?.userName,
                  //  '${freelancer?.firstName ?? ""} ${freelancer?.lastName ?? ""}',
                  title: "Full Name",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: MyColors.black1,
                  ),
                  readOnly: true,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: CustomTextFormField(
                  controller: emailController,
                  //   ..text = client?.user?.email ?? '',
                  text: freelancer?.user?.email ?? '',
                  title: AppStrings.emailText,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: MyColors.black1,
                  ),
                  readOnly: true,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: CustomizeButton(
                  borderColor: MyColors.btnColor,
                  radius: 100.r,
                  text: "Edit",
                  height: 40.h,
                  width: 100.w,
                  color: MyColors.btnColor,
                  textColor: MyColors.white,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Editprofile()));
                  },
                ),
              ),
              SizedBox(
                height: 53.h,
              ),
            ]),
          ),
        ),
      ));
    });
  }
}
