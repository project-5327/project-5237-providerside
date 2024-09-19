import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';

import '../../presentation/constants/assets.dart';
import '../../presentation/constants/color.dart';
import '../../presentation/constants/strings.dart';
import '../../presentation/widgets/Customize_textfield.dart';
import '../../presentation/widgets/customize_button.dart';

class AcceptProposalScreen extends StatefulWidget {
  const AcceptProposalScreen({super.key});

  @override
  State<AcceptProposalScreen> createState() => _AcceptProposalScreenState();
}

class _AcceptProposalScreenState extends State<AcceptProposalScreen> {
  ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  String? filePath;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        filePath = file.path; // Get the file path
      });

      // You can do additional things with the file such as upload it
      print('File Name: ${filePath}');
      print('File Path: ${file.path}');
      print('File Extension: ${file.extension}');
      print('File Size: ${file.size}');
    } else {
      // User canceled the picker
      print('No file selected');
    }
  }

  TextEditingController dateTimeController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // final List<String> _options = [
  //   'Web Design',
  //   'Mockup',
  //   'Web Design',
  //   'Mockup'
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: Container(
                width: 500.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 16.sp,
                            )),
                        Text(
                          AppStrings.acceptProposal,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    CustomTextFormField(
                      controller: dateTimeController,
                      text: AppStrings.dummyDate,
                      title: AppStrings.dateTime,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black1),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      controller: rateController,
                      text: AppStrings.$100,
                      title: AppStrings.rate,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black1),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      controller: addressController,
                      text: AppStrings.inputAddress,
                      title: AppStrings.address,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black1),
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
                    filePath != null
                        ? InkWell(
                            onTap: pickFile,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: MyColors.grayDark)),
                              height: 88.h,
                              width: double.infinity,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (_selectedImage != null)
                                      Row(
                                        children: [
                                          Image.file(
                                            File(filePath.toString()),
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
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: MyColors.lightred),
                            ),
                            height: 88.h,
                            width: MediaQuery.of(context).size.height,
                            child: SvgPicture.asset(
                              Assets.pdf,
                              width: 27,
                              height: 32,
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: MyColors.grayDark)),
                      height: 114.h,
                      width: double.infinity,
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
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomizeButton(
                          borderColor: MyColors.btnColor,
                          radius: 100.r,
                          text: AppStrings.accept,
                          height: 45.h,
                          width: 155.w,
                          color: MyColors.btnColor,
                          textColor: MyColors.white,
                          onTap: () {
                            _showDialogeBox(context);
                          }),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialogeBox(context) {
    final responsive = ResponsiveCheck(context);
    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 86.h, bottom: 25.h),
      contentPadding: EdgeInsets.symmetric(horizontal: 55.w),
      title: "\$Proposal accepted",
      titleStyle: TextStyle(
          fontSize: 20.sp,
          color: MyColors.btnColor,
          fontWeight: FontWeight.w700),
      content: Column(
        children: [
          SizedBox(
            width: responsive.isMobile || responsive.isTablet
                ? double.infinity
                : 240.w,
            child: TextWidget(
              align: TextAlign.center,
              text:
                  'Lorem ipsum dolor sit amet consectetur. Etiam sollicitudin gravida et ornare.',
              color: MyColors.black1,
              size: 14.sp,
              fontweight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 36.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomizeButton(
                borderColor: MyColors.btnColor,
                radius: 100.r,
                text: AppStrings.message,
                height: 40.h,
                width: 130.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                onTap: () {
                  Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 36.h,
          )
        ],
      ),
    );
  }
}
