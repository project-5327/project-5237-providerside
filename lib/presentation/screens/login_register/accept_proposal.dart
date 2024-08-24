import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/form_controller.dart';
import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';

import '../../constants/assets.dart';
import '../../constants/color.dart';
import '../../constants/strings.dart';
import '../../widgets/Customize_textfield.dart';

class AcceptProposal extends StatefulWidget {
  const AcceptProposal({super.key});

  @override
  State<AcceptProposal> createState() => _AcceptProposalState();
}

class _AcceptProposalState extends State<AcceptProposal> {
  TextEditingController skillsController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  final FormController formController = Get.put(FormController());
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
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: MyColors.black,
            ),
          ),
          title: Text(
            AppStrings.acceptProposal,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35.h),
                Center(
                  child: CustomTextFormField(
                    controller: dateController,
                    text: '09/07/2024 & 11:30 AM',
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
                    text: '\$100',
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
                    text: 'Lorem Ipsum is simply dummy text',
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
                  // onTap: _pickImage,
                  child: Container(
                    height: 88.h,
                    width: 355.w,
                    decoration: BoxDecoration(
                      color: MyColors.lightred.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: MyColors.lightred),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.pdfRed,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Image.pdf',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: MyColors.lightGrey,
                                  ),
                                ),
                                Text(
                                  '163kb',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: MyColors.lightGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 130.w,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.clear,
                                  color: MyColors.red,
                                  size: 25.sp,
                                ))
                          ],
                        ),
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
                    border: Border.all(color: MyColors.grayDark),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                    ),
                    child: TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        hintStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.lightGrey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: CustomizeButton(
                    borderColor: MyColors.btnColor,
                    radius: 100.r,
                    text: AppStrings.accept,
                    height: 40.h,
                    width: 334.w,
                    color: MyColors.btnColor,
                    textColor: MyColors.white,
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ));
  }
}
