import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/data/models/project_model.dart';
import 'package:project_5237_provider/presentation/constants/assets.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/login_register/succesfully.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';
import 'package:project_5237_provider/presentation/widgets/file_picker.dart';
import 'package:project_5237_provider/provider/date_time_provider.dart';
import 'package:project_5237_provider/provider/home/home_provider.dart';
import 'package:provider/provider.dart';

class ProposalSendScreen extends StatefulWidget {
  final Projects? projects;
  const ProposalSendScreen({super.key, this.projects});

  @override
  State<ProposalSendScreen> createState() => _ProposalSendScreenState();
}

class _ProposalSendScreenState extends State<ProposalSendScreen> {
  XFile? _selectedFile;

  final GlobalKey<FormState> _proposalKey = GlobalKey<FormState>();

  TextEditingController dateTimeController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void dispose() {
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
    final dateTimeProvider = Provider.of<DateTimeProvider>(context);

    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // leading: IconButton(
            //   onPressed: () => Get.back(),
            //   icon: Icon(
            //     Icons.arrow_back_ios,
            //     color: MyColors.black,
            //   ),
            // ),
            title: Text(
              'Send Proposal',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: Form(
                  key: _proposalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        readOnly: true,
                        controller: dateTimeController,
                        text: dateTimeProvider.selectedDateTime ??
                            'Select date & Time',
                        title: AppStrings.dateTime,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black1),
                        icon: IconButton(
                            onPressed: () async {
                              await dateTimeProvider.selectDateTime(context);

                              if (dateTimeProvider.selectedDateTime != null) {
                                dateTimeController.text =
                                    dateTimeProvider.selectedDateTime!;
                              }
                            },
                            icon: const Icon(Icons.calendar_month)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a date and time';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        controller: rateController,
                        text: "Input desired rate",
                        title: AppStrings.rate,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black1),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a rate';
                          }
                          final num? minRate = num.tryParse(value);
                          if (minRate == null) {
                            return 'Please enter a valid number';
                          }
                          final regex = RegExp(r'^\d+(\.\d{1,2})?$');
                          if (!regex.hasMatch(value)) {
                            return 'Please enter a valid number with up to 2 decimal places';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.streetAddress,
                        controller: addressController,
                        text: AppStrings.inputAddress,
                        title: AppStrings.address,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black1),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a address';
                          } else if (value.length < 5) {
                            return 'Address is too short';
                          } else if (!RegExp(r"^[a-zA-Z0-9\s,.-]+$")
                              .hasMatch(value)) {
                            return 'Enter a valid address';
                          } else if (value.length > 100) {
                            return 'Address is too long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        AppStrings.attachImage,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.black1,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      FilePickerWidget(
                        onFilePicked: (XFile? file) {
                          setState(() {
                            _selectedFile = file;
                          });
                        },
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
                      TextFormField(
                        maxLines: 3,
                        controller: descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a Description.';
                          }
                          if (value.length < 10) {
                            return 'Project description should be at least 10 characters long';
                          }
                          if (value.length > 500) {
                            return 'Project description should not exceed 500 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorMaxLines: 2,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          hintText: AppStrings.briefDesc,
                          hintStyle: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: MyColors.lightGrey),
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
                        // width: 155.w,
                        color: MyColors.btnColor,
                        textColor: MyColors.white,
                        onTap: homeProvider.isLoading
                            ? () {}
                            : () async {
                                if (_proposalKey.currentState!.validate()) {
                                  final proposalData = {
                                    //  'userId': widget.freelancers?.user?.sId,
                                    'projectId': widget.projects?.sId,
                                    'proposalTitle': widget.projects?.title,
                                    'proposalDescription':
                                        descriptionController.text,
                                    'estimatedTime': 4,
                                    'proposedBudget':
                                        rateController.text.toString(),
                                    'address': addressController.text,
                                    'proposalImage': [
                                      _selectedFile?.path,
                                      //  'https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev//proposals/Screenshot 2024-08-16 160914.png'
                                    ],
                                    'createdAt': dateTimeController.text,
                                  };

                                  try {
                                    bool isSuccessful =
                                        await Provider.of<HomeProvider>(context,
                                                listen: false)
                                            .createProposalN(
                                                context: context,
                                                proposalData: proposalData);

                                    if (isSuccessful) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SuccesfullyScreen()),
                                      );
                                    } else {
                                      print("Proposal creation failed");
                                    }
                                  } catch (e) {
                                    print("Error occurred: $e");
                                  }
                                }
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
                child: SizedBox(
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
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 16,
                              )),
                          const Text(
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
                        readOnly: false,
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
                        readOnly: false,
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
                        readOnly: false,
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
                      FilePickerWidget(
                        onFilePicked: (XFile? file) {
                          setState(() {
                            _selectedFile = file;
                          });
                        },
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
                          padding: const EdgeInsets.only(left: 8),
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
