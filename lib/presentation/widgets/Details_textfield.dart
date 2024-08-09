import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/presentation/screens/login_register/succesfully.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../constants/assets.dart';
import '../constants/color.dart';
import '../screens/message/otp_screen.dart';
import 'Customize_textfield.dart';
import 'customize_button.dart';

class DetailsTextfield extends StatefulWidget {
  final VoidCallback onTap;
  DetailsTextfield({super.key, required this.onTap});

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

  TextEditingController dateController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController rateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35.h,
        ),
        Center(
          child: CustomTextFormField(
            controller: dateController,
            text: 'Select date & Time',
            title: 'Date & Time',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff222222)),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: CustomTextFormField(
            controller: dateController,
            text: 'Input desired rate',
            title: 'Rate',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff222222)),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
            child: CustomTextFormField(
          controller: addressController,
          text: 'Input Address',
          title: 'Address',
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff222222)),
        )),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Attach Image (if any)',
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff222222)),
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
                      '+ Attach images',
                      style:
                          TextStyle(fontSize: 13.sp, color: MyColors.lightGrey),
                    ),
                    SvgPicture.asset(Assets.addImage)
                  ],
                ]),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xff464646))),
            height: 88.h,
            width: 355.w,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Brief Description',
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff222222)),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Brief Description',
                hintStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff222222)),
              ),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Color(0xff464646))),
          height: 114.h,
          width: 355.w,
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
            alignment: Alignment.topRight,
            child: TextWidget(
              text: 'Add more',
              color: MyColors.black,
              size: 13.sp,
              fontweight: FontWeight.w400,
            )),
        SizedBox(
          height: 24.h,
        ),
        Center(
          child: CustomizeButton(
              borderColor: MyColors.btnColor,
              radius: 100.r,
              text: 'Continue',
              height: 40.h,
              width: 334.w,
              color: MyColors.btnColor,
              textColor: MyColors.white,
              onTap: () {
                Get.to(() => SuccesfullyScreen());
              }),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
