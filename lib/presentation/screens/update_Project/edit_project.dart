import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_5237_provider/presentation/constants/color.dart';
import 'package:project_5237_provider/presentation/constants/strings.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/components/personal-project.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/profile/profile6.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';
import 'package:project_5237_provider/provider/freelancer_provider/freelancer_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditProject extends StatefulWidget {
  const EditProject({super.key});

  @override
  State<EditProject> createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProject> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  final List<String> _skills = ['JavaScript', 'Node.js', 'MongoDB', 'React'];
  List<String> _selectedSkills = [];
  bool _isLoading = false;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    startController.dispose();
    endController.dispose();
    skillsController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('MMMM yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FreelancerProvider>(
        builder: (context, freelancerProvider, child) {
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
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 35.h),
                    Center(
                      child: CustomTextFormField(
                        errorMessage: 2,
                        controller: nameController,
                        text: AppStrings.enterprojectTitle,
                        title: AppStrings.projectTitle,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextWidget(
                      align: TextAlign.start,
                      text: "Description",
                      color: MyColors.black,
                      size: 13.sp,
                      fontweight: FontWeight.w600,
                    ),
                    SizedBox(height: 5.h),
                    Center(
                      child: TextFormField(
                        maxLines: 3,
                        controller: descriptionController,
                        decoration: InputDecoration(
                          errorMaxLines: 2,
                          hintText: AppStrings.desc,
                          hintStyle: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: MyColors.grey),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 7),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: () => _pickDate(context, startController),
                            child: AbsorbPointer(
                              child: CustomTextFormField(
                                errorMessage: 3,
                                icon: IconButton(
                                  icon: Icon(CupertinoIcons.calendar),
                                  onPressed: () {},
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "This field can't be empty";
                                  }

                                  DateFormat format = DateFormat('MMMM yyyy');

                                  try {
                                    DateTime startDate = format.parse(value);
                                    DateTime endDateTime =
                                        format.parse(endController.text);
                                  } catch (e) {
                                    return "";
                                  }

                                  return null;
                                },
                                text: AppStrings.date,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.black),
                                title: AppStrings.startDate,
                                controller: startController,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Flexible(
                          child: GestureDetector(
                            onTap: () => _pickDate(context, endController),
                            child: AbsorbPointer(
                              child: CustomTextFormField(
                                errorMessage: 3,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "This field can't be empty";
                                  }

                                  DateFormat format = DateFormat('MMMM yyyy');

                                  try {
                                    DateTime endDateTime = format.parse(value);
                                    DateTime startDateTime =
                                        format.parse(startController.text);
                                    if (endDateTime == startDateTime) {
                                      return "End date and start date can't be the same";
                                    }
                                    if (endDateTime.isBefore(startDateTime)) {
                                      return "End date should be later than start date";
                                    }
                                  } catch (e) {
                                    return "";
                                  }

                                  return null;
                                },
                                icon: IconButton(
                                  icon: Icon(CupertinoIcons.calendar),
                                  onPressed: () {},
                                ),
                                text: AppStrings.date,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.black),
                                title: AppStrings.endDate,
                                controller: endController,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    TextWidget(
                      align: TextAlign.start,
                      text: AppStrings.yourSkills,
                      color: MyColors.black,
                      size: 13.sp,
                      fontweight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 100,
                      child: DropDownMultiSelect(
                        options: _skills,
                        selectedValues: _selectedSkills,
                        onChanged: (List<String> value) {
                          setState(() {
                            _selectedSkills = value;
                          });
                        },
                        whenEmpty: 'Select your technologies',
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20),
                    // Text("Selected Skills: ${_selectedSkills.join(", ")}"),
                    SizedBox(height: 100.h),
                    freelancerProvider.loading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: MyColors.blue,
                            ),
                          )
                        : CustomizeButton(
                            borderColor: MyColors.btnColor,
                            radius: 100.r,
                            text: "Update",
                            height: 45.h,
                            color: MyColors.btnColor,
                            textColor: MyColors.white,
                            onTap: () async {
                              String projectName = nameController.text;
                              String description = descriptionController.text;
                              String startDate = startController.text;
                              String endDate = endController.text;
                              List<String> technologies = _selectedSkills;

                              if (projectName.isNotEmpty &&
                                  description.isNotEmpty &&
                                  startDate.isNotEmpty &&
                                  endDate.isNotEmpty) {
                                setState(() {
                                  _isLoading = true;
                                });

                                bool success =
                                    await freelancerProvider.updateProject(
                                  context: context,
                                  projectName: projectName,
                                  description: description,
                                  startDate: startDate,
                                  endDate: endDate,
                                  technologies: technologies,
                                );

                                setState(() {
                                  _isLoading = false;
                                });

                                if (success) {
                                  debugPrint("Project updated successfully");
                                  Get.back();
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill in all fields.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                          ),
                    SizedBox(height: 20.h),
                  ],
                ))),
      ));
    });
  }
}
