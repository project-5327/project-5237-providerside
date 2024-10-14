import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';
import 'package:project_5237_provider/desktop/home/accepted_message.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:project_5237_provider/provider/date_time_provider.dart';
import 'package:project_5237_provider/provider/home/home_provider.dart';
import 'package:provider/provider.dart';
import '../../presentation/constants/color.dart';
import '../../presentation/constants/strings.dart';
import '../../presentation/screens/login_register/message.dart';
import '../../presentation/screens/my_contracts/send_screen.dart';
import '../../presentation/widgets/Customize_textfield.dart';
import '../../presentation/widgets/customize_button.dart';
import '../../provider/home/proposal_provider.dart';

class AcceptProposalScreen extends StatefulWidget {
  final ProposalListData proposalListData;
  const AcceptProposalScreen({super.key, required this.proposalListData});

  @override
  State<AcceptProposalScreen> createState() => _AcceptProposalScreenState();
}

class _AcceptProposalScreenState extends State<AcceptProposalScreen> {
  String? filePath;
  File? _file;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        filePath = file.path;
        debugPrint("========> file path $filePath");
        _file = File(file.path!);
      });

      print('File Name: $filePath');
      print('File Path: ${file.path}');
      print('File Extension: ${file.extension}');
      print('File Size: ${file.size}');
    } else {
      print('No file selected');
    }
  }

  void removeFile() {
    setState(() {
      filePath = null;
      _file = null;
    });
    print('File removed');
  }

  TextEditingController dateTimeController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ProposalProvider>(
          builder: (context, proposalProvider, child) {
        final dateTimeProvider = Provider.of<DateTimeProvider>(context);
        final homeProvider = Provider.of<HomeProvider>(context);

        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Center(
                child: SizedBox(
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
                              icon: const Icon(
                                Icons.arrow_back_ios,
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
                        readOnly: true,
                        controller: proposalProvider.titleController
                          ..text = widget.proposalListData.title ?? "",
                        text: 'title',
                        title: 'Project title',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a aproject title';
                          }
                          return null;
                        },
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black1),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: CustomTextFormField(
                          readOnly: true,
                          controller: proposalProvider.datetimeController
                            // Convert the DateTime to a formatted string
                            ..text = widget.proposalListData.createdAt != null
                                ? DateFormat('yyyy-MM-dd HH:mm').format(
                                    DateTime.parse(
                                        widget.proposalListData.createdAt ??
                                            ""))
                                : "",
                          text: dateTimeController.text.isEmpty
                              ? AppStrings.selectDateTime
                              : dateTimeController.text,
                          title: AppStrings.dateTime,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black1,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a date and time';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        readOnly: true,
                        keyboardType: TextInputType.number,
                        controller: proposalProvider.rateController
                          ..text = (widget.proposalListData.budget?.max ?? 0)
                              .toString(),
                        text: AppStrings.$100,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a rate';
                          }
                          final num? minRate = num.tryParse(value);
                          if (minRate == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
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
                        readOnly: true,
                        controller: proposalProvider.addressController
                          ..text = "Location",
                        // widget.proposalListData.budget?.max as String,
                        text: AppStrings.inputAddress,
                        title: AppStrings.address,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter address';
                          }

                          return null;
                        },
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
                      Image.network(
                        widget.proposalListData.attachment ??
                            "", // Display the attachment URL
                        height: 88.h,
                        width: 355.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Text('No file uploaded');
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
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: MyColors.grayDark)),
                        height: 114.h,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextFormField(
                            readOnly: true,
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
                            controller: proposalProvider.descriptionController
                              ..text =
                                  widget.proposalListData.description ?? "",
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
                        alignment: Alignment.center,
                        child: CustomizeButton(
                          borderColor: MyColors.btnColor,
                          radius: 100.r,
                          text: AppStrings.accept,
                          height: 45.h,
                          width: 155.w,
                          color: MyColors.btnColor,
                          textColor: MyColors.white,
                          onTap: () async {
                            await proposalProvider.updateProposalN(
                              context: context,
                              status: "Accepted",
                            );

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AcceptedMessage()),
                              (Route<dynamic> route) => false,
                            );
                            homeProvider.removeProposal(
                                widget.proposalListData.sId ?? "");
                          },
                        ),
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
        );
      }),
    );
  }

  void _showDialogeBox(context) {
    final responsive = ResponsiveCheck(context);
    Get.defaultDialog(
      barrierDismissible: false,
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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MessageScreen()),
                    (Route<dynamic> route) =>
                        false, // This will remove all previous routes
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
