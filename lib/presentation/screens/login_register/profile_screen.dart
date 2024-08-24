import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';

import '../../../controller/form_controller.dart';
import '../../../controller/profile_controller.dart';
import '../../constants/color.dart';
import '../../constants/strings.dart';
import '../../widgets/Customize_textfield.dart';
import '../../widgets/customize_button.dart';
import 'Add_projects.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final ProfileController profileController = Get.put(ProfileController());
  final FormController formController = Get.put(FormController());
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ImagePicker _picker = ImagePicker();

  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          if (_selectedImage != null)
            Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Image.file(
                File(_selectedImage!.path),
                height: 50.h,
                width: 50.w,
                fit: BoxFit.cover,
              ),
            ))
          else ...[
            Stack(children: [
              Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.asset(
                  'assets/images/uploadImage.png',
                  height: 79.h,
                  width: 79.w,
                  fit: BoxFit.cover,
                ),
              )),
              Positioned(
                  top: 55.0,
                  right: 0.0,
                  left: 70.0,
                  child: GestureDetector(
                      //  iconSize: 20,
                      onTap: () {
                        _pickImage();
                      },
                      child: SvgPicture.asset(Assets.editSqIC)))
            ]),
          ],
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
              title: AppStrings.emailText,
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
    ));
  }
}
