import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/presentation/screens/login_register/Add_projects.dart';
import 'package:project_5237_provider/presentation/screens/main_screen%20.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../constants/strings.dart';
import '../../widgets/Customize_textfield.dart';
import 'succesfully.dart';

class AddProject1 extends StatefulWidget {
  const AddProject1({super.key});

  @override
  State<AddProject1> createState() => _AddProject1State();
}

class _AddProject1State extends State<AddProject1> {
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

  TextEditingController projectTitleController = TextEditingController();

  TextEditingController projectCataController = TextEditingController();

  TextEditingController skillsController = TextEditingController();
  bool _showOptions = false;
  final TextEditingController _skillsController = TextEditingController();

  final List<String> _options = [
    'Web Design',
    'Mockup',
    'Web Design',
    'Mockup'
  ];
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
          AppStrings.addYourProjects,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  Center(
                    child: CustomTextFormField(
                      controller: projectTitleController,
                      text: AppStrings.enterprojectTitle,
                      title: AppStrings.projectTitle,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black1),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: CustomTextFormField(
                      controller: projectCataController,
                      text: AppStrings.enterprojectCatagory,
                      title: AppStrings.projectcatagory,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black1),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppStrings.attachImage,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.black1),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: _pickImage,
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (_selectedImage != null)
                              Row(
                                children: [
                                  Image.file(
                                    File(_selectedImage!.path),
                                    height: 88.h,
                                    width: 355.w,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              )
                            else ...[
                              Text(
                                AppStrings.addAttachImage,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.lightGrey),
                              ),
                              SvgPicture.asset(Assets.addImage)
                            ],
                          ]),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: MyColors.grayDark)),
                      height: 88.h,
                      width: 355.w,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppStrings.briefDesc,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.black1),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: AppStrings.briefDesc,
                          hintStyle: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: MyColors.lightGrey),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: MyColors.grayDark)),
                    height: 114.h,
                    width: 355.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: TextWidget(
                        text: AppStrings.addMore,
                        color: MyColors.black,
                        size: 13.sp,
                        fontweight: FontWeight.w400,
                      )),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showOptions = !_showOptions;
                          });
                        },
                        child: Center(
                          child: CustomTextFormField(
                            readOnly: true,
                            controller: _skillsController,
                            title: 'Skills',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      if (_showOptions)
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _options.map((option) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _skillsController.text = option;
                                    _showOptions = false;
                                  });
                                },
                                child: Container(
                                  height: 25.h,
                                  width: 80.w,
                                  padding: EdgeInsets.all(4.r),
                                  decoration: BoxDecoration(
                                    color: MyColors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(100.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      option,
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        fontWeight: FontWeight.w400,
                                        color: MyColors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Center(
                    child: CustomizeButton(
                        borderColor: MyColors.btnColor,
                        radius: 100.r,
                        text: AppStrings.continueText,
                        height: 40.h,
                        width: 334.w,
                        color: MyColors.btnColor,
                        textColor: MyColors.white,
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (_) => MainScreen()),
                          // );
                          Get.to(() => AddProjects());
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ))),
    ));
  }
}
