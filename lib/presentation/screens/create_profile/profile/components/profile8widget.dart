import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../../controller/form_controller.dart';
import '../../../../../controller/profile_controller.dart';
import '../../../../../provider/onboarding/onbaording_provider.dart';
import '../../../../constants/assets.dart';
import '../../../../constants/color.dart';
import '../../../../constants/strings.dart';
import '../../../../widgets/Customize_textfield.dart';
import '../../../../widgets/customize_button.dart';

class Profile8widget extends StatefulWidget {
  const Profile8widget({super.key});

  @override
  State<Profile8widget> createState() => _Profile8widgetState();
}

class _Profile8widgetState extends State<Profile8widget> {
  final formKey = GlobalKey<FormState>();
  final ProfileController profileController = Get.put(ProfileController());
  final FormController formController = Get.put(FormController());
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  final List<String> countries = ['USA', 'India', 'Canada', 'Japan'];
  final List<String> city = [
    'Delhi',
    'Gurugram',
    'Patiala',
    'Chandigarh',
    'Ludhiana',
    'Bathinda'
  ];

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
    final responsive =
        MediaQuery.of(context).size.width < 600; // Responsive check
    return Consumer<OnbaordingProvider>(
      builder: (context, onboardingProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 35.h),
                  Text(
                    AppStrings.addContactInfo,
                    style: TextStyle(
                        color: MyColors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    AppStrings.lorem2,
                    style: TextStyle(
                        color: MyColors.grey,
                        fontSize: responsive ? 10.sp : 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundImage: _selectedImage != null
                              ? FileImage(File(_selectedImage!.path))
                                  as ImageProvider
                              : const AssetImage(
                                  'assets/images/uploadImage.png'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: SvgPicture.asset(Assets.editSqIC,
                                height: 30.h, width: 30.w),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 19.h),
                  CustomTextFormField(
                    controller: onboardingProvider.fnameController,
                    validator: (value) =>
                        onboardingProvider.validatefname(value ?? ''),
                    title: AppStrings.firstName,
                    text: AppStrings.enterHere,
                  ),
                  SizedBox(height: 13.h),
                  CustomTextFormField(
                    controller: onboardingProvider.lnameController,
                    validator: (value) =>
                        onboardingProvider.validatelname(value ?? ''),
                    title: AppStrings.lastName,
                    text: AppStrings.enterHere,
                  ),
                  SizedBox(height: 13.h),
                  CustomTextFormField(
                    controller: onboardingProvider.addressController,
                    validator: (value) =>
                        onboardingProvider.validateAddress(value ?? ''),
                    title: '${AppStrings.address}',
                    text: AppStrings.address,
                  ),
                  SizedBox(height: 13.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomTextFormField(
                          controller: onboardingProvider.pincodeController,
                          validator: (value) =>
                              onboardingProvider.validateZipcode(value ?? ''),
                          fillcolor: const Color(0xffC4C4C4),
                          title: AppStrings.pincode,
                          text: AppStrings.enterHere,
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Flexible(
                        child: CustomTextFormField(
                          controller: onboardingProvider.phoneNumberController,
                          validator: (value) =>
                              onboardingProvider.validatePhone(value ?? ''),
                          fillcolor: const Color(0xffC4C4C4),
                          title: AppStrings.phone,
                          text: 'Enter here...',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppStrings.city,
                                  style: TextStyle(
                                      color: MyColors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: 5.h),
                              SizedBox(
                                // width: MediaQuery.of(context).size.width*0.1,
                                height: 80,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    fillColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    focusColor:
                                        Theme.of(context).colorScheme.onPrimary,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      borderSide: BorderSide(
                                        color: MyColors.lightGrey,
                                        width: 1.5,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                        //  color: MyColors.blue,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                  value: city
                                          .contains(onboardingProvider.cityName)
                                      ? onboardingProvider.cityName
                                      : null, // Ensure the value is from the city list
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      onboardingProvider.cityName = newValue!;
                                    });
                                  },
                                  items: city.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  hint: Text('eg, Delhi',
                                      style: TextStyle(
                                          color: MyColors.black,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(width: 15.w),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppStrings.countryName,
                                style: TextStyle(
                                    color: MyColors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 5.h),
                            SizedBox(
                              // width: MediaQuery.of(context).size.width,
                              height: 80,
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  fillColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  focusColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                      color: MyColors.lightGrey,
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                      //    color: MyColors.blue,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                value:
                                    city.contains(onboardingProvider.cityName)
                                        ? onboardingProvider.cityName
                                        : null, //

                                onChanged: (String? newValue) {
                                  setState(() {
                                    onboardingProvider.contryName = newValue!;
                                  });
                                },
                                items: countries.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                hint: Text('eg, India',
                                    style: TextStyle(
                                        color: MyColors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 31.h),
                  Center(
                    child: CustomizeButton(
                      borderColor: MyColors.btnColor,
                      radius: 100.r,
                      text: AppStrings.finish,
                      height: responsive ? 40.h : 45.h,
                      width: 334.w,
                      color: MyColors.btnColor,
                      textColor: MyColors.white,
                      onTap: () {
                        debugPrint(
                            '====>  profile details : ${onboardingProvider.fnameController}');
                        debugPrint(
                            '====>  profile details : ${onboardingProvider.lnameController}');
                        debugPrint(
                            '====>  profile details : ${onboardingProvider.addressController}');
                        debugPrint(
                            '====>  profile details : ${onboardingProvider.pincodeController}');
                        debugPrint(
                            '====>  profile details : ${onboardingProvider.phoneNumberController}');
                        debugPrint(
                            '====>  profile details : ${onboardingProvider.cityController}');
                        debugPrint(
                            '====>  profile details : ${onboardingProvider.countryController}');
                        onboardingProvider.submitUserDetails(context: context);
                        if (formKey.currentState!.validate()) {
                          profileController.nextPage();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 31.h),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
