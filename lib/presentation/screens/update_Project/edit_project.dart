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

class EditProject extends StatefulWidget {
  const EditProject({super.key});

  @override
  State<EditProject> createState() => _EditProjectState();
}

class _EditProjectState extends State<EditProject> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dscriptionController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  final List<String> _skills = ['JavaScript', 'Node.js', 'MongoDB', 'React'];
  final List<String> _selectedSkills = [];

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
                    SizedBox(
                      height: 35.h,
                    ),
                    Center(
                      child: CustomTextFormField(
                        controller: nameController,
                        text: AppStrings.enterprojectTitle,
                        title: AppStrings.projectTitle,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: MyColors.black),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextWidget(
                      align: TextAlign.start,
                      text: "Description",
                      color: MyColors.black,
                      size: 13.sp,
                      fontweight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: TextFormField(
                        maxLines: 3,
                        controller: dscriptionController,
                        decoration: InputDecoration(
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CustomTextFormField(
                            text: AppStrings.date,
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: MyColors.black),
                            title: AppStrings.startDate,
                            // validator: (value) =>
                            //     onboardingProvider.validateDate(value ?? ''),
                            controller: startController,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Flexible(
                          child: CustomTextFormField(
                            text: AppStrings.date,
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: MyColors.black),
                            title: AppStrings.endDate,
                            // validator: (value) =>
                            //     onboardingProvider.validateDate(value ?? ''),
                            controller: endController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextWidget(
                      align: TextAlign.start,
                      text: AppStrings.yourSkills,
                      color: MyColors.black,
                      size: 13.sp,
                      fontweight: FontWeight.w600,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1,
                      height: 100,
                      //   padding: const EdgeInsets.all(8.0),
                      child: DropDownMultiSelect(
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          focusColor: Theme.of(context).colorScheme.onPrimary,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: MyColors.black, width: 1.5)),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                // color: Color(0xff2A1E17),
                                width: 2.0,
                              )),
                        ),
                        options: _skills,
                        selectedValues: _selectedSkills,
                        onChanged: (List<String> value) {
                          //   value = selectedCheckBoxValue;
                          /* print("====> _selected languagelist ${_selectedLanguages.length}");*/
                        },
                        whenEmpty: 'selct your technologies',
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: "update",
                      height: 45.h,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () async {
                        String projectName = nameController.text;
                        String description = dscriptionController.text;
                        String startDate = startController.text;
                        String endDate = endController.text;
                        List<String> technologies = _selectedSkills;

                        if (projectName.isNotEmpty &&
                            description.isNotEmpty &&
                            startDate.isNotEmpty &&
                            endDate.isNotEmpty) {
                          bool success = await freelancerProvider.updateProject(
                            context: context,
                            projectName: projectName,
                            description: description,
                            startDate: startDate,
                            endDate: endDate,
                            technologies: technologies,
                          );

                          if (success) {
                            debugPrint("Project updated successfully");
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
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ))),
      ));
    });
  }
}
