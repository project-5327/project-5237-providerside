import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../provider/onboarding/project_provider.dart';
import '../../../../constants/assets.dart';
import '../../../../constants/color.dart';
import '../../../../constants/responsive_view.dart';
import '../../../../constants/strings.dart';
import '../../../../widgets/Customize_textfield.dart';
import '../../../../widgets/customize_button.dart';
import '../../../../widgets/toggels.dart';
import '../../../my_contracts/send_screen.dart';

class AddProjectComponent extends StatefulWidget {
  const AddProjectComponent({super.key});

  @override
  State<AddProjectComponent> createState() => _AddProjectComponentState();
}

class _AddProjectComponentState extends State<AddProjectComponent> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = pickedFile;
      });
    }
  }

  void _toggleOption(String option) {
    setState(() {
      if (_selectedSkills.contains(option)) {
        _selectedSkills.remove(option);
      } else {
        _selectedSkills.add(option);
      }

      _skillsController.text = _selectedSkills.join(', ');
    });
  }

  bool _showOptions = false;
  final List<String> _options = [
    'Web Design',
    'Mockup',
    'App development',
    'Designing'
  ];
  final List<String> _selectedSkills = [];

  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
//  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return Consumer<ProjectProvider>(
      builder: (context, projectProvider, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: CustomTextFormField(
                    readOnly: false,
                    controller: dateController,
                    text: AppStrings.selectDateTime,
                    title: AppStrings.dateTime,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.black1,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: CustomTextFormField(
                    readOnly: false,
                    controller: addressController,
                    text: AppStrings.inputAddress,
                    title: AppStrings.address,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: MyColors.black1,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an address';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20.h),
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
                  onTap: _pickImage,
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
                SizedBox(height: 20.h),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showOptions =
                              !_showOptions; // Toggle showing options
                        });
                      },
                      child: Center(
                        child: CustomTextFormField(
                          readOnly: true,
                          controller: _skillsController,
                          title: 'Skills',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    if (_showOptions)
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _options.map((option) {
                            bool isSelected = _selectedSkills.contains(option);
                            return GestureDetector(
                              onTap: () {
                                _toggleOption(option);
                              },
                              child: Container(
                                height: 25.h,
                                width: 80.w,
                                padding: EdgeInsets.all(4.r),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? MyColors.black.withOpacity(0.5)
                                      : MyColors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(100.r),
                                  border: Border.all(
                                    color: isSelected
                                        ? MyColors
                                            .black // Highlight selected skill
                                        : Colors.transparent,
                                    width: 1.5.w,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    option,
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                      color: MyColors.black.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 60.h),
                Center(
                  child: CustomizeButton(
                    borderColor: MyColors.btnColor,
                    radius: 100.r,
                    text: AppStrings.continueText,
                    height: 40.h,
                    width: 334.w,
                    color: MyColors.btnColor,
                    textColor: MyColors.white,
                    onTap: projectProvider.loading
                        ? () {} // Provide an empty function when loading
                        : () {
                            final projectData = {
                              'title': 'title',
                              'description': 'desc',
                              'category': ['Web Development', 'E-commerce'],
                              'subCategory': ['Front-end', 'Back-end'],
                              'budget': {
                                'min': 800,
                                'max': 1000,
                              },
                              'skillsRequired': _selectedSkills,
                              'deadline': '2024-12-31T00:00:00.000Z',
                              'experienceLevel': 'medium',
                              "Attachment":
                                  //_selectedImage!.path ??
                                  "https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev//single/Screenshot 2024-08-16 160934.png",
                              'TimelineType': 'medium',
                              'projectTime': [
                                '1-3 months',
                                '3-6 months',
                                '6+ months',
                              ],
                            };

                            // Trigger the API call
                            Provider.of<ProjectProvider>(context, listen: false)
                                .createProject(
                              context: context,
                              projectData: projectData,
                            );
                          },
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AddProjectComponenet1 extends StatefulWidget {
  const AddProjectComponenet1({super.key});

  @override
  State<AddProjectComponenet1> createState() => _AddProjectComponenet1State();
}

class _AddProjectComponenet1State extends State<AddProjectComponenet1> {
  final TextEditingController _skillsController = TextEditingController();
  bool _showOptions = false;

  final List<String> _options = [
    'Web Design',
    'Mockup',
    'Web Design',
    'Mockup'
  ];
  TextEditingController skillsController = TextEditingController();
  TextEditingController projectTimeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  String _selectedValue = 'Option 1';
  final List<String> _dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];
  final _formKey = GlobalKey<FormState>();
  String selectedExperienceLevel = AppStrings.medium;
  void _updateExperienceLevel(String level) {
    setState(() {
      selectedExperienceLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return Consumer<ProjectProvider>(
        builder: (context, projectProvider, child) {
      return Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 35.h),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showOptions = !_showOptions;
                      });
                    },
                    child: Center(
                      child: CustomTextFormField(
                        readOnly: true,
                        controller: _skillsController,
                        title: 'Skills',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  if (_showOptions)
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _options.map((option) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _skillsController.text = option;
                                _showOptions = false;
                              });
                            },
                            child: Container(
                              height: 25.h,
                              width: 80.w,
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                color: MyColors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: Center(
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.black.withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                AppStrings.estimateYourTimeline,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.black1,
                ),
              ),
              SizedBox(height: 10.h),
              Toggell1(onExperienceLevelChanged: _updateExperienceLevel),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: projectTimeController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue!;
                      });
                    },
                    items: _dropdownOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                AppStrings.expertiseLevelyou,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.black1,
                ),
              ),
              SizedBox(height: 10.h),
              const TimeLineToggel(),
              SizedBox(height: 20.h),
              Text(
                AppStrings.tellUsAbout,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.black1,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.from,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: MyColors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                controller: rateController,
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      '\$',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: MyColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  hintText: '50.00',
                                  hintStyle: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 16,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              ),
                            ),
                            TextWidget(
                              text: '/hr',
                              color: MyColors.black.withOpacity(0.3),
                              size: 13.sp,
                              fontweight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.to,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: MyColors.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                controller: rateController,
                                // validator: (value) =>
                                //     formController.validateSkills(value ?? ''),
                                decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      '\$',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: MyColors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  hintText: '100',
                                  hintStyle: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 16,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                              ),
                            ),
                            TextWidget(
                              text: '/hr',
                              color: MyColors.black.withOpacity(0.3),
                              size: 13.sp,
                              fontweight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              // responsive.isMobile
              //     ? Center(
              Center(
                  child: CustomizeButton(
                borderColor: MyColors.btnColor,
                radius: 100.r,
                text: AppStrings.continueText,
                height: 40.h,
                width: 334.w,
                color: MyColors.btnColor,
                textColor: MyColors.white,
                onTap: projectProvider.loading
                    ? () {}
                    : () {
                        final projectData = {
                          'title': 'title',
                          'description': 'desc',
                          'category': ['Web Development', 'E-commerce'],
                          'subCategory': ['Front-end', 'Back-end'],
                          'budget': {
                            'min': 800,
                            'max': 1000,
                          },
                          'skillsRequired': ['JavaScript', 'React', 'Node.js'],
                          'deadline': '2024-12-31T00:00:00.000Z',
                          'experienceLevel': 'medium',
                          'Attachment':
                              'https://pub-261021c7b68740ffba855a7e8a6f3c1e.r2.dev//single/Screenshot 2024-08-16 160934.png',
                          'TimelineType': 'medium',
                          'projectTime': [
                            '1-3 months',
                            '3-6 months',
                            '6+ months',
                          ],
                        };

                        Provider.of<ProjectProvider>(context, listen: false)
                            .createProject(
                          context: context,
                          projectData: projectData,
                        );
                      },
              )),

              //               debugPrint('Project creation success: $success');
              //               if (success) {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => AddProjectDetails2(),
              //                   ),
              //                 );
              //               }
              //             } else {
              //               ScaffoldMessenger.of(context).showSnackBar(
              //                 const SnackBar(
              //                   content: Text(
              //                       'Please fill all the required fields.'),
              //                 ),
              //               );
              //             }
              //           },
              //         ),
              //       )
              //     : Align(
              //         alignment: Alignment.centerRight,
              //         child: CustomizeButton(
              //           borderColor: MyColors.btnColor,
              //           radius: 100.r,
              //           text: "Post",
              //           height: 40.h,
              //           width: 120.w,
              //           color: MyColors.btnColor,
              //           textColor: MyColors.white,
              //           onTap: () {},
              //         ),
              //       ),
              SizedBox(height: 20.h),
            ])),
      );
    });
  }
}
