// ignore_for_file: prefer_final_fields

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/toggels.dart';

import '../constants/assets.dart';
import '../constants/color.dart';
import '../constants/strings.dart';

import 'Customize_textfield.dart';
import 'customize_button.dart';

class DetailsTextfield extends StatefulWidget {
  final VoidCallback onTap;
  const DetailsTextfield({super.key, required this.onTap});

  @override
  State<DetailsTextfield> createState() => _DetailsTextfieldState();
}

class _DetailsTextfieldState extends State<DetailsTextfield> {
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

  String selectedExperienceLevel = AppStrings.medium;
  void _updateExperienceLevel(String level) {
    setState(() {
      selectedExperienceLevel = level;
    });
  }

  final TextEditingController _skillsController = TextEditingController();
  bool _showOptions = false;

  final List<String> _options = [
    'Web Design',
    'Mockup',
    'Web Design',
    'Mockup'
  ];
  TextEditingController skillsController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  final FormController formController = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.h),
            Center(
              child: CustomTextFormField(
                controller: dateController,
                text: AppStrings.selectDateTime,
                title: AppStrings.dateTime,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black1,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: CustomTextFormField(
                controller: rateController,
                text: AppStrings.inputDesiredRate,
                title: AppStrings.rate,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black1,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: CustomTextFormField(
                controller: addressController,
                text: AppStrings.inputAddress,
                title: AppStrings.address,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black1,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.attachImage,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black1,
              ),
            ),
            SizedBox(height: 10.h),
            InkWell(
              onTap: _pickImage,
              child: Container(
                height: 88.h,
                width: 355.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MyColors.grayDark),
                ),
                child: Center(
                  child: _selectedImage != null
                      ? Image.file(
                          File(_selectedImage!.path),
                          height: 88.h,
                          width: 355.w,
                          fit: BoxFit.cover,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.addAttachImage,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: MyColors.lightGrey,
                              ),
                            ),
                            SvgPicture.asset(Assets.addImage),
                          ],
                        ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.briefDesc,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black1,
              ),
            ),
            Container(
              height: 114.h,
              width: 355.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: const Color(0xff464646)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppStrings.briefDesc,
                    hintStyle: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: MyColors.lightGrey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.topRight,
              child: TextWidget(
                text: AppStrings.addMore,
                color: MyColors.black,
                size: 13.sp,
                fontweight: FontWeight.w400,
              ),
            ),
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
            SizedBox(height: 10.h),
            Text(
              AppStrings.estimateYourTimeline,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black1,
              ),
            ),
            SizedBox(height: 10.h),
            Toggell1(onExperienceLevelChanged:_updateExperienceLevel ),
            SizedBox(height: 20.h),
            Center(
              child: CustomTextFormField(
                text: 'Ex: 1-6 mnths',
                controller: skillsController,
                title: AppStrings.howLongYourWork,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: MyColors.black1,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              AppStrings.expertiseLevelyou,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black1,
              ),
            ),
            SizedBox(height: 10.h),
            const TimeLineToggel(),
            SizedBox(height: 20.h),
            Text(
              AppStrings.tellUsAbout,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: MyColors.black1,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.from,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: MyColors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              controller: rateController,
                              validator: (value) =>
                                  formController.validateSkills(value ?? ''),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    '\$',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: MyColors.black,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                hintText: '50.00',
                                hintStyle: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 16,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                            ),
                          ),
                          TextWidget(
                            text: '/hr',
                            color: MyColors.black.withOpacity(0.3),
                            size: 13.sp,
                            fontweight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.to,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: MyColors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              controller: rateController,
                              validator: (value) =>
                                  formController.validateSkills(value ?? ''),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  child: Text(
                                    '\$',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: MyColors.black,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                hintText: '100',
                                hintStyle: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 16,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                            ),
                          ),
                          TextWidget(
                            text: '/hr',
                            color: MyColors.black.withOpacity(0.3),
                            size: 13.sp,
                            fontweight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            responsive.isMobile
                ? Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: AppStrings.continueText,
                      height: 40.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: widget.onTap,
                    ),
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: AppStrings.continueText,
                      height: 40.h,
                      width: 120.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: widget.onTap,
                    ),
                  ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
