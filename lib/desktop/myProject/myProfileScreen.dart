import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/form_controller.dart';
import '../../controller/profile_controller.dart';
import '../../presentation/constants/assets.dart';
import '../../presentation/constants/color.dart';
import '../../presentation/constants/responsive_view.dart';
import '../../presentation/constants/strings.dart';
import '../../presentation/widgets/Customize_textfield.dart';
import '../../presentation/widgets/customize_button.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final ProfileController profileController = Get.put(ProfileController());
  final FormController formController = Get.put(FormController());
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ImagePicker _picker = ImagePicker();

  final Rx<XFile?> _selectedImage = Rx<XFile?>(null);

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _selectedImage.value = pickedFile; // Update state using GetX
    }
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveCheck responsiveCheck = ResponsiveCheck(context);

    // Responsive layout using ResponsiveView with specific widgets
    return ResponsiveView(
      mobile: buildMobileProfile(context),
      tablet: buildMobileProfile(context),
      desktop: buildDesktopProfile(context),
    );
  }

  Widget buildDesktopProfile(BuildContext context) {
    // Implement desktop-specific profile UI here
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 340,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => _selectedImage.value != null
                      ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: Image.file(
                              File(_selectedImage.value!.path),
                              height: 50.h,
                              width: 50.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: Image.asset(
                                  'assets/images/uploadImage.png',
                                  height: 79,
                                  width: 79,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 45.0,
                              right: 0.0,
                              left: 70.0,
                              child: GestureDetector(
                                onTap: () {
                                  _pickImage();
                                },
                                child: SvgPicture.asset(
                                  Assets.editSqIC,
                                ),
                              ),
                            )
                          ],
                        ),
                ),
                CustomTextFormField(
                  width: 320,
                  validator: (value) =>
                      formController.validateUserName(value ?? ''),
                  controller: userController,
                  text: AppStrings.enterHere,
                  title: AppStrings.userName,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: MyColors.black1,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomTextFormField(
                  width: 320,
                  validator: (value) =>
                      formController.validateEmail(value ?? ''),
                  controller: emailController,
                  text: AppStrings.enterHere,
                  title: AppStrings.email,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: MyColors.black1,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Obx(
                  () => CustomTextFormField(
                    width: 320,
                    obscureText: formController.obscureText.value,
                    validator: (value) =>
                        formController.validatePassword(value ?? ''),
                    controller: passwordController,
                    text: AppStrings.enterHere,
                    title: AppStrings.passWord1,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.black1,
                    ),
                    icon: IconButton(
                      onPressed: () {
                        formController.togglePasswordVisibility();
                      },
                      icon: Icon(
                        formController.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomizeButton(
                    borderColor: MyColors.btnColor,
                    radius: 100.r,
                    text: AppStrings.save,
                    height: 40.h,
                    width: 151.w,
                    color: MyColors.btnColor,
                    textColor: MyColors.white,
                    onTap: () {
                      //  Get.to(() => AddProjects());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMobileProfile(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyColors.black,
            ),
          ),
          title: Text(
            AppStrings.myProfile,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(children: [
            SizedBox(
              height: 50.h,
            ),
            Obx(
              () => _selectedImage.value != null
                  ? Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.file(
                          File(_selectedImage.value!.path),
                          height: 50.h,
                          width: 50.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Stack(
                      children: [
                        Center(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.r),
                          child: Image.asset(
                            'assets/images/uploadImage.png',
                            height: 79,
                            width: 79,
                            fit: BoxFit.cover,
                          ),
                        )),
                        Positioned(
                          top: 45.0,
                          right: 0.0,
                          left: 70.0,
                          child: GestureDetector(
                            onTap: () {
                              _pickImage();
                            },
                            child: SvgPicture.asset(
                              Assets.editSqIC,
                            ),
                          ),
                        )
                      ],
                    ),
            ),
            Center(
              child: CustomTextFormField(
                validator: (value) =>
                    formController.validateUserName(value ?? ''),
                controller: userController,
                text: AppStrings.enterHere,
                title: AppStrings.userName,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black1,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Center(
              child: CustomTextFormField(
                validator: (value) => formController.validateEmail(value ?? ''),
                controller: emailController,
                text: AppStrings.enterHere,
                title: AppStrings.email,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black1,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Center(
              child: Obx(
                () => CustomTextFormField(
                  obscureText: formController.obscureText.value,
                  validator: (value) =>
                      formController.validatePassword(value ?? ''),
                  controller: passwordController,
                  text: AppStrings.enterHere,
                  title: AppStrings.passWord1,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: MyColors.black1,
                  ),
                  icon: IconButton(
                    onPressed: () {
                      formController.togglePasswordVisibility();
                    },
                    icon: Icon(
                      formController.obscureText.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
            Center(
              child: CustomizeButton(
                borderColor: MyColors.btnColor,
                radius: 100.r,
                text: AppStrings.save,
                height: 40.h,
                width: 334.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                onTap: () {
                  //  Get.to(() => AddProjects());
                },
              ),
            ),
            SizedBox(
              height: 53.h,
            ),
          ]),
        ),
      ),
    );
  }
}
