import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_5237_provider/controller/form_controller.dart';
import 'package:project_5237_provider/presentation/screens/create_profile/create_your_profile.dart';
import 'package:project_5237_provider/presentation/screens/filter/filter.dart';
import 'package:project_5237_provider/presentation/screens/my_contracts/send_screen.dart';
import 'package:project_5237_provider/presentation/widgets/Customize_textfield.dart';
import 'package:project_5237_provider/presentation/widgets/create_profile_widget.dart';

import '../../constants/color.dart';
import '../../widgets/customize_button.dart';
import '../main_screen.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final FormController formcontroller = Get.put(FormController());
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

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
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        controller: firstnameController,
                        validator: (value) =>
                            formcontroller.validateFirstName(value ?? ''),
                        title: 'First Name',
                        text: 'Enter your name',
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      CustomTextFormField(
                        controller: lastNameController,
                        validator: (value) =>
                            formcontroller.validateLastName(value ?? ''),
                        title: 'Last Name',
                        text: 'Enter your name',
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      CustomTextFormField(
                        controller: countryController,
                        validator: (value) =>
                            formcontroller.validatecountry(value ?? ''),
                        text: 'Choose Your Country',
                        icon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_drop_down,
                              size: 22.sp, color: MyColors.black),
                        ),
                      ),
                      SizedBox(
                        height: 47.h,
                      ),
                      Center(
                        child: TextWidget(
                          align: TextAlign.center,
                          text: 'Complete your free account \nsetup',
                          color: MyColors.black,
                          size: 16.sp,
                          fontweight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Center(
                        child: Row(
                          children: [
                            Container(
                              height: 18.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                      width: 2.w,
                                      color: MyColors.black.withOpacity(0.3))),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            TextWidget(
                              text:
                                  'Yes! Send me genuinely useful emails every now \nand \nthen to help me get the most out of Upwork.',
                              color: MyColors.black.withOpacity(0.5),
                              size: 10.sp,
                              fontweight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 18.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                border: Border.all(
                                    width: 2.w,
                                    color: MyColors.black.withOpacity(0.3))),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: 'Yes, I understand and agree to the ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: MyColors.black.withOpacity(0.5),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'UPTECHUNT \nTerms',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFF4C4A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: '\t\t\tof Service, ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Color(0xffFF4C4A),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'including the ',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: MyColors.black.withOpacity(0.5),
                              ),
                            ),
                            TextSpan(
                                text:
                                    'User Agreement and \n\t\tPrivacy Policy. ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: Color(0xffFF4C4A))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Center(
                        child: CustomizeButton(
                          borderColor: MyColors.btnColor,
                          radius: 100.r,
                          text: 'Create your Account',
                          height: 40.h,
                          width: 334.w,
                          color: MyColors.btnColor,
                          textColor: MyColors.white,
                          onTap: () {
                            formKey.currentState!.validate();
                            Get.to(() => CreateYourProfile());
                          },
                        ),
                      ),
                      SizedBox(
                        height: 42.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
