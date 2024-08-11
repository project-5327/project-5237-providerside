import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/login_register/login.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';

import '../../../../controller/profile_controller.dart';
import '../../../constants/assets.dart';
import '../../../constants/color.dart';
import '../../../widgets/create_profile_widget.dart';
import '../../../widgets/customize_button.dart';
import '../../my_contracts/send_screen.dart';

class Profile8 extends StatelessWidget {
  Profile8({super.key});
  final formKey = GlobalKey<FormState>();
  final ProfileController profileController = Get.put(ProfileController());
  final FormController formController = Get.put(FormController());
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
            CreateProfileWidget(),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 15.w,
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: MyColors.blue1,
                                  shape: BoxShape.circle),
                              child: TextWidget(
                                text: 'M',
                                color: MyColors.white,
                                size: 20.sp,
                                fontweight: FontWeight.w700,
                              ),
                              height: 42.h,
                              width: 42.w,
                            ),
                            SizedBox(
                              width: 44.w,
                            ),
                            TextWidget(
                                text: 'Create Profile',
                                color: MyColors.black,
                                size: 24.sp,
                                fontweight: FontWeight.w500),
                          ],
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              Assets.arrowLeft,
                              height: 22.h,
                              width: 11.w,
                              fit: BoxFit.cover,
                            ),
                            TextWidget(
                                text:
                                    '${profileController.currentIndex.value + 1}/8',
                                color: MyColors.black,
                                size: 14.sp,
                                fontweight: FontWeight.w400),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        LinearProgressIndicator(
                          value: (profileController.currentIndex.value + 1) / 8,
                          color: MyColors.btnColor,
                          //   backgroundColor: MyColors.grey,
                          borderRadius: BorderRadius.circular(4.r),
                          minHeight: 5.h,
                          //  valueColor:
                          //MyColors.blue,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        TextWidget(
                          align: TextAlign.start,
                          text: 'Add contact information.',
                          color: MyColors.black,
                          size: 20.sp,
                          fontweight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextWidget(
                          align: TextAlign.start,
                          text:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do  eiusmod.',
                          color: MyColors.black,
                          size: 10.sp,
                          fontweight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: Image.asset(
                              'assets/images/uploadphoto.jpeg',
                              height: 50.h,
                              width: 50.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.w, color: MyColors.black),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Center(
                              child: TextWidget(
                                text: '+Upload Photo',
                                color: MyColors.blue,
                                size: 10.sp,
                                fontweight: FontWeight.w600,
                              ),
                            ),
                            height: 34.h,
                            width: 131.w,
                          ),
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: CustomTextFormField(
                                controller: firstnameController,
                                validator: (value) => formController
                                    .validateFirstName(value ?? ''),
                                // height: 40.h,
                                // width: 153.w,
                                fillcolor: Color(0xffC4C4C4),
                                title: 'First Name',
                                text: 'Adam',
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Flexible(
                              child: CustomTextFormField(
                                controller: lastnameController,
                                validator: (value) => formController
                                    .validateLastName(value ?? ''),
                                // height: 40.h,
                                // width: 153.w,
                                fillcolor: Color(0xffC4C4C4),
                                title: 'Last Name',
                                text: 'Smith',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          controller: addressController,
                          validator: (value) =>
                              formController.validateAddress(value ?? ''),
                          // height: 40.h,
                          // width: 343.w,
                          //fillcolor: Color(0xffC4C4C4),
                          title: 'Address*',
                          text: 'Address',
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: CustomTextFormField(
                                controller: zipcodeController,
                                validator: (value) =>
                                    formController.validateZipcode(value ?? ''),
                                // height: 40.h,
                                // width: 153.w,
                                fillcolor: Color(0xffC4C4C4),
                                title: 'Zip code/ Pincode',
                                text: 'Enter code',
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
                                // height: 40.h,
                                // width: 153.w,
                                fillcolor: Color(0xffC4C4C4),
                                title: 'Phone number',
                                text: '+61 | 989876363474',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: CustomTextFormField(
                                controller: cityController,
                                validator: (value) =>
                                    formController.validateCity(value ?? ''),
                                // height: 40.h,
                                // width: 153.w,
                                fillcolor: Color(0xffC4C4C4),
                                title: 'City Name*',
                                text: 'eg- New Delhi',
                                icon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: MyColors.black,
                                    size: 19.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Flexible(
                              child: CustomTextFormField(
                                controller: countryController,
                                validator: (value) =>
                                    formController.validatecountry(value ?? ''),
                                // height: 40.h,
                                // width: 153.w,
                                fillcolor: Color(0xffC4C4C4),
                                title: 'Country*',
                                text: 'eg,India',
                                icon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: MyColors.black,
                                    size: 19.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 31.h,
                        ),
                        Center(
                          child: CustomizeButton(
                            borderColor: MyColors.btnColor,
                            radius: 100.r,
                            text: 'Next',
                            height: 40.h,
                            width: 334.w,
                            color: MyColors.btnColor,
                            textColor: MyColors.white,
                            onTap: () {
                              formKey.currentState!.validate();
                              profileController.nextPage();
                              Get.to(() => LoginScreen());
                            },
                          ),
                        ),
                        SizedBox(
                          height: 42.h,
                        ),
                      ]),
                ))
          ]))),
    );
  }
}
