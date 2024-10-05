import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/data/models/proposal_data_response.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';
import 'package:provider/provider.dart';

import '../../presentation/constants/assets.dart';
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
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  String? filePath;
  File? _file;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        filePath = file.path;
        debugPrint("========> file path $filePath");
        _file = File(file.path!); // Store the selected file
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

  // final List<String> _options = [
  //   'Web Design',
  //   'Mockup',
  //   'Web Design',
  //   'Mockup'
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ProposalProvider>(
          builder: (context, proposalProvider, child) {
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
                        controller: proposalProvider.titleController,
                        text: 'title',
                        title: 'Project title',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: MyColors.black1),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: proposalProvider.datetimeController,
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
                        controller: proposalProvider.rateController,
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
                        controller: proposalProvider.addressController,
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
                          ? Column(
                              children: [
                                // Display the file (image or PDF)
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border:
                                          Border.all(color: MyColors.grayDark)),
                                  height: 88.h,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (filePath!.endsWith('.pdf'))
                                        SvgPicture.asset(
                                          Assets.pdf,
                                          width: 27,
                                          height: 32,
                                        )
                                      else if (_file != null)
                                        Image.file(
                                          _file!,
                                          height: 88.h,
                                          width: 355.w,
                                          fit: BoxFit.cover,
                                        ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                // Button to remove file
                                TextButton(
                                  onPressed: removeFile,
                                  child: Text(
                                    'Remove File',
                                    style: TextStyle(
                                        color: MyColors.red,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            )
                          : InkWell(
                              onTap: pickFile,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: MyColors.lightred)),
                                height: 88.h,
                                width: MediaQuery.of(context).size.height,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppStrings.addAttachImage,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600,
                                            color: MyColors.lightGrey),
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
                          padding: const EdgeInsets.only(left: 8),
                          child: TextField(
                            controller: proposalProvider.descriptionController,
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
                              proposalProvider.setFIle = _file;
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                Provider.of<ProposalProvider>(context,
                                        listen: false)
                                    .createProposals(
                                  context,
                                  widget.proposalListData.sId ?? "",
                                );
                              });
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
                    MaterialPageRoute(builder: (context) => const MessageScreen()),
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
