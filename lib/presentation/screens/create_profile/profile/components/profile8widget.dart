import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_5237_provider/presentation/constants/responsive_view.dart';

import '../../../../../controller/country_controller.dart';
import '../../../../../controller/form_controller.dart';
import '../../../../../controller/profile_controller.dart';
import '../../../../constants/assets.dart';
import '../../../../constants/color.dart';
import '../../../../constants/strings.dart';
import '../../../../widgets/Customize_textfield.dart';
import '../../../../widgets/customize_button.dart';
import '../../../login_register/login.dart';
import '../../../my_contracts/send_screen.dart';

class Profile8widget extends StatefulWidget {
  const Profile8widget({super.key});

  @override
  State<Profile8widget> createState() => _Profile8widgetState();
}

class _Profile8widgetState extends State<Profile8widget> {
  final formKey = GlobalKey<FormState>();
  final ProfileController profileController = Get.put(ProfileController());
  final FormController formController = Get.put(FormController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final DropdownController dropdownController = Get.put(DropdownController());
  final List<String> countries = ['USA', 'India', 'Canada', 'Japan'];
  final List<String> city = [
    'Delhi',
    'Gurugram',
    'Patiala',
    'Chandigarh',
    'Ludhiana',
    'Bathinda'
  ];

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

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveCheck(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    text: AppStrings.addContactInfo,
                    color: MyColors.black,
                    size: 20.sp,
                    fontweight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextWidget(
                    align: TextAlign.start,
                    text: AppStrings.lorem2,
                    color: MyColors.grey,
                    size: responsive.isMobile ? 10.sp : 13.sp,
                    fontweight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  if (_selectedImage != null)
                    Center(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Image.file(
                        File(_selectedImage!.path),
                        height: responsive.isMobile ? 50.h : 79.h,
                        width: responsive.isMobile ? 50.w : 69.w,
                        fit: BoxFit.cover,
                      ),
                    ))
                  else ...[
                    Stack(children: [
                      Center(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(
                          'assets/images/uploadImage.png',
                          height: responsive.isMobile ? 50.h : 79.h,
                          width: responsive.isMobile ? 50.w : 69.w,
                          fit: BoxFit.cover,
                        ),
                      )),
                      Positioned(
                          top: responsive.isMobile ? 20.0 : 35.0,
                          right: 0.0,
                          left: responsive.isMobile ? 50.0 : 60.0,
                          child: GestureDetector(
                              onTap: () {
                                _pickImage();
                              },
                              child: SvgPicture.asset(Assets.editSqIC)))
                    ]),
                  ],
                  SizedBox(
                    height: 19.h,
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    validator: (value) =>
                        formController.validateUserName(value ?? ''),
                    title: AppStrings.fullName,
                    text: AppStrings.enterHere,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  CustomTextFormField(
                    controller: addressController,
                    validator: (value) =>
                        formController.validateAddress(value ?? ''),
                    title: '${AppStrings.address}*',
                    text: AppStrings.address,
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomTextFormField(
                          controller: zipcodeController,
                          validator: (value) =>
                              formController.validateZipcode(value ?? ''),
                          fillcolor: Color(0xffC4C4C4),
                          title: AppStrings.pincode,
                          text: AppStrings.enterHere,
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Flexible(
                        child: CustomTextFormField(
                          controller: phoneController,
                          validator: (value) =>
                              formController.validatePhone(value ?? ''),
                          fillcolor: Color(0xffC4C4C4),
                          title: AppStrings.phone,
                          text: '+61 | 989876363474',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.city,
                              style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomDropdownContainer(
                            width: 153.w,
                            hint: 'eg, Delhi',
                            selectedValue:
                                dropdownController.getValue('city') ?? '',
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                dropdownController.updateValue(
                                    'city', newValue);
                              }
                            },
                            items: city,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.countryName,
                              style: TextStyle(
                                  color: MyColors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomDropdownContainer(
                              width: 153.w,
                              hint: 'eg,India',
                              selectedValue:
                                  dropdownController.getValue('anotherCountry'),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  dropdownController.updateValue(
                                      'anotherCountry', newValue);
                                }
                              },
                              items: countries),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 31.h,
                  ),
                  Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: AppStrings.finish,
                      height: responsive.isMobile ? 40.h : 45.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          profileController.nextPage();
                          Get.to(() => LoginScreen());
                        }
                      },
                    ),
                  ),
                ]),
          )
        ]);
  }
}
