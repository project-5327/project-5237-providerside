import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/customize_button.dart';
import 'package:provider/provider.dart';

import '../../../../../provider/onboarding/onbaording_provider.dart';
import '../../../../constants/assets.dart';
import '../../../../constants/color.dart';
import '../../../../constants/strings.dart';
import '../../../../widgets/Customize_textfield.dart';
import '../profile6.dart';
import '../profile8.dart';

class AddYourPersonalProject extends StatefulWidget {
  const AddYourPersonalProject({super.key});

  @override
  State<AddYourPersonalProject> createState() => _AddYourPersonalProjectState();
}

class _AddYourPersonalProjectState extends State<AddYourPersonalProject> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;
  bool isOngoing = false;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
      });
    }
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

  TextEditingController projectTitleController = TextEditingController();

  TextEditingController projectCataController = TextEditingController();
  final _projectKey = GlobalKey<FormState>();
  TextEditingController skillsController = TextEditingController();
  final bool _showOptions = false;
  final TextEditingController _skillsController = TextEditingController();
  final List<String> _skills = ['JavaScript', 'Node.js', 'MongoDB', 'React'];
  final List<String> _selectedSkills = [];

  final List<String> _options = [
    'Web Design',
    'Mockup',
    'Web Design',
    'Mockup'
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<OnbaordingProvider>(
        builder: (context, onboardingProvider, child) {
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
                child: Form(
                  key: _projectKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35.h,
                      ),
                      Center(
                        child: CustomTextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Project Title cant be empty';
                            }
                            final RegExp regex = RegExp(r'^[a-zA-Z0-9 ]+$');

                            if (!regex.hasMatch(value)) {
                              return "Please enter only letters and numbers";
                            }
                            // if (value.length < 10) {
                            //   return 'Project description should be at least 10 characters long';
                            // }
                            // if (value.length > 500) {
                            //   return 'Project description should not exceed 500 characters';
                            // }
                            return null;
                          },
                          controller: onboardingProvider.projectNameController,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Project description cant be empty';
                            }
                            if (value.length < 10) {
                              return 'Project description should be at least 10 characters long';
                            }
                            if (value.length > 500) {
                              return 'Project description should not exceed 500 characters';
                            }
                            return null;
                          },
                          maxLines: 3,
                          controller:
                              onboardingProvider.projectDescriptionCOntroller,
                          decoration: InputDecoration(
                            hintText: AppStrings.desc,
                            hintStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff2A1E17)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 7),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: GestureDetector(
                            onTap: () => _pickDate(context,
                                onboardingProvider.startDate2Controller),
                            child: AbsorbPointer(
                              child: CustomTextFormField(
                                icon: IconButton(
                                  icon: Icon(CupertinoIcons.calendar),
                                  onPressed: () {},
                                ),
                                errorMessage: 3,
                                text: AppStrings.date,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: MyColors.black),
                                title: AppStrings.startDate,
                                validator: (value) =>
                                    onboardingProvider.validateStartDate(
                                        value ?? '',
                                        onboardingProvider
                                            .endDate2Controller.text),
                                controller:
                                    onboardingProvider.startDate2Controller,
                              ),
                            ),
                          )),
                          SizedBox(
                            width: 5.w,
                          ),
                          Flexible(
                            child: GestureDetector(
                              onTap: () => _pickDate(context,
                                  onboardingProvider.endDate2Controller),
                              child: AbsorbPointer(
                                child: CustomTextFormField(
                                  icon: IconButton(
                                    icon: Icon(CupertinoIcons.calendar),
                                    onPressed: () {},
                                  ),
                                  errorMessage: 3,
                                  text: AppStrings.date,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: MyColors.black),
                                  title: AppStrings.endDate,
                                  validator: (value) =>
                                      onboardingProvider.validateEndDate(
                                          value ?? '',
                                          onboardingProvider
                                              .startDate2Controller.text),
                                  controller:
                                      onboardingProvider.endDate2Controller,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
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
                        height: 10.h,
                      ),
                      Text(
                        'Project Status',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: MyColors.black1,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      const TimeLineToggel1(),
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomizeButton(
                            borderColor: MyColors.btnColor,
                            radius: 100.r,
                            text: AppStrings.privious,
                            height: 45.h,
                            width: 160.w,
                            color: MyColors.white,
                            textColor: MyColors.btnColor,
                            onTap: () {
                              // if (formKey.currentState!.validate()) {
                              /* profileController.previousPage();*/
                              Get.to(() => Profile6());
                              // }
                            },
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomizeButton(
                            borderColor: MyColors.btnColor,
                            radius: 100.r,
                            text: AppStrings.next,
                            height: 45.h,
                            width: 160.w,
                            color: MyColors.btnColor,
                            textColor: MyColors.white,
                            onTap: () {
                              if (_projectKey.currentState!.validate()) {
                                if (_selectedSkills.isEmpty ||
                                    _selectedSkills == []) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Please select at least one skill'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else {
                                  onboardingProvider.addYourPersonalProject(
                                      onboardingProvider
                                          .projectNameController.text,
                                      onboardingProvider
                                          .projectDescriptionCOntroller.text,
                                      onboardingProvider
                                          .startDate2Controller.text,
                                      onboardingProvider
                                          .endDate2Controller.text,
                                      onboardingProvider.setTechnologies =
                                          _selectedSkills,
                                      isOngoing = true);
                                  Get.to(() => const Profile8());
                                }
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200.h,
                      ),
                    ],
                  ),
                ))),
      ));
    });
  }
}

enum TimelineStatus { ongoing, completed }

class TimeLineToggel1 extends StatefulWidget {
  const TimeLineToggel1({super.key});

  @override
  State<TimeLineToggel1> createState() => _TimeLineToggel1State();
}

class _TimeLineToggel1State extends State<TimeLineToggel1> {
  TimelineStatus selectedStatus = TimelineStatus.ongoing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedStatus = TimelineStatus.ongoing;
            });
          },
          child: Row(
            children: [
              SvgPicture.asset(
                selectedStatus == TimelineStatus.ongoing
                    ? Assets.circle_dotIC
                    : Assets.circleIC,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                'Ongoing',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: selectedStatus == TimelineStatus.ongoing
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: MyColors.black3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 20.w),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedStatus = TimelineStatus.completed;
            });
          },
          child: Row(
            children: [
              SvgPicture.asset(
                selectedStatus == TimelineStatus.completed
                    ? Assets.circle_dotIC
                    : Assets.circleIC,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                'Completed',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: selectedStatus == TimelineStatus.completed
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: MyColors.black3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
