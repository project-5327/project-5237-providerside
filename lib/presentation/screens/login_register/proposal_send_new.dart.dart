import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';
import 'package:project_5237_provider/provider/home/home_provider.dart';
import 'package:provider/provider.dart';

class ProposalSendScreen extends StatefulWidget {
  const ProposalSendScreen({super.key});

  @override
  State<ProposalSendScreen> createState() => _ProposalSendScreenState();
}

class _ProposalSendScreenState extends State<ProposalSendScreen> {
  ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  String? filePath;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        filePath = file.path;
      });
    } else {
      print('No file selected');
    }
  }

  TextEditingController dateTimeController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void dispose() {
    // Dispose of each controller to release resources
    dateTimeController.dispose();
    rateController.dispose();
    addressController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return ResponsiveView(
      mobile: _mobileView(context),
      tablet: _deskTopView(context),
      desktop: _deskTopView(context),
    );
  }

  _mobileView(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Center(
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
                          'Send Proposal',
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
                      text: 'Select date & Time',
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
                      text: "Input desired rate",
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
                        fontWeight: FontWeight.w600,
                        color: MyColors.black1,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: pickFile,
                      child: Container(
                        height: 88.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: MyColors.grayDark),
                        ),
                        child: Center(
                          child: _selectedImage != null
                              ? Image.file(File(_selectedImage!.path),
                                  height: 88.h, fit: BoxFit.cover)
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      AppStrings.addAttachImage,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        color: MyColors.lightGrey,
                                      ),
                                    ),
                                    SvgPicture.asset(Assets.addImage),
                                  ],
                                ),
                        ),
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
                          controller: descriptionController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppStrings.briefDesc,
                            hintStyle: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: MyColors.black1),
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
                    Center(
                        child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: "Send",
                      height: 45.h,
                      width: 155.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: homeProvider.isLoading
                          ? () {} // Provide an empty function when loading
                          : () {
                              final proposalData = {
                                'projectId': '66e9859bdc6a4196ec9e7c28',
                                'userId': '66e283a5bead499cbf15cb45',
                                'proposalTitle': 'testing proposal get',
                                'proposalDescription':
                                    // descriptionController.text,
                                    'I propose a comprehensive web development solution that includes both frontend and backend components.',
                                'estimatedTime': 4,
                                'proposedBudget': "100",
                                // rateController.text.toString(),
                                'status': 'Submitted',
                                'address': "123 stain",
                                //addressController.text,
                                'proposalImage': [
                                  //  _selectedImage!.path,
                                  'https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev//proposals/Screenshot 2024-08-16 160914.png'
                                ],
                                '_id': '66ec0ab238993904863e849c',
                                'createdAt': '2024-09-19T11:27:46.016Z',
                                //dateTimeController.text,
                                'updatedAt': '2024-09-19T11:27:46.016Z',
                                // 'userName': 'asdoe',
                                //'email': 'harshittext3@gmail.com',
                              };

                              // Trigger the API call
                              Provider.of<HomeProvider>(context, listen: false)
                                  .createProposal(
                                context: context,
                                proposalData: proposalData,
                              );
                            },
                    )),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  _deskTopView(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, projectProvider, child) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: Container(
                  width: 500,
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
                                size: 16,
                              )),
                          Text(
                            'Send Proposal',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      CustomTextFormField(
                        controller: dateTimeController,
                        text: "Select date & Time",
                        title: AppStrings.dateTime,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black1),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: rateController,
                        text: "Input desired rate",
                        title: AppStrings.rate,
                        style: TextStyle(
                            fontSize: 13,
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
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black1),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        AppStrings.attachImage,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: MyColors.black1,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      InkWell(
                        onTap: pickFile,
                        child: Container(
                          height: 88.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: MyColors.grayDark),
                          ),
                          child: Center(
                            child: _selectedImage != null
                                ? Image.file(File(_selectedImage!.path),
                                    height: 88.h, fit: BoxFit.cover)
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppStrings.addAttachImage,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: MyColors.lightGrey,
                                        ),
                                      ),
                                      SvgPicture.asset(Assets.addImage),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        AppStrings.briefDesc,
                        style: TextStyle(
                            fontSize: 13,
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
                            controller: descriptionController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: AppStrings.briefDesc,
                              hintStyle: TextStyle(
                                  fontSize: 13,
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
                            text: "Send",
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
    });
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
